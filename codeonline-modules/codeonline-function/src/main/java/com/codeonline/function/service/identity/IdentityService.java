package com.codeonline.function.service.identity;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.function.domain.Identity;

public interface IdentityService {

    AjaxResult addIdentity(Identity identity);

    AjaxResult readColleges(Long universityId);

    AjaxResult readClasses(Long collegeId);

    AjaxResult readAdmins(Long universityId);

    AjaxResult readTeachers(Long collegeId);

    AjaxResult readUniversities();

    AjaxResult readIdentity(Long userId);
}
