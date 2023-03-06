package com.codeonline.function.service.course;

import com.codeonline.common.core.web.domain.AjaxResult;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/27 19:48 星期一
 * @Description:
 */
public interface LabService {
    public AjaxResult queryExperimentInfo(Long experimentId);

    AjaxResult queryAllStudentLabInfo(Long labId);
}
