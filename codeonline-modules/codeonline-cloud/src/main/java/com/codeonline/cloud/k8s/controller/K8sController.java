package com.codeonline.cloud.k8s.controller;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.log.annotation.Log;
import com.codeonline.common.log.enums.BusinessType;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.cloud.k8s.model.vo.K8sConfigureVo;
import com.codeonline.cloud.k8s.service.IK8sService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/k8s")
public class K8sController {

    @Autowired
    private IK8sService k8sService;

    @Log(title = "k8s控制",businessType = BusinessType.INSERT)
    @PostMapping("/configures/{labId}")
    public AjaxResult createK8sConfigure(@PathVariable String labId,@RequestBody K8sConfigureVo k8sConfigureVo){
        // 设置用户id
        k8sConfigureVo.setUserId(SecurityUtils.getUserId());
        // 设置实验id
        k8sConfigureVo.setLabId(labId);
        return k8sService.createK8sConfigure(k8sConfigureVo);
    }



    @Log(title = "k8s控制",businessType = BusinessType.INSERT)
    @GetMapping("/configures/lab/{labId}")
    public AjaxResult getK8sConfigureByLabId(@PathVariable String labId){
        return k8sService.getK8sConfigureByLabId(labId);
    }

    @Log(title = "k8s控制",businessType = BusinessType.INSERT)
    @PutMapping("/configures/{labId}")
    public AjaxResult updateK8sConfigureByLabId(@PathVariable String labId,@RequestBody K8sConfigureVo k8sConfigureVo){
        k8sConfigureVo.setLabId(labId);
        return k8sService.updateK8sConfigureByLabId(k8sConfigureVo);
    }

    /* 开启容器 */
    @Log(title = "k8s控制",businessType = BusinessType.INSERT)
    @PostMapping("/deployments/{labId}/{userId}")
    public AjaxResult createK8sDeploy(@PathVariable("labId") String labId, @PathVariable Long userId) throws IOException {
        // TODO 安全问题
        if (userId == -1)
            userId = SecurityUtils.getUserId();
        return k8sService.createK8sDeploy(labId,userId);
    }

    /*
    *  启动k8s实验环境
    * */
    @Log(title = "k8s控制",businessType = BusinessType.INSERT)
    @GetMapping("/labStart/{labId}/{userId}")
    public AjaxResult labStart(@PathVariable String labId,@PathVariable Long userId){
        if (userId == -1)
            userId = SecurityUtils.getUserId();
        return k8sService.queryLabSituationByUserId(userId,labId);
    }

    /*
    *  学生删除实验
     */
    @Log(title = "k8s控制",businessType = BusinessType.DELETE)
    @DeleteMapping("/labDelete/{labId}/{userId}")
    public AjaxResult labDelete(@PathVariable String labId,@PathVariable Long userId){
        if (userId == -1)
            userId = SecurityUtils.getUserId();
        return k8sService.deleteLabByStudent(labId,userId);
    }

}
