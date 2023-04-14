package com.codeonline.cloud.k8s.service.Impl;

import com.alibaba.nacos.shaded.com.google.gson.Gson;
import com.codeonline.cloud.k8s.service.IK8sService;
import com.codeonline.cloud.k8s.model.*;
import com.codeonline.common.core.constant.CloudConstants;
import com.codeonline.common.core.utils.StringUtils;
import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.cloud.k8s.mapper.K8sMapper;
import com.codeonline.cloud.k8s.model.vo.K8sConfigureVo;
import com.codeonline.cloud.shell.ShellMan;
import com.codeonline.cloud.utils.K8sUtil;
import io.fabric8.kubernetes.api.model.ServicePort;
import io.fabric8.kubernetes.api.model.apps.Deployment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/8 3:10 星期日
 * @Description:
 */
@Service
public class K8sServiceImpl implements IK8sService {
    @Autowired
    private K8sUtil k8sUtil;

    @Autowired
    private ShellMan shellMan;

    @Value("${harbor.harborUrl}")
    private String harborUrl;
    @Value("${harbor.harborSpace}")
    private String harborSpace;
    @Value("${nfs.server}")
    private String nfsServer;
    @Value("${nfs.path}")
    private String nfsPath;

    @Value("${masterIp}")
    private String masterIp;

    @Autowired
    private K8sMapper k8sMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult createK8sConfigure(K8sConfigureVo k8sConfigureVo) {
        K8sConfigure k8sConfigure;
        // 使用Gson通过序列化的方式将k8sConfigureVo转换为k8sConfigure
        k8sConfigure= new Gson().fromJson(new Gson().toJson(k8sConfigureVo),K8sConfigure.class);
        // 将k8sConfigure转成json字符串
        String configure = new Gson().toJson(k8sConfigure);
        K8sConfigureJson k8sConfigureJson = new K8sConfigureJson();
        k8sConfigureJson.setConfigure(configure);
        // 查询是否已经存在
        Long id = k8sMapper.selectK8sConfigure(k8sConfigureJson);
        if (id != null){
            k8sConfigureJson.setId(id);
        }else {
            // 将json字符串插入数据库
            k8sMapper.insertK8sConfigure(k8sConfigureJson);
        }
        K8sConfigureRelation k8sConfigureRelation = new K8sConfigureRelation();
        k8sConfigureRelation.setUserId(k8sConfigureVo.getUserId());
        k8sConfigureRelation.setConfigureId(k8sConfigureJson.getId());
        k8sConfigureRelation.setHasPublic(k8sConfigureVo.isHasPublic());
        k8sConfigureRelation.setLabId(k8sConfigureVo.getLabId());
        // 将关系插入数据库
        k8sMapper.insertK8sConfigureRelation(k8sConfigureRelation);

        return AjaxResult.success();

    }

    @Override
    public AjaxResult createK8sDeploy(String labId,Long studentId) throws IOException {

        // 读取teacherId
        Long teacherId = k8sMapper.selectUserIdByLabId(labId);

        String studentName = SecurityUtils.getUsername();
        K8sUserAndDeployRelation relation = k8sMapper.selectK8sUserAndDeployRelationByLabIdAndUserId(labId, studentId);
        if (relation != null && !relation.isHasDestroy()){
            return AjaxResult.error("已经创建过了");
        }
        // 读取配置文件
        String k8sConfigureJsonString = k8sMapper.selectK8sConfigureByLabId(labId);
        // 将json字符串转换为k8sConfigure
        K8sConfigure k8sConfigure = new Gson().fromJson(k8sConfigureJsonString,K8sConfigure.class);

        // 创建k8s部署
        Deployment deployment = k8sUtil.createDeployment(populateDeployment(k8sConfigure, labId, teacherId, studentId));
        if(deployment==null){
            return AjaxResult.error("创建失败");
        }
        // 创建k8s服务
        io.fabric8.kubernetes.api.model.Service service = null;
        if(!k8sConfigure.getPorts().isEmpty()){
            service = k8sUtil.createService(populateService(k8sConfigure, labId, teacherId, studentId));
            if(service==null){
                k8sUtil.deleteDeployment(deployment);
                return AjaxResult.error("创建失败");
            }
        }
        // 写入数据库
        String deploymentName = deployment.getMetadata().getName();
        String serviceName = service==null?null:service.getMetadata().getName();
        K8sUserAndDeployRelation k8sUserAndDeployRelation = new K8sUserAndDeployRelation();
        k8sUserAndDeployRelation.setLabId(labId);
        k8sUserAndDeployRelation.setUserId(studentId);
        k8sUserAndDeployRelation.setTeacherId(teacherId);
        k8sUserAndDeployRelation.setDeploymentName(deploymentName);
        k8sUserAndDeployRelation.setServiceName(serviceName);
        k8sUserAndDeployRelation.setDeployNamespace(CloudConstants.K8S_NAMESPACE);
        k8sUserAndDeployRelation.setCreateBy(studentName);
        k8sUserAndDeployRelation.setUpdateBy(studentName);
        k8sUserAndDeployRelation.setK8sConfigure(k8sConfigure);
        if (relation == null){
            // 插入数据库
            k8sMapper.insertK8sUserAndDeployRelation(k8sUserAndDeployRelation);
        }else{
            // 更新数据库
            k8sMapper.updateK8sUserAndDeployRelation(k8sUserAndDeployRelation);
        }

        return AjaxResult.success(k8sUserAndDeployRelation);
    }

