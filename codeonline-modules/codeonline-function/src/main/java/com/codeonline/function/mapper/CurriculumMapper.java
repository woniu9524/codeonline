package com.codeonline.function.mapper;

import com.codeonline.function.domain.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/5 10:40 星期日
 * @Description:
 */
@Mapper
public interface CurriculumMapper {
    /* 查询当前学生的所有课程 */
    @Select("SELECT * FROM business_course WHERE id IN (SELECT course_id FROM `business_user_and_course_relation` WHERE user_id=#{studentId})")
    List<Course> queryCurriculumByStudentId(@Param("studentId") Long studentId);
}
