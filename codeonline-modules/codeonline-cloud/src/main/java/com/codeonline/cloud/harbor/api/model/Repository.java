package com.codeonline.cloud.harbor.api.model;


import com.google.gson.annotations.SerializedName;
import io.swagger.annotations.ApiModelProperty;

import java.util.Objects;


/**
 * Repository
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-02T14:44:26.202Z")
public class Repository {
    @SerializedName("id")
    private Long id = null;

    @SerializedName("project_id")
    private Long projectId = null;

    @SerializedName("name")
    private String name = null;

    @SerializedName("description")
    private String description = null;

    @SerializedName("artifact_count")
    private Long artifactCount = null;

    @SerializedName("pull_count")
    private Long pullCount = null;

    @SerializedName("creation_time")
    private String creationTime = null;

    @SerializedName("update_time")
    private String updateTime = null;

    public Repository id(Long id) {
        this.id = id;
        return this;
    }

    /**
     * The ID of the repository
     * @return id
     **/
    @ApiModelProperty(value = "The ID of the repository")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Repository projectId(Long projectId) {
        this.projectId = projectId;
        return this;
    }

    /**
     * The ID of the project that the repository belongs to
     * @return projectId
     **/
    @ApiModelProperty(value = "The ID of the project that the repository belongs to")
    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Repository name(String name) {
        this.name = name;
        return this;
    }

    /**
     * The name of the repository
     * @return name
     **/
    @ApiModelProperty(value = "The name of the repository")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Repository description(String description) {
        this.description = description;
        return this;
    }

    /**
     * The description of the repository
     * @return description
     **/
    @ApiModelProperty(value = "The description of the repository")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Repository artifactCount(Long artifactCount) {
        this.artifactCount = artifactCount;
        return this;
    }

    /**
     * The count of the artifacts inside the repository
     * @return artifactCount
     **/
    @ApiModelProperty(value = "The count of the artifacts inside the repository")
    public Long getArtifactCount() {
        return artifactCount;
    }

    public void setArtifactCount(Long artifactCount) {
        this.artifactCount = artifactCount;
    }

    public Repository pullCount(Long pullCount) {
        this.pullCount = pullCount;
        return this;
    }

    /**
     * The count that the artifact inside the repository pulled
     * @return pullCount
     **/
    @ApiModelProperty(value = "The count that the artifact inside the repository pulled")
    public Long getPullCount() {
        return pullCount;
    }

    public void setPullCount(Long pullCount) {
        this.pullCount = pullCount;
    }

    public Repository creationTime(String creationTime) {
        this.creationTime = creationTime;
        return this;
    }

    /**
     * The creation time of the repository
     * @return creationTime
     **/
    @ApiModelProperty(value = "The creation time of the repository")
    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }

    public Repository updateTime(String updateTime) {
        this.updateTime = updateTime;
        return this;
    }

    /**
     * The update time of the repository
     * @return updateTime
     **/
    @ApiModelProperty(value = "The update time of the repository")
    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Repository repository = (Repository) o;
        return Objects.equals(this.id, repository.id) &&
                Objects.equals(this.projectId, repository.projectId) &&
                Objects.equals(this.name, repository.name) &&
                Objects.equals(this.description, repository.description) &&
                Objects.equals(this.artifactCount, repository.artifactCount) &&
                Objects.equals(this.pullCount, repository.pullCount) &&
                Objects.equals(this.creationTime, repository.creationTime) &&
                Objects.equals(this.updateTime, repository.updateTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, projectId, name, description, artifactCount, pullCount, creationTime, updateTime);
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("class Repository {\n");

        sb.append("    id: ").append(toIndentedString(id)).append("\n");
        sb.append("    projectId: ").append(toIndentedString(projectId)).append("\n");
        sb.append("    name: ").append(toIndentedString(name)).append("\n");
        sb.append("    description: ").append(toIndentedString(description)).append("\n");
        sb.append("    artifactCount: ").append(toIndentedString(artifactCount)).append("\n");
        sb.append("    pullCount: ").append(toIndentedString(pullCount)).append("\n");
        sb.append("    creationTime: ").append(toIndentedString(creationTime)).append("\n");
        sb.append("    updateTime: ").append(toIndentedString(updateTime)).append("\n");
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

