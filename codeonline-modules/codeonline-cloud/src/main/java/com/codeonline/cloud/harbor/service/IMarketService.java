package com.codeonline.cloud.harbor.service;

import com.codeonline.common.core.web.domain.AjaxResult;

/**
 * @Author: Administrator
 * @Date: 2023/1/6 6:11 星期五
 * @Description: 应用市场接口
 */
public interface IMarketService {
    /*
    *  读取应用市场的应用
    * */
    AjaxResult getAllMarketImages();
}
