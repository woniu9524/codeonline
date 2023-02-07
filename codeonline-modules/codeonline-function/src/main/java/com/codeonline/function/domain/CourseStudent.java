package com.codeonline.function.domain;

import lombok.Data;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/14 6:13 星期六
 * @Description: 参加课程的学生的信息
 */
@Data
public class CourseStudent {
    private Long userId;// 学生id

    private String userName;// 学生用户名

    private String nickName;// 学生昵称

    private String phonenumber;// 学生电话

    private String email;// 学生邮箱

    private String className;// 学生班级

    private String collageName;// 学生学院

}