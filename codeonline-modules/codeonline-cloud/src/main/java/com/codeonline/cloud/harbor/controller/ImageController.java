package com.codeonline.cloud.harbor.controller;

import com.codeonline.cloud.harbor.service.ImageService;
import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.log.annotation.Log;
import com.codeonline.common.log.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/7 6:53 星期六
 * @Description: 镜像管理类
 */
@RestController
@RequestMapping("/harbor/image")
public class ImageController {
    @Autowired
    private ImageService imageService;

    // 检查镜像是否存在
    @Log(title = "镜像检测",businessType = BusinessType.OTHER)
    @GetMapping("/{imageName}")
    public AjaxResult checkImage(@PathVariable String imageName){
        return imageService.checkImage(imageName);
    }

}