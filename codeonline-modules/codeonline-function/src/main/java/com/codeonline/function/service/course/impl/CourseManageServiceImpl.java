package com.codeonline.function.service.course.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.codeonline.common.core.domain.R;
import com.codeonline.common.core.utils.StringUtils;
import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.CourseLabFile;
import com.codeonline.function.domain.Lab;
import com.codeonline.function.mapper.CourseLabFileMapper;
import com.codeonline.function.mapper.CourseManageMapper;
import com.codeonline.function.mapper.CourseMapper;
import com.codeonline.function.mapper.LabMapper;
import com.codeonline.function.service.course.CourseManageService;
import com.codeonline.system.api.RemoteFileService;
import com.codeonline.system.api.domain.SysFile;
import org.apache.commons.io.FileUtils;
import org.bouncycastle.jcajce.provider.util.SecretKeyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/9 4:00 星期四
 * @Description:
 */
@Service
public class CourseManageServiceImpl implements CourseManageService {

    @Autowired
    private CourseManageMapper courseManageMapper;

    @Autowired
    private LabMapper labMapper;

    @Autowired
    private CourseLabFileMapper courseLabFileMapper;

    @Autowired
    private RemoteFileService remoteFileService;

    @Override
    public AjaxResult queryCourseInfo(Long courseId) {
        return AjaxResult.success(courseManageMapper.queryCourseByCourseId(courseId));
    }

    @Override
    public AjaxResult addStudentToCourse(Long courseId, Long studentId) {
        // 查询学生是否存在
        if (courseManageMapper.queryStudentIsExist(studentId) == 0) {
            return AjaxResult.error("该学生不存在");
        }
        // 查询学生是否已经在课程中
        int i = courseManageMapper.queryStudentIsInCourse(studentId, courseId);
        if (i > 0) {
            return AjaxResult.error("该学生已经在课程中");
        }
        // 添加学生到课程中
        String createBy = SecurityUtils.getUsername();
        int j = courseManageMapper.addStudentToCourse(studentId, courseId, createBy);
        if (j > 0) {
            return AjaxResult.success("添加成功");
        }
        return AjaxResult.error("添加失败");
    }

    @Override
    public AjaxResult deleteStudentToCourse(Long courseId, Long studentId) {
        return courseManageMapper.deleteStudentFromCourse(studentId, courseId) > 0 ? AjaxResult.success("删除成功") : AjaxResult.error("删除失败");
    }

    @Override
    public AjaxResult queryStudentsByCourseId(Long courseId) {
        return AjaxResult.success(courseManageMapper.queryStudentsByCourseId(courseId));
    }

    @Override
    public AjaxResult queryExperimentsByCourseId(Long courseId) {
        return AjaxResult.success(labMapper.queryLabByCourseId(courseId));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addExperimentToCourse(Lab experiments) {
        // 生成labId
        experiments.setLabId(experiments.getCourseId() + System.currentTimeMillis());
        int i = labMapper.addLab(experiments);
        Map<String, Long> map = new HashMap<>();
        map.put("labId", experiments.getLabId());
        if (i > 0) {
            // 更新CourseLabFile
            UpdateWrapper<CourseLabFile> courseLabFileUpdateWrapper = new UpdateWrapper<>();
            if (!experiments.getFileUrl().isEmpty()){
                courseLabFileUpdateWrapper
                        .set("lab_id",experiments.getLabId())
                        .eq("file_url",experiments.getFileUrl());
                courseLabFileMapper.update(null,courseLabFileUpdateWrapper);
            }
            return AjaxResult.success(map);
        }


        return AjaxResult.error("添加失败");
    }

    @Override
    public AjaxResult updateExperimentFromCourse(Lab experiments) {
        int i = labMapper.updateLab(experiments);
        if (i > 0) {
            return AjaxResult.success("修改成功");
        }
        return AjaxResult.error("修改失败");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteExperimentFromCourse(Long experimentId) {
        labMapper.deleteK8sConfigureRelationByLabId(experimentId);
        int i = labMapper.deleteLab(experimentId);
        if (i > 0) {
            return AjaxResult.success("删除成功");
        }
        return AjaxResult.error("删除失败");
    }

    @Override
    public AjaxResult uploadExperimentFile(Long courseId,Long teacherId, MultipartFile multipartFile) {
        if (!multipartFile.isEmpty()) {
            R<SysFile> fileResult = remoteFileService.upload(multipartFile);
            if (StringUtils.isNull(fileResult) || StringUtils.isNull(fileResult.getData())) {
                return AjaxResult.error("文件服务异常，请联系管理员");
            }
            String url = fileResult.getData().getUrl();
            // 获取文件名
            String fileName = multipartFile.getOriginalFilename();
            // 保存url到数据库
            QueryWrapper<CourseLabFile> courseLabFileQueryWrapper = new QueryWrapper<>();
            courseLabFileQueryWrapper.eq("course_id", courseId).eq("file_name", fileName).eq("lab_id", null);
            if (courseLabFileMapper.exists(courseLabFileQueryWrapper)){
                // 如果存在则更新
                CourseLabFile courseLabFile = courseLabFileMapper.selectList(courseLabFileQueryWrapper).get(0);
                courseLabFile.setFileUrl(url);
                courseLabFileMapper.updateById(courseLabFile);
            }else {
                // 如果不存在则插入
                CourseLabFile courseLabFile = new CourseLabFile();
                courseLabFile.setCourseId(courseId);
                courseLabFile.setTeacherId(teacherId);
                courseLabFile.setFileName(fileName);
                courseLabFile.setFileUrl(url);
                courseLabFileMapper.insert(courseLabFile);
            }
            HashMap<String, String> urlHashMap = new HashMap<>();
            urlHashMap.put("fileUrl", url);

            return AjaxResult.success(urlHashMap);
        }
        return AjaxResult.error("上传实验文件失败, 请重试");
    }

}
