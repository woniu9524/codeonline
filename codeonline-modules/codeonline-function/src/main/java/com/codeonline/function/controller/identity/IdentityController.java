package com.codeonline.function.controller.identity;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.annotation.RequiresPermissions;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.Identity;

import com.codeonline.function.service.identity.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/identity")
public class IdentityController {

    @Autowired
    private IdentityService identityService;

    @RequiresPermissions("identity:list")
    @GetMapping("/universities")
    public AjaxResult readUniversities() {
        return identityService.readUniversities();
    }

    @RequiresPermissions("identity:list")
    @GetMapping("/colleges/{universityId}")
    public AjaxResult readCollege(@PathVariable("universityId") Long universityId) {
        return identityService.readColleges(universityId);
    }

    @RequiresPermissions("identity:list")
    @GetMapping("/classes/{collegeId}")
    public AjaxResult readClasses(@PathVariable Long collegeId) {
        return identityService.readClasses(collegeId);
    }

    @RequiresPermissions("identity:list")
    @GetMapping("/admins/{universityId}")
    public AjaxResult readAdmins(@PathVariable Long universityId) {
        return identityService.readAdmins(universityId);
    }

    @RequiresPermissions("identity:list")
    @GetMapping("/teachers/{collegeId}")
    public AjaxResult readTeachers(@PathVariable Long collegeId) {
        return identityService.readTeachers(collegeId);
    }

    @RequiresPermissions("identity:list")
    @PostMapping("/forms")
    public AjaxResult addIdentity(@RequestBody Identity identity) {
        Long userId = SecurityUtils.getUserId();
        String username = SecurityUtils.getUsername();
        identity.setUserId(userId);
        identity.setCreateBy(username);
        identity.setUpdateBy(username);
        return identityService.addIdentity(identity);
    }

    @RequiresPermissions("identity:list")
    @GetMapping()
    public AjaxResult readIdentity() {
        Long userId = SecurityUtils.getUserId();
        return identityService.readIdentity(userId);
    }


}
