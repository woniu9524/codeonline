package com.codeonline.cloud.harbor.mapper;

import com.codeonline.cloud.harbor.model.HarborUpload;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: Administrator
 * @Date: 2023/1/6 6:15 星期五
 * @Description: 应用市场mapper接口
 */
@Mapper
public interface MarketMapper {
    /*
    * 查询所有公开的镜像信息，按照创建时间倒序排列，按镜像名称分组，取每组的第一条
    * */
    @Select("select any_value(user_id) user_id, image_name, any_value(image_tag) image_tag, any_value(image_url) image_url,any_value(introduce) introduce, any_value(create_time) create_time,any_value(update_by) update_by,any_value(create_by) create_by, any_value(update_time) update_time from harbor_upload where is_public = 1 group by image_name order by any_value(create_time) desc")
    List<HarborUpload> getAllMarketImages();
}
