package com.codeonline.cloud.harbor.api.model;


import com.google.gson.annotations.SerializedName;
import io.swagger.annotations.ApiModelProperty;

import java.util.Objects;


/**
 * Tag
 */
public class Tag {
    @SerializedName("id")
    private Long id = null;

    @SerializedName("repository_id")
    private Long repositoryId = null;

    @SerializedName("artifact_id")
    private Long artifactId = null;

    @SerializedName("name")
    private String name = null;

    @SerializedName("push_time")
    private String pushTime = null;

    @SerializedName("pull_time")
    private String pullTime = null;

    @SerializedName("immutable")
    private Boolean immutable = null;

    @SerializedName("signed")
    private Boolean signed = null;

    public Tag id(Long id) {
        this.id = id;
        return this;
    }

    /**
     * The ID of the tag
     * @return id
     **/
    @ApiModelProperty(value = "The ID of the tag")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tag repositoryId(Long repositoryId) {
        this.repositoryId = repositoryId;
        return this;
    }

    /**
     * The ID of the repository that the tag belongs to
     * @return repositoryId
     **/
    @ApiModelProperty(value = "The ID of the repository that the tag belongs to")
    public Long getRepositoryId() {
        return repositoryId;
    }

    public void setRepositoryId(Long repositoryId) {
        this.repositoryId = repositoryId;
    }

    public Tag artifactId(Long artifactId) {
        this.artifactId = artifactId;
        return this;
    }

    /**
     * The ID of the artifact that the tag attached to
     * @return artifactId
     **/
    @ApiModelProperty(value = "The ID of the artifact that the tag attached to")
    public Long getArtifactId() {
        return artifactId;
    }

    public void setArtifactId(Long artifactId) {
        this.artifactId = artifactId;
    }

    public Tag name(String name) {
        this.name = name;
        return this;
    }

    /**
     * The name of the tag
     * @return name
     **/
    @ApiModelProperty(value = "The name of the tag")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Tag pushTime(String pushTime) {
        this.pushTime = pushTime;
        return this;
    }

    /**
     * The push time of the tag
     * @return pushTime
     **/
    @ApiModelProperty(value = "The push time of the tag")
    public String getPushTime() {
        return pushTime;
    }

    public void setPushTime(String pushTime) {
        this.pushTime = pushTime;
    }

    public Tag pullTime(String pullTime) {
        this.pullTime = pullTime;
        return this;
    }

    /**
     * The latest pull time of the tag
     * @return pullTime
     **/
    @ApiModelProperty(value = "The latest pull time of the tag")
    public String getPullTime() {
        return pullTime;
    }

    public void setPullTime(String pullTime) {
        this.pullTime = pullTime;
    }

    public Tag immutable(Boolean immutable) {
        this.immutable = immutable;
        return this;
    }

    /**
     * The immutable status of the tag
     * @return immutable
     **/
    @ApiModelProperty(value = "The immutable status of the tag")
    public Boolean isImmutable() {
        return immutable;
    }

    public void setImmutable(Boolean immutable) {
        this.immutable = immutable;
    }

    public Tag signed(Boolean signed) {
        this.signed = signed;
        return this;
    }

    /**
     * The attribute indicates whether the tag is signed or not
     * @return signed
     **/
    @ApiModelProperty(value = "The attribute indicates whether the tag is signed or not")
    public Boolean isSigned() {
        return signed;
    }

    public void setSigned(Boolean signed) {
        this.signed = signed;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Tag tag = (Tag) o;
        return Objects.equals(this.id, tag.id) &&
                Objects.equals(this.repositoryId, tag.repositoryId) &&
                Objects.equals(this.artifactId, tag.artifactId) &&
                Objects.equals(this.name, tag.name) &&
                Objects.equals(this.pushTime, tag.pushTime) &&
                Objects.equals(this.pullTime, tag.pullTime) &&
                Objects.equals(this.immutable, tag.immutable) &&
                Objects.equals(this.signed, tag.signed);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, repositoryId, artifactId, name, pushTime, pullTime, immutable, signed);
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("class Tag {\n");

        sb.append("    id: ").append(toIndentedString(id)).append("\n");
        sb.append("    repositoryId: ").append(toIndentedString(repositoryId)).append("\n");
        sb.append("    artifactId: ").append(toIndentedString(artifactId)).append("\n");
        sb.append("    name: ").append(toIndentedString(name)).append("\n");
        sb.append("    pushTime: ").append(toIndentedString(pushTime)).append("\n");
        sb.append("    pullTime: ").append(toIndentedString(pullTime)).append("\n");
        sb.append("    immutable: ").append(toIndentedString(immutable)).append("\n");
        sb.append("    signed: ").append(toIndentedString(signed)).append("\n");
        sb.append("}");
        return sb.toString();
    }

    /**
     * Convert the given object to string with each line indented by 4 spaces
     * (except the first line).
     */
    private String toIndentedString(Object o) {
        if (o == null) {
            return "null";
        }
        return o.toString().replace("\n", "\n    ");
    }

}

