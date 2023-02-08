package com.codeonline.function.service.user.approval.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.Identity;
import com.codeonline.function.mapper.ApprovalMapper;
import com.codeonline.function.service.user.approval.ApprovalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 18:09 星期三
 * @Description:
 */
@Service
public class ApprovalServiceImpl implements ApprovalService {

    @Autowired
    private ApprovalMapper approvalMapper;

    @Override
    public AjaxResult readPeopleApprovalByApprover(Long userId) {
        return AjaxResult.success(approvalMapper.selectPeopleByApproverId(userId));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult passApproval(Long id) {
        Identity identity = approvalMapper.selectPeopleById(id);
        Long userId = identity.getUserId();
        Long roleId = identity.getIdentityId();
        approvalMapper.updateUserRoleByUserId(userId, roleId);
        approvalMapper.updateIdentityByUserId(SecurityUtils.getUsername(),"已通过",id);
        return AjaxResult.success("操作成功");
    }

    @Override
    public AjaxResult refuseApproval(Long id) {
        approvalMapper.updateIdentityByUserId(SecurityUtils.getUsername(),"已拒绝",id);
        return AjaxResult.success("操作成功");
    }
}
