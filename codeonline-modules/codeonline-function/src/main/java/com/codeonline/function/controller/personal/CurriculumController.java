package com.codeonline.function.controller.personal;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.service.personal.CurriculumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    /* 查询当前学生的所有课程 */
    @GetMapping("/list")
    public AjaxResult queryCurriculumByStudentId(){
        Long studentId = SecurityUtils.getUserId();
        return curriculumService.queryCurriculumByStudentId(studentId);
    }


}