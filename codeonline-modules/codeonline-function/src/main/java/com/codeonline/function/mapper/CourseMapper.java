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
}
