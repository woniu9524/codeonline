package com.codeonline.cloud.k8s.service;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.cloud.k8s.model.vo.K8sConfigureVo;

import java.io.IOException;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/8 3:09 星期日
 * @Description:
 */
public interface IK8sService {
    AjaxResult createK8sConfigure(K8sConfigureVo k8sConfigureVo);

    AjaxResult createK8sDeploy(String labId,Long studentId) throws IOException;

    // 根据labId获取k8s配置信息
    AjaxResult getK8sConfigureByLabId(String labId);

    // 根据labId更新k8s配置信息
    AjaxResult updateK8sConfigureByLabId(K8sConfigureVo k8sConfigureVo);

    // 查询个人实验情况
    AjaxResult queryLabSituationByUserId(Long userId, String labId);

    // 学生删除实验
    AjaxResult deleteLabByStudent(String labId, Long userId);

}
