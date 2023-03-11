package com.codeonline.function.controller.course;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.StudentLabScore;
import com.codeonline.function.service.course.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/27 19:45 星期一
 * @Description:
 */
@RestController
@RequestMapping("/courses/experiments")
public class LabController {

    @Autowired
    private LabService labService;


    /* 通过实验ID读取实验信息 */
    @GetMapping("/{experimentId}")
    public AjaxResult queryExperimentInfo(@PathVariable Long experimentId){
        return labService.queryExperimentInfo(experimentId);
    }

    /* 查询所有学生实验完成信息 */
    @GetMapping("/students/{labId}")
    public AjaxResult queryAllStudentLabInfo(@PathVariable Long labId){
        return labService.queryAllStudentLabInfo(labId);
    }


    /* 提交实验成绩 */
    @PostMapping("/students/scores/{experimentId}/{studentId}")
    public AjaxResult submitExperimentScore(@PathVariable Long experimentId, @PathVariable Long studentId, @RequestBody StudentLabScore studentLabScore){

        return labService.submitExperimentScore(experimentId,studentId,studentLabScore.getScore(),studentLabScore.getComment());
    }

    /* 查询实验成绩 */
    @GetMapping("/students/scores/{experimentId}/{studentId}")
    public AjaxResult queryExperimentScore(@PathVariable Long experimentId, @PathVariable Long studentId){
        return labService.queryExperimentScore(experimentId,studentId);
    }


}
