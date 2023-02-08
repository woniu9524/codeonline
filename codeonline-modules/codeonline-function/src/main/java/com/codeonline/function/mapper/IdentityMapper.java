package com.codeonline.function.mapper;

import com.codeonline.function.domain.Identity;
import com.codeonline.function.domain.vo.IdentityAffairVo;
import com.codeonline.system.api.domain.SysUser;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface IdentityMapper {
    // 读取某个大学下的所有管理员:从sys_user_role表中读取role_id=2的用户，然后从sys_user表中读取对应的用户信息,这里的role_id=2是管理员的角色id,
    @Select("select user_id,user_name,nick_name,dept_id,email,phonenumber,sex from sys_user where user_id in (select user_id from sys_user_role where role_id = 2) and dept_id = #{deptId}")
    public List<SysUser> selectAdmins(@Param("deptId") Long deptId);

    // 读取某个学院下的所有教师:从sys_user_role表中读取role_id=100的用户，然后从sys_user表中读取对应的用户信息,这里的role_id=101是教师的角色id
    @Select("select user_id,user_name,nick_name,dept_id,email,phonenumber,sex from sys_user where user_id in (select user_id from sys_user_role where role_id = 100) and dept_id = #{deptId}")
    public List<SysUser> selectTeachers(@Param("deptId") Long deptId);

    // 根据user_id查询identity是否存在
    @Select("select count(*) from business_identity where user_id = #{userId}")
    public int selectCountByIdentity(@Param("userId") Long userId);

    // 查询三个dept_name
    @Select("select dept_name from sys_dept where dept_id = #{deptId}")
    public String selectDeptName(@Param("deptId") Long deptId);

    // 插入identity到数据库
    @Insert("insert into business_identity(user_id,identity_id,university_id,college_id,class_id,university_name,college_name,class_name,approver_id,create_by,create_time,update_by,update_time,remark,has_finished,status) values(#{userId},#{identityId},#{universityId},#{collegeId},#{classId},#{universityName},#{collegeName},#{className},#{approverId},#{createBy},sysdate(),#{updateBy},sysdate(),#{remark},0,'处理中')")
    public int insertIdentity(Identity identity);

    // 修改identity到数据库
    @Insert("update business_identity set identity_id=#{identityId},university_id=#{universityId},college_id=#{collegeId},class_id=#{classId},university_name=#{universityName},college_name=#{collegeName},class_name=#{className},approver_id=#{approverId},update_by=#{updateBy},update_time=sysdate(),remark=#{remark} where user_id=#{userId}")
    public int updateIdentity(Identity identity);

    // 通过user_id读取business_identity表中的所有数据
    @Select("select * from business_identity where user_id = #{userId}")
    public IdentityAffairVo selectIdentityByUserId(@Param("userId") Long userId);

    // 通过user_id查询user_name
    @Select("select user_name from sys_user where user_id = #{userId}")
    public String selectUserNameByUserId(@Param("userId") Long userId);





}
