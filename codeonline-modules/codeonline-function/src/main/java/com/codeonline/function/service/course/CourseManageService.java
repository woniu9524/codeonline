package com.codeonline.function.service.course;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.Lab;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/9 4:00 星期四
 * @Description:
 */
public interface CourseManageService {

    AjaxResult queryCourseInfo(Long courseId);

    AjaxResult addStudentToCourse(Long courseId, Long studentId);

    AjaxResult deleteStudentToCourse(Long courseId, Long studentId);

    AjaxResult queryStudentsByCourseId(Long courseId);

    AjaxResult queryExperimentsByCourseId(Long courseId);

    AjaxResult addExperimentToCourse(Lab experiments);

    AjaxResult updateExperimentFromCourse(Lab experiments);

    AjaxResult deleteExperimentFromCourse(Long experimentId);
}
