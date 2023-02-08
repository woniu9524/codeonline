package com.codeonline.function.service.course.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.Course;
import com.codeonline.function.mapper.CourseMapper;
import com.codeonline.function.service.course.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 21:56 星期三
 * @Description:
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;



    @Override
    public AjaxResult queryCourseByTeacherId(Long teacherId) {
        List<Course> courses = courseMapper.queryCourseByTeacherId(teacherId);
        // 读取当前时间
        Date date = new Date();
        // 遍历课程列表，判断课程是否已经结束，如果已经结束，则将课程状态设置为已结束
        courses.forEach(course -> {
            if (course.getCourseEndTime().before(date)) {
                course.setCourseStatus("已结束");
            }else if (course.getCourseStartTime().after(date)) {
                course.setCourseStatus("未开始");
            }else {
                course.setCourseStatus("进行中");
            }
        });
        return AjaxResult.success(courses);
    }

    @Override
    public AjaxResult queryCourseByCourseName(String courseName) {
        return AjaxResult.success(courseMapper.queryCourseByCourseName(courseName));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addCourse(Course course) {
        int i = courseMapper.addCourse(course);
        if (i > 0) {
            return AjaxResult.success("添加成功");
        }
        return AjaxResult.error("添加失败");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateCourse(Course course) {
        int i = courseMapper.updateCourse(course);
        if (i > 0) {
            return AjaxResult.success("修改成功");
        }
        return AjaxResult.error("修改失败");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteCourse(Long courseId) {
        int i = courseMapper.deleteCourse(courseId);
        if (i > 0) {
            return AjaxResult.success("删除成功");
        }
        return AjaxResult.error("删除失败");
    }


}