    @Override
    public AjaxResult getK8sConfigureByLabId(String labId) {
        // 读取配置文件
        String k8sConfigureJsonString = k8sMapper.selectK8sConfigureByLabId(labId);
        // 将json字符串转换为k8sConfigure
        K8sConfigure k8sConfigure = new Gson().fromJson(k8sConfigureJsonString,K8sConfigure.class);
        return AjaxResult.success(k8sConfigure);
    }

    @Override
    public AjaxResult updateK8sConfigureByLabId(K8sConfigureVo k8sConfigureVo) {
        K8sConfigure k8sConfigure;
        // 使用Gson通过序列化的方式将k8sConfigureVo转换为k8sConfigure
        k8sConfigure= new Gson().fromJson(new Gson().toJson(k8sConfigureVo),K8sConfigure.class);
        // 将k8sConfigure转成json字符串
        String configure = new Gson().toJson(k8sConfigure);
        if (k8sMapper.updateK8sConfigureByLabId(k8sConfigureVo.getLabId(),configure) > 0){
            return AjaxResult.success("更新成功");
        }
        return AjaxResult.error();
    }

    @Override
    public AjaxResult queryLabSituationByUserId(Long userId, String labId) {
        K8sUserAndDeployRelation k8sUserAndDeployRelation = k8sMapper.selectK8sUserAndDeployRelationByLabIdAndUserId(labId, userId);
        if (k8sUserAndDeployRelation == null || k8sUserAndDeployRelation.isHasDestroy()){
            return AjaxResult.error("未创建，请先创建");
        }
//        // 读取配置文件
        String k8sConfigureJsonString = k8sMapper.selectK8sConfigureByLabId(labId);
//        // 将json字符串转换为k8sConfigure
        K8sConfigure k8sConfigure = new Gson().fromJson(k8sConfigureJsonString,K8sConfigure.class);
        // 读取service
        io.fabric8.kubernetes.api.model.Service service = k8sUtil.getService(k8sUserAndDeployRelation.getServiceName());
        // 读取servicePort
        List<ServicePort> servicePorts = k8sUtil.getServicePort(k8sUserAndDeployRelation.getServiceName());
        // 生成端口映射
        List<Map<String,Object>> maps = new ArrayList<>();
        for (ServicePort servicePort : servicePorts) {
            Map<String,Object> map = new HashMap<>();
            Integer port = servicePort.getPort();
            Integer targetPort = servicePort.getTargetPort().getIntVal();
            Integer nodePort = servicePort.getNodePort();
            List<Map<String, String>> ports = k8sConfigure.getPorts();
            for (Map<String, String> portMap : ports) {
                if (port.toString().equals(portMap.get("port")) && targetPort.toString().equals(portMap.get("targetPort"))){
                    map.put("port",port);
                    map.put("targetPort",targetPort);
                    map.put("nodePort",nodePort);
                    map.put("service",portMap.get("service"));
                    if("vscode".equals(portMap.get("service"))||"http".equals(portMap.get("service"))){
                        map.put("url","http://"+masterIp+":"+nodePort);
                    }else if("jupyter".equals(portMap.get("service"))){
                        map.put("url","http://"+masterIp+":"+nodePort);
                    }
                    maps.add(map);
                }
            }
        }

        return AjaxResult.success(maps);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteLabByStudent(String labId, Long userId) {
        K8sUserAndDeployRelation k8sUserAndDeployRelation = k8sMapper.selectK8sUserAndDeployRelationByLabIdAndUserId(labId, userId);
        if (k8sUserAndDeployRelation == null){
            return AjaxResult.error("未创建，不需要删除");
        }else if(k8sUserAndDeployRelation.isHasDestroy()){
            return AjaxResult.error("已销毁，不需要删除");
        }
        // 删除deployment
        k8sUtil.deleteDeployment(k8sUserAndDeployRelation.getDeploymentName());
        k8sUtil.deleteService(k8sUserAndDeployRelation.getServiceName());
        k8sMapper.deleteLabByStudent(labId,userId);
        return AjaxResult.success("删除成功");
    }

    public Deployment populateDeployment(K8sConfigure k8sConfigure, String labId, Long teacherId, Long studentId) throws IOException {
        // 修改imageName
        if("harbor".equals(k8sConfigure.getSourceFrom())){
            String imageName=k8sConfigure.getImageName();
            k8sConfigure.setImageName(harborUrl+"/"+harborSpace+"/"+imageName);
        }
        // 提前创建nfs目录
        String nfsPathNew = this.nfsPath + "/" + teacherId + "/" + labId+ "/" + studentId;
        if(!StringUtils.isEmpty(k8sConfigure.getVolume())){
            shellMan.exec("mkdir -p "+nfsPathNew,true);
            shellMan.exec("chmod 777 "+nfsPathNew,true);
        }

        K8sDeployment k8sDeployment = new K8sDeployment(k8sConfigure,labId,String.valueOf(studentId),String.valueOf(teacherId),nfsPathNew,nfsServer);
        return k8sDeployment.populate();
    }

    public io.fabric8.kubernetes.api.model.Service populateService(K8sConfigure k8sConfigure, String labId, Long teacherId, Long studentId) throws IOException {
        // 获取NodePorts
        List<Map<String,Integer>> ports=new ArrayList<>();
        for (Map<String, String> portMap : k8sConfigure.getPorts()) {
            Map<String,Integer> port=new HashMap<>();
            if (!"no".equals(portMap.get("service"))){
//                port.put("nodePort",k8sUtil.readNodePortCanUse());
            }
            port.put("port", Integer.valueOf(portMap.get("port")));
            port.put("targetPort", Integer.valueOf(portMap.get("targetPort")));
            ports.add(port);
        }
        // 创建service
        K8sService k8sService = new K8sService(k8sConfigure,labId,String.valueOf(studentId),String.valueOf(teacherId),ports);
        return k8sService.populate();
    }
}