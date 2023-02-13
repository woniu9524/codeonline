package com.codeonline.cloud.harbor.model;

import com.codeonline.common.core.web.domain.BaseEntity;
import lombok.Data;

@Data
public class HarborUpload extends BaseEntity {

    private Integer uploadId;

    private long userId;

    private String imageName;

    private String imageTag;

    private String introduce;

    private String imageUrl;

    private boolean isPublic;


}
