package com.codeonline.function.service.course;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.Course;

import java.util.List;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 21:53 星期三
 * @Description:
 */
public interface CourseService {
    AjaxResult queryCourseByTeacherId(Long teacherId);

    AjaxResult queryCourseByCourseName(String courseName);

    AjaxResult addCourse(Course course);

    AjaxResult updateCourse(Course course);

    AjaxResult deleteCourse(Long courseId);




}
