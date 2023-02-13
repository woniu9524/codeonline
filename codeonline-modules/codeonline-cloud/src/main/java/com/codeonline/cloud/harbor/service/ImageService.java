package com.codeonline.cloud.harbor.service;

import com.codeonline.common.core.web.domain.AjaxResult;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/7 7:11 星期六
 * @Description:
 */
public interface ImageService {
    AjaxResult checkImage(String imageName);

}
