package com.codeonline.cloud.k8s.service;

import com.codeonline.common.core.web.domain.AjaxResult;

public interface INfsService {
    AjaxResult selectLabFilesByLabId(Long labId,Long userId);

    AjaxResult selectNfsFileContext(String filePath);
}
