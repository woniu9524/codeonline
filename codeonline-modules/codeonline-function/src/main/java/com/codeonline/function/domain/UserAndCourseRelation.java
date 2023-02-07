package com.codeonline.function.domain;

import com.codeonline.common.core.web.domain.BaseEntity;
import lombok.Data;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/14 4:49 星期六
 * @Description: 学生和课程关联表
 */
@Data
public class UserAndCourseRelation extends BaseEntity {
    private Long relationId;// 关联id

    private Long userId;// 学生id

    private Long courseId;// 课程id
}

