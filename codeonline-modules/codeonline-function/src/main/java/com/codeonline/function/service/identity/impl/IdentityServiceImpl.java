package com.codeonline.function.service.identity.impl;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.Identity;
import com.codeonline.function.domain.vo.IdentityAffairVo;
import com.codeonline.function.mapper.DeptMapper;
import com.codeonline.function.mapper.IdentityMapper;
import com.codeonline.function.service.identity.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IdentityServiceImpl implements IdentityService {

    @Autowired
    private IdentityMapper identityMapper;

    @Autowired
    private DeptMapper deptMapper;

    /*
    *  读取所有的学校
    * */
    @Override
    public AjaxResult readUniversities() {
        return AjaxResult.success(deptMapper.selectUniversities());
    }

    @Override
    public AjaxResult readIdentity(Long userId) {
        IdentityAffairVo identityAffairVo = identityMapper.selectIdentityByUserId(userId);
        if (identityAffairVo == null)
            return AjaxResult.success((Object) null);
        identityAffairVo.setApproverName(identityMapper.selectUserNameByUserId(identityAffairVo.getApproverId()));
        return AjaxResult.success(identityAffairVo);
    }

    /*
    *  读取指定学校的所有的学院
    * */
    @Override
    public AjaxResult readColleges(Long universityId) {
        return AjaxResult.success(deptMapper.selectColleges(universityId));
    }

    /*
    *  读取指定学院的所有的班级
    * */
    @Override
    public AjaxResult readClasses(Long collegeId) {
        return AjaxResult.success(deptMapper.selectClasses(collegeId));
    }

    /*
    *  读取指定学校的所有的管理员
    * */
    @Override
    public AjaxResult readAdmins(Long universityId) {
        return AjaxResult.success(identityMapper.selectAdmins(universityId));
    }

    /*
    *  读取指定学院的所有的教师
    * */
    @Override
    public AjaxResult readTeachers(Long collegeId) {
        return AjaxResult.success(identityMapper.selectTeachers(collegeId));
    }

    /*
    *  添加身份
    * */
    @Override
    public AjaxResult addIdentity(Identity identity) {
        // 查询deptId名称
        String university = identityMapper.selectDeptName(identity.getUniversityId());
        String college = identityMapper.selectDeptName(identity.getCollegeId());
        String classes = identityMapper.selectDeptName(identity.getClassId());
        identity.setUniversityName(university);
        identity.setCollegeName(college);
        identity.setClassName(classes);
        // 1. 判断是否已经存在该身份
        if(identityMapper.selectCountByIdentity(identity.getUserId()) > 0){
            // 修改身份
            if(identityMapper.updateIdentity(identity) > 0){
                return AjaxResult.success("修改身份成功");
            }
        }
        // 2. 添加身份
        if(identityMapper.insertIdentity(identity) > 0){
            return AjaxResult.success("添加身份成功");
        }
        return AjaxResult.error("添加身份失败");
    }
}
