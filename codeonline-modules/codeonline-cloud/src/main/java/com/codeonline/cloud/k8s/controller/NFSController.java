package com.codeonline.cloud.k8s.controller;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.cloud.k8s.service.INfsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/nfs")
public class NFSController {

    @Autowired
    private INfsService nfsService;

    /*
     *  读取当前实验下的文件
     * */
    @GetMapping("files/{labId}/{userId}")
    public AjaxResult readNFSByUser(@PathVariable Long labId, @PathVariable Long userId) {
        return nfsService.selectLabFilesByLabId( labId, userId);
    }

    /*
     * 读取特定文件
     * */
    @GetMapping("/files/context/{labId}")
    public AjaxResult readNfsFileContext(@PathVariable String labId, @RequestParam String filePath) {
        //TODO 防止虚假请求，验证用户信息是否符合
        return nfsService.selectNfsFileContext(filePath);
    }


}
