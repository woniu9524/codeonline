package com.codeonline.function.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.codeonline.function.domain.CourseLabFile;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @Author: zhangcheng
 * @Date: 2023/3/11 21:17 星期六
 * @Description: 测试使用mybatis plus
 */
@Mapper
@Repository
public interface CourseLabFileMapper extends BaseMapper<CourseLabFile> {
}
