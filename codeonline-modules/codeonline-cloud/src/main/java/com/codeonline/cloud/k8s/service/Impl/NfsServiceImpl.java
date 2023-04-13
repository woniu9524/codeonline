package com.codeonline.cloud.k8s.service.Impl;

import com.codeonline.cloud.k8s.service.INfsService;
import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.cloud.k8s.mapper.NfsMapper;
import com.codeonline.cloud.utils.NfsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.*;

@Service
public class NfsServiceImpl implements INfsService {

    @Autowired
    private NfsMapper nfsMapper;

    @Value("${nfs.path}")
    private String nfsBasePath;

    @Override
    public AjaxResult selectLabFilesByLabId(Long labId, Long userId) {
        Long courseId = nfsMapper.selectCourseIdByLabId(labId);
        Long teacherId = nfsMapper.selectUserIdByCourseId(courseId);
        // TODO 这里位置要改
//        nfsBasePath = "C:/Users/Administrator/Desktop/data/nfs";
        List<Map<String, Object>> fileTree = new ArrayList<>();
        String path = "";
        if (Objects.equals(teacherId, userId)) {
            path = nfsBasePath + "/" + teacherId + "/" + labId;
        } else {
            path = nfsBasePath + "/" + teacherId + "/" + labId+"/"+userId;
        }
        try {
            NfsUtil.showList(new File(path), fileTree);
            fileTree = (List<Map<String, Object>>) fileTree.get(0).get("children");
        } catch (IndexOutOfBoundsException e) {
            // 没有文件
        }
        return AjaxResult.success(fileTree);
    }

    @Override
    public AjaxResult selectNfsFileContext(String filePath) {
        String context = NfsUtil.readFileContent(filePath);
        return AjaxResult.success("读取成功",context);
    }


}
