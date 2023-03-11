package com.codeonline.function.domain;

import com.codeonline.common.core.web.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/12 3:30 星期四
 * @Description: 实验信息
 */
@Data
public class Lab extends BaseEntity {
    private Long id;// id

    private Long labId;// 实验id

    private Long courseId;// 课程id

    private String labName;// 实验名称

    private String labContent;// 实验内容

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date labStartTime;// 实验开始时间

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date labEndTime;// 实验结束时间

    private String fileUrl;// 实验文件地址



}



