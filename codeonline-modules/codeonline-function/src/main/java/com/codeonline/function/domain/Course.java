package com.codeonline.function.domain;

import com.codeonline.common.core.web.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/11 4:23 星期三
 * @Description: 课程信息类
 */
@Data
public class Course extends BaseEntity {

    private Long id;// 课程id

    private Long teacherId;// 教师id

    private String teacherName;// 教师姓名

    private String courseName;// 课程名称

    private String courseStatus;// 课程状态

    private String introduction;// 课程简介

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date courseStartTime;// 课程开始时间

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date courseEndTime;// 课程结束时间

    private Integer courseWeek;// 课程周数

}

