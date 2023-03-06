package com.codeonline.function.domain;

import lombok.Data;

import java.util.Date;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/6 11:43 星期一
 * @Description: 学生完成实验情况
 */
@Data
public class StudentAndLabInfo {
    /* course_id,user_id,teacher_id,lab_id,create_by,create_time,t2.destroy_time,t2.has_destroy */
    private Long courseId;
    private Long userId;
    private String userName;
    private String nickName;
    private Long teacherId;
    private Long labId;
    private String createBy;
    private Date createTime;
    private Date destroyTime;
    private Boolean hasDestroy;

    private String labStatus;
    private String labTime;

}
