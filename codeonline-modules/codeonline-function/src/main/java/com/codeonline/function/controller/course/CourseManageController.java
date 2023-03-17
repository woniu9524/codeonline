package com.codeonline.function.controller.course;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.Lab;
import com.codeonline.function.service.course.CourseManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/9 3:43 星期四
 * @Description: 课程具体管理
 */
@RestController
@RequestMapping("/courses/manage")
public class CourseManageController {

    @Autowired
    private CourseManageService courseManageService;


    /* 查询当前课程信息 */
    @GetMapping("/{courseId}")
    public AjaxResult queryCourseInfo(@PathVariable Long courseId){
        return courseManageService.queryCourseInfo(courseId);
    }

    /* ---------------------------------------------------------------------------------------------- */

    /* 添加学生到课程 */
    @PostMapping("students/{courseId}/{studentId}")
    public AjaxResult addStudentToCourse(@PathVariable Long courseId, @PathVariable Long studentId){
        return courseManageService.addStudentToCourse(courseId, studentId);
    }

    /* 删除学生从课程 */
    @DeleteMapping("students/{courseId}/{studentId}")
    public AjaxResult deleteStudentFromCourse(@PathVariable Long courseId, @PathVariable Long studentId){
        return courseManageService.deleteStudentToCourse(courseId, studentId);
    }

    /* 查询课程下的所有学生 */
    @GetMapping("students/{courseId}")
    public AjaxResult queryStudentsFromCourse(@PathVariable Long courseId){
        return courseManageService.queryStudentsByCourseId(courseId);
    }

    /* ---------------------------------------------------------------------------------------------- */

    /* 查询课程下的所有实验 */
    @GetMapping("experiments/{courseId}")
    public AjaxResult queryExperimentsFromCourse(@PathVariable Long courseId){
        return courseManageService.queryExperimentsByCourseId(courseId);
    }

    /* 添加实验到课程 */
    @PostMapping("experiments/{courseId}")
    public AjaxResult addExperimentToCourse(@PathVariable Long courseId,@RequestBody Lab experiments){
        experiments.setCourseId(courseId);
        String createBy = SecurityUtils.getUsername();
        experiments.setCreateBy(createBy);
        experiments.setUpdateBy(createBy);
        return courseManageService.addExperimentToCourse(experiments);
    }

    /* 修改课程实验 */
    @PutMapping("experiments/{courseId}")
    public AjaxResult updateExperimentFromCourse(@PathVariable Long courseId,@RequestBody Lab experiments){
        experiments.setCourseId(courseId);
        return courseManageService.updateExperimentFromCourse(experiments);
    }

    /* 删除实验从课程 */
    @DeleteMapping("experiments/{experimentId}")
    public AjaxResult deleteExperimentFromCourse( @PathVariable Long experimentId){
        return courseManageService.deleteExperimentFromCourse(experimentId);
    }

    /*------------------------------------------------------------*/
    /* 上传实验资料 */
    @PostMapping("experiments/{courseId}/files")
    public AjaxResult uploadExperimentFile(@RequestParam MultipartFile experimentFile, @PathVariable Long courseId){
        Long teacherId = SecurityUtils.getUserId();
        return courseManageService.uploadExperimentFile(courseId,teacherId, experimentFile);
    }
}
