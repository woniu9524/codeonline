package com.codeonline.function.controller.course;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.annotation.RequiresPermissions;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.Course;
import com.codeonline.function.service.course.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 21:48 星期三
 * @Description: 课程管理
 */
@RestController
@RequestMapping("/courses")
public class CourseController {
    @Autowired
    private CourseService courseService;

    // 查询当前教师的所有课程
    @GetMapping
    @RequiresPermissions("course:list")
    public AjaxResult selectCourseByTeacherId(){
        // TODO 如果是管理员返回全部课程
        Long teacherId = SecurityUtils.getUserId();
        return courseService.queryCourseByTeacherId(teacherId);
    }

    // 添加课程
    @PostMapping
    @RequiresPermissions("course:list")
    public AjaxResult addCourse(@RequestBody Course course){
        String username = SecurityUtils.getUsername();
        Long userId = SecurityUtils.getUserId();
        course.setTeacherName(username);
        course.setTeacherId(userId);
        course.setCreateBy(username);
        course.setUpdateBy(username);
        return courseService.addCourse(course);
    }

    // 修改课程信息
    @PutMapping
    @RequiresPermissions("course:list")
    public AjaxResult updateCourse(@RequestBody Course course){
        return courseService.updateCourse(course);
    }

    // 删除课程
    @DeleteMapping("/{courseId}")
    @RequiresPermissions("course:list")
    public AjaxResult deleteCourse(@PathVariable Long courseId){
        // TODO 级联删除课程下的所有学生，实验等
        return courseService.deleteCourse(courseId);
    }



    // 按照课程名称查询课程
    @GetMapping("/courses/name/{courseName}")

    public AjaxResult selectCourseByCourseName(@PathVariable String courseName){
        return courseService.queryCourseByCourseName(courseName);
    }

}
