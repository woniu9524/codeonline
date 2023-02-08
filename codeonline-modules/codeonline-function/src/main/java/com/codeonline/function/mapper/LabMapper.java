package com.codeonline.function.mapper;

import com.codeonline.function.domain.Lab;
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


}

