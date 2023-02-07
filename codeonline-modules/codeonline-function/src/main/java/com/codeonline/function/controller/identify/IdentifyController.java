package com.codeonline.function.controller.identify;

import com.codeonline.common.core.web.domain.AjaxResult;
import com.codeonline.common.security.annotation.RequiresPermissions;
import com.codeonline.common.security.utils.SecurityUtils;
import com.codeonline.function.domain.Identity;
import com.codeonline.function.service.IdentifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/identity")
public class IdentifyController {

    @Autowired
    private IdentifyService identifyService;

    @RequiresPermissions("identify:list")
    @GetMapping("/universities")
    public AjaxResult readUniversities() {
        return identifyService.readUniversities();
    }
    @RequiresPermissions("identify:list")
    @GetMapping("/colleges/{universityId}")
    public AjaxResult readCollege(@PathVariable("universityId") Long universityId) {
        return identifyService.readColleges(universityId);
    }

    @RequiresPermissions("identify:list")
    @GetMapping("/classes/{collegeId}")
    public AjaxResult readClasses(@PathVariable Long collegeId) {
        return identifyService.readClasses(collegeId);
    }

    @RequiresPermissions("identify:list")
    @GetMapping("/admins/{universityId}")
    public AjaxResult readAdmins(@PathVariable Long universityId) {
        return identifyService.readAdmins(universityId);
    }

    @RequiresPermissions("identify:list")
    @GetMapping("/teachers/{collegeId}")
    public AjaxResult readTeachers(@PathVariable Long collegeId) {
        return identifyService.readTeachers(collegeId);
    }

    @RequiresPermissions("identify:list")
    @PostMapping("/forms")
    public AjaxResult addIdentity(@RequestBody Identity identity) {
        Long userId = SecurityUtils.getUserId();
        String username = SecurityUtils.getUsername();
        identity.setUserId(userId);
        identity.setCreateBy(username);
        identity.setUpdateBy(username);
        return identifyService.addIdentity(identity);
    }

    @RequiresPermissions("identify:list")
    @GetMapping()
    public AjaxResult readIdentity() {
        Long userId = SecurityUtils.getUserId();
        return identifyService.readIdentity(userId);
    }

}
