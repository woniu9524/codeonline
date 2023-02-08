package com.codeonline.function.mapper;

import com.codeonline.function.domain.Identity;
import org.apache.ibatis.annotations.*;

import java.util.List;


/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 18:12 星期三
 * @Description:
 */
@Mapper
public interface ApprovalMapper {
    // 在business_identity中根据approver_id查询出所有的待审批的人
    @Select("select * from business_identity where approver_id = #{userId} and has_finished = 0")
    List<Identity> selectPeopleByApproverId(Long userId);

    // 在business_identity中根据id查询出待审批的人
    @Select("select * from business_identity where id = #{id}")
    Identity selectPeopleById(Long id);

    // 在sys_user_role中插入一条数据
    @Insert("insert into sys_user_role (user_id, role_id) values (#{userId}, #{roleId})")
    int insertUserRole(Long userId, Long roleId);

    // 设置has_finished为1和update_by和update_time以及status
    @Update("update business_identity set has_finished = 1, update_by = #{updateBy}, update_time = sysdate(), status = #{status} where id = #{id}")
    int updateIdentityByUserId(@Param("updateBy") String updateBy,@Param("status") String status,@Param("id") Long id);
}
