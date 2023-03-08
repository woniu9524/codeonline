package com.codeonline.function.domain;

import lombok.Data;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/8 9:29 星期三
 * @Description: 学生实验成绩实体类
 */
@Data
public class StudentLabScore {
    Long id;

    Long courseId;

    Long studentId;

    Long teacherId;

    Long labId;

    Integer score;

    String comment;

}
