package com.codeonline.function.domain;

import lombok.Data;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/11 21:15 星期六
 * @Description:
 */
@Data
public class CourseLabFile {
    private Long id;// id

    private Long courseId;// 课程id

    private Long labId;// 实验id

    private Long teacherId;// 教师id

    private String fileName;// 文件名称

    private String fileUrl;// 文件url

}
