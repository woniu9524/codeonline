package com.codeonline.function.controller.personal;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.service.course.CourseManageService;
import com.codeonline.function.service.personal.CurriculumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/5 10:34 星期日
 * @Description:
 */
@RestController
@RequestMapping("/personal/curriculums")
public class CurriculumController {

    @Autowired
    private CurriculumService curriculumService;

    @Autowired
    private CourseManageService courseManageService;

    /* 查询当前学生的所有课程 */
    @GetMapping("/list")
    public AjaxResult queryCurriculumByStudentId(){
        Long studentId = SecurityUtils.getUserId();
        return curriculumService.queryCurriculumByStudentId(studentId);
    }

    /* 学生添加学生到课程 */
    @PostMapping("/{courseId}")
    public AjaxResult addStudentToCourse(@PathVariable Long courseId){
        Long studentId = SecurityUtils.getUserId();
        return courseManageService.addStudentToCourse(courseId, studentId);
    }


}