package com.codeonline.cloud.harbor.mapper;

import com.codeonline.cloud.harbor.model.HarborUpload;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HarborUploadMapper {

    public int insertHarborUpload(HarborUpload harborUpload);
}
