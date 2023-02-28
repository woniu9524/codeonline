package com.codeonline.function.service.course.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.mapper.LabMapper;
import com.codeonline.function.service.course.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
