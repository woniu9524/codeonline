package com.codeonline.cloud.k8s.model;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/8 7:59 星期日
 * @Description: k8s配置类
 */
@Data
public class K8sConfigure{

    private Long id;

    @NotBlank(message = "k8s镜像来源不能为空")
    private String sourceFrom;// 来源

    @NotBlank(message = "k8s镜像名称不能为空")
    private String imageName;// 镜像名称

    private List<Map<String,String>> ports;// 端口映射

    private String startCmd;// 启动命令

    private String startArgs;// 启动参数

    private List<Map<String,String>> envs;// 环境变量

    private String volume;//挂载目录

    private String description;//描述

    private boolean privilege;//特权模式


}


