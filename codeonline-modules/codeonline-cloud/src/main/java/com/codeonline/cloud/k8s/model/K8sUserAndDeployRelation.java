package com.codeonline.cloud.k8s.model;

import com.codeonline.common.core.web.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/13 9:05 星期五
 * @Description: 用户创建deploy之后的关系表
 */
@Data
public class K8sUserAndDeployRelation extends BaseEntity {
    private Long id;// id

    private Long userId;// 用户id

    private Long teacherId;// 教师id

    private String labId;// 实验id

    private String deployNamespace;// deploy命名空间

    private String deploymentName;// deploy名称

    private String serviceName;// service名称

    private K8sConfigure k8sConfigure;// k8s配置信息

    private Date destroyTime;// 销毁时间

    private boolean hasDestroy;// 是否已经销毁

}
