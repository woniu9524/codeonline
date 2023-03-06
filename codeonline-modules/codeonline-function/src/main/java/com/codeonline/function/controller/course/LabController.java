package com.codeonline.function.controller.course;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.service.course.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
