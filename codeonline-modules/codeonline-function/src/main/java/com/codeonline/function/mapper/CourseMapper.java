package com.codeonline.function.mapper;

import com.codeonline.function.domain.Course;
import com.codeonline.function.domain.CourseStudent;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface CourseMapper {
    // 查询课程信息
    @Select("select * from business_course")
    List<Course> queryCourseAllInfo();
    // 按照课程id查询课程信息
    @Select("select * from business_course where id = #{courseId}")
    Course queryCourseByCourseId(Long courseId);
    // 查询当前教师的所有课程
    @Select("select * from business_course where teacher_id = #{teacherId}")
    List<Course> queryCourseByTeacherId(Long teacherId);
    // 按照课程名称查询课程
    @Select("select * from business_course where course_name = #{courseName}")
    List<Course> queryCourseByCourseName(String courseName);
    // 添加课程
    @Insert("insert into business_course(teacher_id,teacher_name,course_name,course_status,introduction,course_start_time,course_end_time,course_week,create_time,create_by,update_time,update_by) values(#{teacherId},#{teacherName},#{courseName},#{courseStatus},#{introduction},#{courseStartTime},#{courseEndTime},#{courseWeek},sysdate(),#{createBy},sysdate(),#{updateBy})")
    int addCourse(Course course);
    // 修改课程信息
    int updateCourse(Course course);

    // 删除课程
    @Delete("delete from business_course where id = #{courseId}")
    int deleteCourse(@Param("courseId") Long courseId);

    // 批量删除课程
    @Delete("delete from business_course where id in (#{courseIds})")
    int deleteCourses(@Param("courseIds") String courseIds);

    // 查询课程的所有学生，business_user_and_course_relation,sys_user
    List<CourseStudent> queryStudentsByCourseId(@Param("courseId") Long courseId);

    // 通过userName查询用户id
    @Select("select user_id from sys_user where user_name = #{userName}")
    Long queryUserIdByUserName(String userName);
    // 查询学生是否已经在课程中
    @Select("select count(*) from business_user_and_course_relation where user_id = #{userId} and course_id = #{courseId}")
    int queryStudentIsInCourse(@Param("userId") Long userId, @Param("courseId") Long courseId);
    // 添加学生到课程中
    @Insert("insert into business_user_and_course_relation(user_id,course_id,create_time,create_by,update_time,update_by) values(#{userId},#{courseId},sysdate(),#{createBy},sysdate(),#{updateBy})")
    int addStudentToCourse(@Param("userId") Long userId, @Param("courseId") Long courseId, @Param("createBy") String createBy, @Param("updateBy") String updateBy);
    // 删除学生
    @Delete("delete from business_user_and_course_relation where user_id = #{userId} and course_id = #{courseId}")
    int deleteStudentFromCourse(@Param("userId") Long userId, @Param("courseId") Long courseId);

    // 查询当前学生的所有课程
    @Select("select * from business_course where id in (select course_id from business_user_and_course_relation where user_id = #{userId})")
    List<Course> queryCourseByStudentId(@Param("userId") Long studentId);
}
