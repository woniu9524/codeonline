package com.codeonline.function.domain;

import com.codeonline.common.core.web.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Identity extends BaseEntity {
    private Long id;

    private Long userId;

    @JsonProperty("identityChoose")
    private Long identityId;

    @JsonProperty("universityChoose")
    private Long universityId;

    @JsonProperty("collegeChoose")
    private Long collegeId;

    private String universityName;

    private String collegeName;

    private String className;

    @JsonProperty("classChoose")
    private Long classId;

    @JsonProperty("adminChoose")
    private Long approverId;

    private Boolean hasFinished;

    private String status;

}

