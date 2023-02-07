package com.codeonline.function.service;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.Identity;

public interface IdentifyService {

    AjaxResult addIdentity(Identity identity);

    AjaxResult readColleges(Long universityId);

    AjaxResult readClasses(Long collegeId);

    AjaxResult readAdmins(Long universityId);

    AjaxResult readTeachers(Long collegeId);

    AjaxResult readUniversities();

    AjaxResult readIdentity(Long userId);
}
