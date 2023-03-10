package com.codeonline.function.service.course;

import com.codeonline.common.core.web.domain.AjaxResult;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/27 19:48 ζζδΈ
 * @Description:
 */
public interface LabService {
    public AjaxResult queryExperimentInfo(Long experimentId);

    AjaxResult queryAllStudentLabInfo(Long labId);

    AjaxResult submitExperimentScore(Long experimentId,Long studentId, Integer score, String comment);

    AjaxResult queryExperimentScore(Long experimentId, Long studentId);
}
