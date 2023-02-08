package com.codeonline.function.mapper;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.Course;
import com.codeonline.function.domain.CourseStudent;
import com.codeonline.function.domain.Lab;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/9 4:03 星期四
 * @Description:
 */
@Mapper
public interface CourseManageMapper {
    // 按照课程id查询课程信息
    @Select("select * from business_course where id = #{courseId}")
    Course queryCourseByCourseId(Long courseId);

    // 查询课程的所有学生，business_user_and_course_relation,sys_user
    List<CourseStudent> queryStudentsByCourseId(@Param("courseId") Long courseId);

    // 通过userId判断是否存在该学生
    @Select("select count(*) from sys_user where user_id = #{userId}")
    int queryStudentIsExist(@Param("userId") Long userId);
    // 查询学生是否已经在课程中
    @Select("select count(*) from business_user_and_course_relation where user_id = #{userId} and course_id = #{courseId}")
    int queryStudentIsInCourse(@Param("userId") Long userId, @Param("courseId") Long courseId);
    // 添加学生到课程中
    @Insert("insert into business_user_and_course_relation(user_id,course_id,create_time,create_by,update_time,update_by) values(#{userId},#{courseId},sysdate(),#{createBy},sysdate(),#{createBy})")
    int addStudentToCourse(@Param("userId") Long userId, @Param("courseId") Long courseId, @Param("createBy") String createBy);
    // 删除学生
    @Delete("delete from business_user_and_course_relation where user_id = #{userId} and course_id = #{courseId}")
    int deleteStudentFromCourse(@Param("userId") Long userId, @Param("courseId") Long courseId);


    // 查询课程的所有实验室
    @Select("select * from business_lab where course_id = #{courseId}")
    List<Lab> queryLabsByCourseId(@Param("courseId") Long courseId);

//    // 查询当前学生的所有课程
//    @Select("select * from business_course where id in (select course_id from business_user_and_course_relation where user_id = #{userId})")
//    List<Course> queryCourseByStudentId(@Param("userId") Long studentId);
}
