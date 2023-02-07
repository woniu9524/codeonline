package com.codeonline.function.mapper;

import com.codeonline.system.api.domain.SysDept;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DeptMapper {
    // 读取所有大学(parentId=0)
    @Select("select dept_id,parent_id,ancestors,dept_name from sys_dept where parent_id = 0")
    public List<SysDept> selectUniversities();

    // 读取指定大学的所有学院
    @Select("select dept_id,parent_id,ancestors,dept_name from sys_dept where parent_id = #{deptId}")
    public List<SysDept> selectColleges(@Param("deptId") Long deptId);

    // 读取指定学院的所有班级
    @Select("select dept_id,parent_id,ancestors,dept_name from sys_dept where parent_id = #{deptId}")
    public List<SysDept> selectClasses(@Param("deptId") Long deptId);

    // 读取指定班级的所有学生
    @Select("select user_id,dept_id,user_name,nick_name,email,phonenumber,sex from sys_user where dept_id = #{deptId}")
    public List<SysDept> selectStudents(@Param("deptId") Long deptId);
}
