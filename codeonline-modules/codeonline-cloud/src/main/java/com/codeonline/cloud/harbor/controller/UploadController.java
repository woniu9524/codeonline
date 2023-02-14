package com.codeonline.cloud.harbor.controller;

import com.codeonline.cloud.harbor.model.HarborUpload;
import com.codeonline.cloud.harbor.service.IUploadService;
import com.codeonline.cloud.harbor.vo.HarborUploadVo;
import com.codeonline.common.core.constant.CacheConstants;
import com.codeonline.common.core.constant.Constants;
import com.codeonline.common.core.domain.R;
import com.codeonline.common.core.utils.DateUtils;
import com.codeonline.common.core.utils.StringUtils;
import com.codeonline.common.core.utils.uuid.IdUtils;
import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.log.annotation.Log;
import com.codeonline.common.log.enums.BusinessType;
import com.codeonline.common.redis.service.RedisService;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.system.api.RemoteFileService;
import com.codeonline.system.api.domain.SysFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/harbor/upload")
public class UploadController {

    @Autowired
    private RemoteFileService remoteFileService;

    @Autowired
    private IUploadService uploadService;

    @Autowired
    private RedisService redisService;

    //上传文件
    @Log(title = "harbor上传",businessType = BusinessType.INSERT)
    @PostMapping("/file")
    public AjaxResult uploadFilde(@RequestParam("file") MultipartFile uploadFile) {
        R<SysFile> result = remoteFileService.upload(uploadFile);
        if (result.getCode()==200){
            // 缓存文件信息
            String uuid = IdUtils.simpleUUID();
            String fileKey = CacheConstants.HARBOR_FILE_KEY + uuid;
            redisService.setCacheObject(fileKey, result.getData().getUrl(), Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);//不直接返回url，防止泄露
            return AjaxResult.success(uuid);
        }
        return AjaxResult.error(result.getMsg());
    }

    //上傳表單
    @Log(title = "harbor上传",businessType = BusinessType.INSERT)
    @PostMapping("/table")
    public AjaxResult uploadTable(@RequestBody @Validated HarborUploadVo harborUploadVo) {
        // 通过uuid获取文件信息
        String fileKey = CacheConstants.HARBOR_FILE_KEY + harborUploadVo.getUuid();
        String url = redisService.getCacheObject(fileKey);
        if (url == null) {
            return AjaxResult.error("文件不存在");
        }
        harborUploadVo.setUrl(url);
        // 獲取用戶ID和用户名
        Long userid =SecurityUtils.getUserId();
        String username = SecurityUtils.getUsername();
        // 儅沒有名字的時候隨便寫個名字
        if(StringUtils.isEmpty(harborUploadVo.getEnvironmentName())){
            harborUploadVo.setEnvironmentName(IdUtils.simpleUUID());
        }
        if(StringUtils.isEmpty(harborUploadVo.getTag())){
            harborUploadVo.setTag("randomTag");
        }

        // 将信息放到HarborUpload中
        HarborUpload harborUpload = new HarborUpload();
        harborUpload.setImageName(userid +"_"+harborUploadVo.getEnvironmentName());
        harborUpload.setImageTag(harborUploadVo.getTag());
        harborUpload.setImageUrl(url);
        harborUpload.setPublic(harborUploadVo.isPublic());
        harborUpload.setUserId(userid);
        harborUpload.setCreateBy(username);
        harborUpload.setUpdateBy(username);
        harborUpload.setCreateTime(DateUtils.getNowDate());
        harborUpload.setUpdateTime(DateUtils.getNowDate());
        harborUpload.setIntroduce(harborUploadVo.getIntroduce());
        // 因为要使用异步，所以先生成一个uuid，然后将信息放到redis中，然后返回uuid，前端轮询，当redis中有信息的时候，就返回信息
        String uuid = IdUtils.simpleUUID();
        String harborKey = CacheConstants.HARBOR_ASYNC_UPLOAD_KEY + uuid;
        Map<String, String> resultMap = new HashMap<>();
        resultMap.put("uploadToken", uuid);
        //判断是dockerfile还是镜像文件
        switch (harborUploadVo.getUploadType()){
            case "dockerfile":
                uploadService.dockerfileToImageAndPush(harborUpload,harborKey);
                break;
            case "image":
                uploadService.loadImageAndPush(harborUpload,harborKey);
                break;
            case "container":
                uploadService.importImageAndPush(harborUpload,harborKey);
                break;
            default:
                return AjaxResult.error("上传类型错误");
        }
        return AjaxResult.success(resultMap);

    }

    @Log(title = "harbor上传",businessType = BusinessType.INSERT)
    @GetMapping("/status/{uploadToken}")
    public AjaxResult getUploadStatus(@PathVariable String uploadToken) {
        String harborKey = CacheConstants.HARBOR_ASYNC_UPLOAD_KEY + uploadToken;
        String result = redisService.getCacheObject(harborKey);
        Map<String, String> resultMap = new HashMap<>();

        if (result == null) {
            resultMap.put("status", "上传中");
        }else {
            resultMap.put("status", result);
        }
        return AjaxResult.success(resultMap);
    }
}
