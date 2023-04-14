package com.codeonline.cloud.harbor.service.Impl;

import com.codeonline.cloud.harbor.mapper.HarborUploadMapper;
import com.codeonline.cloud.harbor.model.HarborUpload;
import com.codeonline.cloud.harbor.service.IUploadService;
import com.codeonline.cloud.shell.ShellMan;
import com.codeonline.cloud.utils.FileUploadUtils;
import com.codeonline.common.core.exception.codeonline.HarborShellException;
import com.codeonline.common.redis.service.RedisService;
import com.codeonline.cloud.harbor.api.RepositoryApi;
import com.codeonline.cloud.harbor.api.model.Repository;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class UploadServiceImpl implements IUploadService {

//    private static final String BaseUrl = "D:/ruoyi/uploadPath/";

    @Autowired
    private ShellMan shellMan;

    @Autowired
    private RedisService redisService;

    @Autowired
    private HarborUploadMapper harborUploadMapper;

    @Autowired
    private RepositoryApi repositoryApi;

    @Value("${harbor.harborUrl}")
    private String harborUrl;
    @Value("${harbor.harborName}")
    private String harborName;
    @Value("${harbor.harborPassword}")
    private String harborPassword;
    @Value("${harbor.harborSpace}")
    private String harborSpace;

    @SneakyThrows
    @Async
    @Override
    public void dockerfileToImageAndPush(HarborUpload harborUpload, String harborKey) {
        // 截取目录和文件名，正则截去http://127.0.0.1:9300/statics/
        String url = harborUpload.getImageUrl();
        String[] split = url.split("http://.*?statics/");
        String path = split[1];
        path = domain + path;
        //TODO 此处假设path为：/root/test/dockerfile123
//        path = "/root/test/codeServer-dockerfile";
        //docker build
        String dockerfileName = harborUpload.getImageName() + ":" + harborUpload.getImageTag();
        String buildCommand = "docker build -f " + path + " -t " + dockerfileName + " .";
        try {
            String buildResult = shellMan.exec(buildCommand);
            System.out.println(buildResult);
        } catch (IOException e) {
            throw new HarborShellException("docker build失败，错误信息：" + e.getMessage());
        }
        //docker push
        pushImage(path, dockerfileName,dockerfileName);
        // 判断是否上传成功
        if (hasPushed(dockerfileName)) {
            // 更新数据库
            harborUploadMapper.insertHarborUpload(harborUpload);
            // 写入到redis
            redisService.setCacheObject(harborKey, "上传成功", 10l, TimeUnit.MINUTES);

        }else {
            redisService.setCacheObject(harborKey, "上传失败", 10l, TimeUnit.MINUTES);
        }


    }

    @SneakyThrows
    @Async
    @Override
    public void loadImageAndPush(HarborUpload harborUpload, String harborKey) {
        /*
        * 截取目录和文件名
        * */
        String url = harborUpload.getImageUrl();
        String[] split = url.split("http://.*?statics/");
        String path = split[1];
        path = domain + path;
        //TODO 此处假设path为：/root/test/base-centos.tar
//        path = "/root/test/jupyter-base.jar";

        /*
        * 使用命令的方式，加载镜像，打标签，登录harbor，再推送到harbor中去
        * */
        String sourceImageName;
        String targetImageName= harborUpload.getImageName() + ":" + harborUpload.getImageTag();
        // 选用load的方式

        String loadCMD = "docker load -i " + path;
        try {
            sourceImageName = shellMan.exec(loadCMD);//Loaded image: base-centos:1.0.0
            sourceImageName = sourceImageName.replace("Loaded image: ", "").replace("\n", "");
        } catch (IOException e) {
            throw new HarborShellException(String.format("加载镜像包失败，命令为:%s，报错信息：%s", loadCMD, e.getMessage()));
        }
        // 推送镜像
        pushImage(path, sourceImageName,targetImageName);
        // 判断是否推送成功
        if (hasPushed(targetImageName)) {
            // 更新数据库
            harborUploadMapper.insertHarborUpload(harborUpload);
            redisService.setCacheObject(harborKey, "上传成功", 10l, TimeUnit.MINUTES);
        }else{
            redisService.setCacheObject(harborKey, "上传失败", 10l, TimeUnit.MINUTES);
        }

    }

    @Override
    public void importImageAndPush(HarborUpload harborUpload, String harborKey) {
        /*
         * 截取目录和文件名
         * */
        String url = harborUpload.getImageUrl();
        String[] split = url.split("http://.*?statics/");
        String path = split[1];
        path = domain + path;
        //TODO 此处假设path为：/root/test/base-centos.tar
//        path = "/root/test/base-vscode.tar";

        /*
         * 使用命令的方式，加载镜像，打标签，登录harbor，再推送到harbor中去
         * */
        String sourceImageName = harborUpload.getImageName() + ":" + harborUpload.getImageTag();
        // 选用import的方式，不用load，因为load不能指定tag
        String importCMD = "docker import " + path + " " + sourceImageName;
        try {
            shellMan.exec(importCMD);//Loaded image: base-centos:1.0.0
        } catch (IOException e) {
            throw new HarborShellException(String.format("加载镜像包失败，命令为:%s，报错信息：%s", importCMD, e.getMessage()));
        }
        // 推送镜像
        pushImage(path, sourceImageName,sourceImageName);
        // 判断是否推送成功
        if (hasPushed(sourceImageName)) {
            // 更新数据库
            harborUploadMapper.insertHarborUpload(harborUpload);
            redisService.setCacheObject(harborKey, "上传成功", 10l, TimeUnit.MINUTES);
        }else{
            redisService.setCacheObject(harborKey, "上传失败", 10l, TimeUnit.MINUTES);
        }
    }


    public void pushImage(String path, String sourceImageName,String targetImageName) {
        // 打标签  SOURCE_IMAGE[:TAG] 192.168.3.77:30002/codeonline-dev/REPOSITORY[:TAG]
        String tagCMD = String.format("docker tag %s %s/%s/%s", sourceImageName, harborUrl, harborSpace, targetImageName);
        try {
            shellMan.exec(tagCMD);
        } catch (IOException e) {
            throw new HarborShellException(String.format("打标签失败，镜像名：%s，命令为:%s，报错信息为%s", sourceImageName, tagCMD, e.getMessage()));
        }
        // 登录harbor
        String loginCMD = String.format("docker login %s -u %s -p %s", harborUrl, harborName, harborPassword);
        try {
            String tagResult = shellMan.exec(loginCMD);//Login Succeeded
            //如果不包含Login Succeeded则说明登录失败
            if (!tagResult.contains("Login Succeeded")) {
                throw new HarborShellException(String.format("登录harbor失败，报错信息为%s", tagResult));
            }
        } catch (IOException e) {
            throw new HarborShellException(String.format("登录harbor失败，报错信息为%s", e.getMessage()));
        }
        // 推送到harbor docker push 192.168.3.77:30002/codeonline-all/REPOSITORY[:TAG]
        String pushCMD = String.format("docker push %s/%s/%s", harborUrl, harborSpace, targetImageName);
        try {
            shellMan.exec(pushCMD);
        } catch (IOException e) {
            throw new HarborShellException(String.format("推送到harbor失败，命令为:%s，报错信息为%s", pushCMD, e.getMessage()));
        }
        // 删除本地镜像
        String deleteCMD1 = String.format("docker rmi %s", sourceImageName);
        String deleteCMD2 = String.format("docker rmi %s/%s/%s", harborUrl, harborSpace, targetImageName);

        try {
            shellMan.exec(deleteCMD1);
            shellMan.exec(deleteCMD2);
        } catch (IOException e) {
            throw new HarborShellException(String.format("删除本地镜像失败，命令为:%s;%s，报错信息为%s", deleteCMD1,deleteCMD2, e.getMessage()));
        }
        // 删除本地打了标签的镜像
        String deleteTagCMD = String.format("docker rmi %s/%s/%s", harborUrl, harborSpace, sourceImageName);
        try {
            shellMan.exec(deleteTagCMD);
        } catch (IOException e) {
            throw new HarborShellException(String.format("删除本地打了标签的镜像失败，命令为:%s，报错信息为%s", deleteTagCMD, e.getMessage()));
        }
        // 删除本地镜像包
        File file = new File(path);
        if (file.exists()) {
            file.delete();
        }
    }


    private boolean hasPushed(String sourceImageName) {
        // 判断是否已经推送过
        String name = sourceImageName.split(":")[0];
        String tag = sourceImageName.split(":")[1];
        Repository repository = repositoryApi.getRepository(name);
        if (repository == null) {
            return false;
        }
        List<String> repositoryTags = repositoryApi.getRepositoryTags(name);

        return repositoryTags.stream().anyMatch(tag::equals);


    }



    /**
     * 资源映射路径 前缀
     */
    @Value("${file.prefix}")
    public String localFilePrefix;

    /**
     * 域名或本机访问地址
     */
    @Value("${file.domain}")
    public String domain;

    /**
     * 上传文件存储在本地的根路径
     */
    @Value("${file.path}")
    private String localFilePath;

    /**
     * 本地文件上传接口
     *
     * @param file 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    @Override
    public String uploadFile(MultipartFile file) throws Exception
    {
        String name = FileUploadUtils.upload(localFilePath, file);
        String url = domain + localFilePrefix + name;
        return url;
    }
}