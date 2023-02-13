package com.codeonline.cloud.k8s.mapper;

import com.codeonline.cloud.k8s.model.K8sConfigureJson;
import com.codeonline.cloud.k8s.model.K8sConfigureRelation;
import com.codeonline.cloud.k8s.model.K8sUserAndDeployRelation;
import org.apache.ibatis.annotations.*;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/8 3:12 星期日
 * @Description:
 */
@Mapper
public interface K8sMapper {
    /*
     *  插入k8s配置
     * */
    int insertK8sConfigure(K8sConfigureJson k8sConfigureJson);

    /*
     *  查询k8s配置是否存在
     * */
    @Select("select id from k8s_configure where configure=#{configure}")
    Long selectK8sConfigure(K8sConfigureJson k8sConfigureJson);

    /*
     * 插入k8s配置关系
     * */
    @Insert("insert into k8s_configure_relation(configure_id,lab_id,user_id,has_public) values(#{configureId},#{labId},#{userId},#{hasPublic})")
    int insertK8sConfigureRelation(K8sConfigureRelation k8sConfigureRelation);

    /*
     * 根据labId查询k8s配置
     * */
    @Select("select configure from k8s_configure where id in (select configure_id from k8s_configure_relation where lab_id=#{labId})")
    String selectK8sConfigureByLabId(@Param("labId") String labId);

    /*
     * 根据labId查询userId
     */
    @Select("select user_id from k8s_configure_relation where lab_id=#{labId}")
    Long selectUserIdByLabId(@Param("labId") String labId);

    /*
     * 根据labId更新k8s配置
     */
    @Update("update k8s_configure set configure=#{configure} where id in (select configure_id from k8s_configure_relation where lab_id=#{labId})")
    int updateK8sConfigureByLabId(@Param("labId") String labId, @Param("configure") String configure);

    /*
     * 根据labId删除k8s配置
     *
     */
    @Delete("delete from k8s_configure where id in (select configure_id from k8s_configure_relation where lab_id=#{labId})")
    int deleteK8sConfigureByLabId(@Param("labId") String labId);

    /*
     *  插入ks8_user_and_deploy_relation
     */
    @Insert("insert into k8s_user_and_deploy_relation(user_id,teacher_id,lab_id,deploy_namespace,deployment_name,service_name,create_by,create_time,update_by,update_time) values (#{userId},#{teacherId},#{labId},#{deployNamespace},#{deploymentName},#{serviceName},#{createBy},sysdate(),#{updateBy},sysdate())")
    int insertK8sUserAndDeployRelation(K8sUserAndDeployRelation k8sUserAndDeployRelation);

    /*
    *  根据labId,userId查询k8s_user_and_deploy_relation
    * */
    @Select("select * from k8s_user_and_deploy_relation where lab_id=#{labId} and user_id=#{userId}")
    K8sUserAndDeployRelation selectK8sUserAndDeployRelationByLabIdAndUserId(@Param("labId") String labId, @Param("userId") Long userId);

    // 学生删除实验
    @Delete("delete from k8s_user_and_deploy_relation where lab_id = #{labId} and user_id = #{userId}")
    int deleteLabByStudent(@Param("labId") String labId,@Param("userId") Long userId);

}
