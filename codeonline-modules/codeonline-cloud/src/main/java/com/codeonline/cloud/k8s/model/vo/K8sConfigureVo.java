package com.codeonline.cloud.k8s.model.vo;

import com.codeonline.cloud.k8s.model.K8sConfigure;
import lombok.Data;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/8 9:34 星期日
 * @Description:
 */
@Data
public class K8sConfigureVo extends K8sConfigure {

    private String labId;

    private Long userId;

    private boolean hasPublic;
}