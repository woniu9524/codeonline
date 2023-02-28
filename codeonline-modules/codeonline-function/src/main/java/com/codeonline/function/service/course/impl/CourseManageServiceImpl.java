package com.codeonline.function.service.course.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.Lab;
import com.codeonline.function.mapper.CourseManageMapper;
import com.codeonline.function.mapper.CourseMapper;
import com.codeonline.function.mapper.LabMapper;
import com.codeonline.function.service.course.CourseManageService;
import org.bouncycastle.jcajce.provider.util.SecretKeyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/9 4:00 星期四
 * @Description:
 */
@Service
public class CourseManageServiceImpl implements CourseManageService {

    @Autowired
    private CourseManageMapper courseManageMapper;

    @Autowired
    private LabMapper labMapper;

    @Override
    public AjaxResult queryCourseInfo(Long courseId) {
        return AjaxResult.success(courseManageMapper.queryCourseByCourseId(courseId));
    }

    @Override
    public AjaxResult addStudentToCourse(Long courseId, Long studentId) {
        // 查询学生是否存在
        if (courseManageMapper.queryStudentIsExist(studentId) == 0) {
            return AjaxResult.error("该学生不存在");
        }
        // 查询学生是否已经在课程中
        int i = courseManageMapper.queryStudentIsInCourse(studentId, courseId);
        if (i > 0) {
            return AjaxResult.error("该学生已经在课程中");
        }
        // 添加学生到课程中
        String createBy = SecurityUtils.getUsername();
        int j = courseManageMapper.addStudentToCourse(studentId, courseId, createBy);
        if (j > 0) {
            return AjaxResult.success("添加成功");
        }
        return AjaxResult.error("添加失败");
    }

    @Override
    public AjaxResult deleteStudentToCourse(Long courseId, Long studentId) {
        return courseManageMapper.deleteStudentFromCourse(studentId, courseId) > 0 ? AjaxResult.success("删除成功") : AjaxResult.error("删除失败");
    }

    @Override
    public AjaxResult queryStudentsByCourseId(Long courseId) {
        return AjaxResult.success(courseManageMapper.queryStudentsByCourseId(courseId));
    }

    @Override
    public AjaxResult queryExperimentsByCourseId(Long courseId) {
        return AjaxResult.success(labMapper.queryLabByCourseId(courseId));
    }

    @Override
    public AjaxResult addExperimentToCourse(Lab experiments) {
        // 生成labId
        experiments.setLabId(experiments.getCourseId() +  System.currentTimeMillis());
        int i = labMapper.addLab(experiments);
        Map<String, Long> map = new HashMap<>();
        map.put("labId", experiments.getLabId());
        if (i > 0) {
            return AjaxResult.success(map);
        }
        return AjaxResult.error("添加失败");
    }

    @Override
    public AjaxResult updateExperimentFromCourse(Lab experiments) {
        int i = labMapper.updateLab(experiments);
        if (i > 0) {
            return AjaxResult.success("修改成功");
        }
        return AjaxResult.error("修改失败");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteExperimentFromCourse(Long experimentId) {
        labMapper.deleteK8sConfigureRelationByLabId(experimentId);
        int i = labMapper.deleteLab(experimentId);
        if (i > 0) {
            return AjaxResult.success("删除成功");
        }
        return AjaxResult.error("删除失败");
    }

}
