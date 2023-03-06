package com.codeonline.function.mapper;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.Lab;
import com.codeonline.function.domain.StudentAndLabInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/9 4:41 星期四
 * @Description:
 */
@Mapper
public interface LabMapper {

    // 插入实验
    int addLab(Lab lab);

    // 修改实验
    int updateLab(Lab lab);

    // 删除实验
    int deleteLab(Long labId);

    // 通过courseId查询实验
    @Select("select * from business_lab where course_id = #{courseId}")
    List<Lab> queryLabByCourseId(Long courseId);

    /*------------------------------------------------------------*/

     /*通过labId查询实验*/
    @Select("select * from business_lab where lab_id = #{labId}")
    Lab queryLabByLabId(@Param("labId") Long labId);

    /* 根据labId删除k8s配置 */
    @Delete("delete from k8s_configure where id in (select configure_id from k8s_configure_relation where lab_id=#{labId})")
    int deleteK8sConfigureByLabId(@Param("labId") Long labId);


    /* 根据labId删除k8s配置关系 */
    @Delete("delete from k8s_configure_relation where lab_id=#{labId}")
    int deleteK8sConfigureRelationByLabId(@Param("labId") Long labId);


    /* 查询所有学生实验信息 */
    @Select("SELECT * FROM (SELECT\n" +
            "\tcourse_id,user_id,teacher_id,lab_id,create_by,create_time,t2.destroy_time,t2.has_destroy\n" +
            "FROM\n" +
            "\t( SELECT user_id, course_id FROM business_user_and_course_relation WHERE course_id IN ( SELECT course_id FROM business_lab WHERE lab_id = 1677273056645 ) ) AS t1\n" +
            "LEFT JOIN ( SELECT * FROM k8s_user_and_deploy_relation ) AS t2 USING ( user_id )) AS t3 LEFT JOIN\n" +
            "(SELECT user_id,user_name,nick_name FROM sys_user) AS t4 USING(user_id)")
    List<StudentAndLabInfo> queryAllStudentLabInfo(@Param("labId") Long labId);
}

