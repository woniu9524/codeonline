package com.codeonline.function.service.user.approval;

import com.codeonline.common.core.web.domain.AjaxResult;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 18:08 星期三
 * @Description: 身份认证的service
 */
public interface ApprovalService {

    AjaxResult readPeopleApprovalByApprover(Long userId);

    AjaxResult passApproval(Long id);

    AjaxResult refuseApproval(Long id);
}
