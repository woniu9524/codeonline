package com.codeonline.function.domain.vo;

import com.codeonline.function.domain.Identity;
import lombok.Data;

/**
 * @Author: zhangcheng
 * @Date: 2023/2/8 4:46 星期三
 * @Description: 身份认证状态
 */
@Data
public class IdentityAffairVo extends Identity {
    private String approverName;

}
