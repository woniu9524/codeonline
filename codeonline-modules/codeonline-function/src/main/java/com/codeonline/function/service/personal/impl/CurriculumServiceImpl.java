package com.codeonline.function.service.personal.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.mapper.CurriculumMapper;
import com.codeonline.function.service.personal.CurriculumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/5 10:39 星期日
 * @Description:
 */

@Service
public class CurriculumServiceImpl implements CurriculumService {

    @Autowired
    private CurriculumMapper curriculumMapper;

    @Override
    public AjaxResult queryCurriculumByStudentId(Long studentId) {

        return AjaxResult.success(curriculumMapper.queryCurriculumByStudentId(studentId));
    }
}