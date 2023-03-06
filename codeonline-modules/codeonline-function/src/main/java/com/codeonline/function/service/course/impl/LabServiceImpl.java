package com.codeonline.function.service.course.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.StudentAndLabInfo;
import com.codeonline.function.mapper.LabMapper;
import com.codeonline.function.service.course.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public AjaxResult queryAllStudentLabInfo(Long labId) {
        List<StudentAndLabInfo> studentAndLabInfos = labMapper.queryAllStudentLabInfo(labId);
        studentAndLabInfos.stream().forEach(studentAndLabInfo -> {
            if (studentAndLabInfo.getHasDestroy() == null) {
                studentAndLabInfo.setLabStatus("未开始");
                studentAndLabInfo.setLabTime("0分钟");
            } else if (studentAndLabInfo.getHasDestroy()) {
                studentAndLabInfo.setLabStatus("已结束");
                //开始时间减去结束时间
                studentAndLabInfo.setLabTime((studentAndLabInfo.getDestroyTime().getTime() - studentAndLabInfo.getCreateTime().getTime()) / (1000 * 60) + "分钟");
            } else {
                studentAndLabInfo.setLabStatus("进行中");
                //开始时间减去当前时间
                studentAndLabInfo.setLabTime((System.currentTimeMillis() - studentAndLabInfo.getCreateTime().getTime()) / (1000 * 60) + "分钟");
            }
        });
        return AjaxResult.success(studentAndLabInfos);
    }
}
