package com.codeonline.function.service.course.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.StudentLabScore;
import com.codeonline.function.mapper.LabMapper;
import com.codeonline.function.service.course.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/27 19:48 星期一
 * @Description:
 */
@Service
public class LabServiceImpl implements LabService {

    @Autowired
    private LabMapper labMapper;


    @Override
    public AjaxResult queryExperimentInfo(Long experimentId) {
        return AjaxResult.success(labMapper.queryLabByLabId(experimentId));
    }

    @Override
    public AjaxResult submitExperimentScore(Long experimentId,Long studentId, Integer score, String comment) {
        // 查询实验是否已经提交过成绩
        StudentLabScore count = labMapper.queryLabScoreByLabIdAndStudentId(experimentId, studentId);
        // 如果已经提交过成绩，更新成绩
        if (count != null) {
            labMapper.updateLabScoreByLabIdAndStudentId(experimentId, studentId, score, comment);
        } else {
            // 如果没有提交过成绩，插入成绩
            Long teacherId = SecurityUtils.getUserId();
            Long courseId = labMapper.queryCourseIdByLabId(experimentId);
            StudentLabScore studentLabScore = new StudentLabScore();
            studentLabScore.setCourseId(courseId);
            studentLabScore.setStudentId(studentId);
            studentLabScore.setTeacherId(teacherId);
            studentLabScore.setLabId(experimentId);
            studentLabScore.setScore(score);
            studentLabScore.setComment(comment);
            labMapper.insertLabScoreByLabIdAndStudentId(studentLabScore);
        }
        return AjaxResult.success("提交成功");
    }

    @Override
    public AjaxResult queryExperimentScore(Long experimentId, Long studentId) {
        return AjaxResult.success(labMapper.queryLabScoreByLabIdAndStudentId(experimentId, studentId));
    }
}
