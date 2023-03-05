package com.codeonline.function.service.personal;

import com.codeonline.common.core.web.domain.AjaxResult;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/5 10:38 星期日
 * @Description:
 */
public interface CurriculumService {
    /* 查询当前学生的所有课程 */
    AjaxResult queryCurriculumByStudentId(Long studentId);

}
