package com.codeonline.cloud.k8s.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface NfsMapper {

    @Select("SELECT teacher_id FROM `business_course` WHERE id =#{courseId}")
    Long selectUserIdByCourseId(@Param("courseId") Long courseId);

    // 通过实验id查询实验courseId
    @Select("SELECT course_id FROM `business_lab` WHERE lab_id =#{labId}")
    Long selectCourseIdByLabId(@Param("labId") Long labId);
}
