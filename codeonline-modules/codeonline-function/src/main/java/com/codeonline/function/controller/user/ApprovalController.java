package com.codeonline.function.controller.user;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.annotation.RequiresPermissions;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.service.user.approval.ApprovalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 18:05 星期三
 * @Description: 批准身份认证
 */
@RestController
@RequestMapping("/user/approval")
public class ApprovalController {

    @Autowired
    private ApprovalService approvalService;

    /* 读取需要审批的人 */
    @RequiresPermissions("user:approval:list")
    @GetMapping
    public AjaxResult readPeopleApprovalByApprover() {
        Long userId = SecurityUtils.getUserId();
        return approvalService.readPeopleApprovalByApprover(userId);
    }

    /* 通过审批 */
    @RequiresPermissions("user:approval:list")
    @PostMapping("/pass")
    public AjaxResult passApproval(@RequestBody Map<String,Long> idMap) {
        Long id = idMap.get("id");
        return approvalService.passApproval(id);
    }

    /* 拒绝审批 */
    @RequiresPermissions("user:approval:list")
    @PostMapping("/refuse")
    public AjaxResult refuseApproval(@RequestBody Map<String,Long> idMap) {
        Long id = idMap.get("id");
        return approvalService.refuseApproval(id);
    }
}
