package com.codeonline.cloud.k8s.model;

import lombok.Data;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/9 10:00 星期一
 * @Description: 配置文件关系表
 */
@Data
public class K8sConfigureRelation {
    private Long id;

    private Long configureId;

    private String labId;

    private Long userId;

    private boolean hasPublic;

}