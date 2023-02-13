package com.codeonline.cloud.harbor.model.vo;


import com.codeonline.cloud.harbor.model.HarborUpload;
import lombok.Data;

/**
 * @Author: Administrator
 * @Date: 2023/1/6 6:35 星期五
 * @Description: 应用市场的vo
 */
@Data
public class MarketVo extends HarborUpload {

    private Long artifactCount;

    private Long pullCount;
}


