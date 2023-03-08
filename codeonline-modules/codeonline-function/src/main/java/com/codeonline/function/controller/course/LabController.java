package com.codeonline.function.controller.course;

import com.codeonline.common.core.web.domain.AjaxResult;
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

    /* 提交实验成绩 */
    @PostMapping("/scores/{experimentId}/{studentId}")
    public AjaxResult submitExperimentScore(@PathVariable Long experimentId, @RequestBody Integer score, @RequestBody String comment, @PathVariable Long studentId){
        return labService.submitExperimentScore(experimentId,studentId,score,comment);
    }

    /* 查询实验成绩 */
    @GetMapping("/scores/{experimentId}/{studentId}")
    public AjaxResult queryExperimentScore(@PathVariable Long experimentId, @PathVariable Long studentId){
        return labService.queryExperimentScore(experimentId,studentId);
    }
}
