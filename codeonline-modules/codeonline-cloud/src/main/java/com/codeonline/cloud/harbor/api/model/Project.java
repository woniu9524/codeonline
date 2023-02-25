/*
 * Harbor API
 * These APIs provide services for manipulating Harbor project.
 *
 * OpenAPI spec version: 2.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package com.codeonline.cloud.harbor.api.model;

import com.google.gson.annotations.SerializedName;
import io.swagger.annotations.ApiModelProperty;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Project
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class Project {
  @SerializedName("project_id")
  private Integer projectId = null;

  @SerializedName("owner_id")
  private Integer ownerId = null;

  @SerializedName("name")
  private String name = null;

  @SerializedName("registry_id")
  private Long registryId = null;

  @SerializedName("creation_time")
  private String creationTime = null;

  @SerializedName("update_time")
  private String updateTime = null;

  @SerializedName("deleted")
  private Boolean deleted = null;

  @SerializedName("owner_name")
  private String ownerName = null;

  @SerializedName("togglable")
  private Boolean togglable = null;

  @SerializedName("current_user_role_id")
  private Integer currentUserRoleId = null;

  @SerializedName("current_user_role_ids")
  private List<Integer> currentUserRoleIds = null;

  @SerializedName("repo_count")
  private Integer repoCount = null;

  @SerializedName("chart_count")
  private Integer chartCount = null;

  @SerializedName("metadata")
  private ProjectMetadata metadata = null;

  @SerializedName("cve_allowlist")
  private CVEAllowlist cveAllowlist = null;

  public Project projectId(Integer projectId) {
    this.projectId = projectId;
    return this;
  }

   /**
   * Project ID
   * @return projectId
  **/
  @ApiModelProperty(value = "Project ID")
  public Integer getProjectId() {
    return projectId;
  }

  public void setProjectId(Integer projectId) {
    this.projectId = projectId;
  }

  public Project ownerId(Integer ownerId) {
    this.ownerId = ownerId;
    return this;
  }

   /**
   * The owner ID of the project always means the creator of the project.
   * @return ownerId
  **/
  @ApiModelProperty(value = "The owner ID of the project always means the creator of the project.")
  public Integer getOwnerId() {
    return ownerId;
  }

  public void setOwnerId(Integer ownerId) {
    this.ownerId = ownerId;
  }

  public Project name(String name) {
    this.name = name;
    return this;
  }

   /**
   * The name of the project.
   * @return name
  **/
  @ApiModelProperty(value = "The name of the project.")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Project registryId(Long registryId) {
    this.registryId = registryId;
    return this;
  }

   /**
   * The ID of referenced registry when the project is a proxy cache project.
   * @return registryId
  **/
  @ApiModelProperty(value = "The ID of referenced registry when the project is a proxy cache project.")
  public Long getRegistryId() {
    return registryId;
  }

  public void setRegistryId(Long registryId) {
    this.registryId = registryId;
  }

  public Project creationTime(String creationTime) {
    this.creationTime = creationTime;
    return this;
  }

   /**
   * The creation time of the project.
   * @return creationTime
  **/
  @ApiModelProperty(value = "The creation time of the project.")
  public String getCreationTime() {
    return creationTime;
  }

  public void setCreationTime(String creationTime) {
    this.creationTime = creationTime;
  }

  public Project updateTime(String updateTime) {
    this.updateTime = updateTime;
    return this;
  }

   /**
   * The update time of the project.
   * @return updateTime
  **/
  @ApiModelProperty(value = "The update time of the project.")
  public String getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(String updateTime) {
    this.updateTime = updateTime;
  }

  public Project deleted(Boolean deleted) {
    this.deleted = deleted;
    return this;
  }

   /**
   * A deletion mark of the project.
   * @return deleted
  **/
  @ApiModelProperty(value = "A deletion mark of the project.")
  public Boolean isDeleted() {
    return deleted;
  }

  public void setDeleted(Boolean deleted) {
    this.deleted = deleted;
  }

  public Project ownerName(String ownerName) {
    this.ownerName = ownerName;
    return this;
  }

   /**
   * The owner name of the project.
   * @return ownerName
  **/
  @ApiModelProperty(value = "The owner name of the project.")
  public String getOwnerName() {
    return ownerName;
  }

  public void setOwnerName(String ownerName) {
    this.ownerName = ownerName;
  }

  public Project togglable(Boolean togglable) {
    this.togglable = togglable;
    return this;
  }

   /**
   * Correspond to the UI about whether the project&#39;s publicity is  updatable (for UI)
   * @return togglable
  **/
  @ApiModelProperty(value = "Correspond to the UI about whether the project's publicity is  updatable (for UI)")
  public Boolean isTogglable() {
    return togglable;
  }

  public void setTogglable(Boolean togglable) {
    this.togglable = togglable;
  }

  public Project currentUserRoleId(Integer currentUserRoleId) {
    this.currentUserRoleId = currentUserRoleId;
    return this;
  }

   /**
   * The role ID with highest permission of the current user who triggered the API (for UI).  This attribute is deprecated and will be removed in future versions.
   * @return currentUserRoleId
  **/
  @ApiModelProperty(value = "The role ID with highest permission of the current user who triggered the API (for UI).  This attribute is deprecated and will be removed in future versions.")
  public Integer getCurrentUserRoleId() {
    return currentUserRoleId;
  }

  public void setCurrentUserRoleId(Integer currentUserRoleId) {
    this.currentUserRoleId = currentUserRoleId;
  }

  public Project currentUserRoleIds(List<Integer> currentUserRoleIds) {
    this.currentUserRoleIds = currentUserRoleIds;
    return this;
  }

  public Project addCurrentUserRoleIdsItem(Integer currentUserRoleIdsItem) {
    if (this.currentUserRoleIds == null) {
      this.currentUserRoleIds = new ArrayList<Integer>();
    }
    this.currentUserRoleIds.add(currentUserRoleIdsItem);
    return this;
  }

   /**
   * The list of role ID of the current user who triggered the API (for UI)
   * @return currentUserRoleIds
  **/
  @ApiModelProperty(value = "The list of role ID of the current user who triggered the API (for UI)")
  public List<Integer> getCurrentUserRoleIds() {
    return currentUserRoleIds;
  }

  public void setCurrentUserRoleIds(List<Integer> currentUserRoleIds) {
    this.currentUserRoleIds = currentUserRoleIds;
  }

  public Project repoCount(Integer repoCount) {
    this.repoCount = repoCount;
    return this;
  }

   /**
   * The number of the repositories under this project.
   * @return repoCount
  **/
  @ApiModelProperty(value = "The number of the repositories under this project.")
  public Integer getRepoCount() {
    return repoCount;
  }

  public void setRepoCount(Integer repoCount) {
    this.repoCount = repoCount;
  }

  public Project chartCount(Integer chartCount) {
    this.chartCount = chartCount;
    return this;
  }

   /**
   * The total number of charts under this project.
   * @return chartCount
  **/
  @ApiModelProperty(value = "The total number of charts under this project.")
  public Integer getChartCount() {
    return chartCount;
  }

  public void setChartCount(Integer chartCount) {
    this.chartCount = chartCount;
  }

  public Project metadata(ProjectMetadata metadata) {
    this.metadata = metadata;
    return this;
  }

   /**
   * The metadata of the project.
   * @return metadata
  **/
  @ApiModelProperty(value = "The metadata of the project.")
  public ProjectMetadata getMetadata() {
    return metadata;
  }

  public void setMetadata(ProjectMetadata metadata) {
    this.metadata = metadata;
  }

  public Project cveAllowlist(CVEAllowlist cveAllowlist) {
    this.cveAllowlist = cveAllowlist;
    return this;
  }

   /**
   * The CVE allowlist of this project.
   * @return cveAllowlist
  **/
  @ApiModelProperty(value = "The CVE allowlist of this project.")
  public CVEAllowlist getCveAllowlist() {
    return cveAllowlist;
  }

  public void setCveAllowlist(CVEAllowlist cveAllowlist) {
    this.cveAllowlist = cveAllowlist;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Project project = (Project) o;
    return Objects.equals(this.projectId, project.projectId) &&
        Objects.equals(this.ownerId, project.ownerId) &&
        Objects.equals(this.name, project.name) &&
        Objects.equals(this.registryId, project.registryId) &&
        Objects.equals(this.creationTime, project.creationTime) &&
        Objects.equals(this.updateTime, project.updateTime) &&
        Objects.equals(this.deleted, project.deleted) &&
        Objects.equals(this.ownerName, project.ownerName) &&
        Objects.equals(this.togglable, project.togglable) &&
        Objects.equals(this.currentUserRoleId, project.currentUserRoleId) &&
        Objects.equals(this.currentUserRoleIds, project.currentUserRoleIds) &&
        Objects.equals(this.repoCount, project.repoCount) &&
        Objects.equals(this.chartCount, project.chartCount) &&
        Objects.equals(this.metadata, project.metadata) &&
        Objects.equals(this.cveAllowlist, project.cveAllowlist);
  }

  @Override
  public int hashCode() {
    return Objects.hash(projectId, ownerId, name, registryId, creationTime, updateTime, deleted, ownerName, togglable, currentUserRoleId, currentUserRoleIds, repoCount, chartCount, metadata, cveAllowlist);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Project {\n");
    
    sb.append("    projectId: ").append(toIndentedString(projectId)).append("\n");
    sb.append("    ownerId: ").append(toIndentedString(ownerId)).append("\n");
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    registryId: ").append(toIndentedString(registryId)).append("\n");
    sb.append("    creationTime: ").append(toIndentedString(creationTime)).append("\n");
    sb.append("    updateTime: ").append(toIndentedString(updateTime)).append("\n");
    sb.append("    deleted: ").append(toIndentedString(deleted)).append("\n");
    sb.append("    ownerName: ").append(toIndentedString(ownerName)).append("\n");
    sb.append("    togglable: ").append(toIndentedString(togglable)).append("\n");
    sb.append("    currentUserRoleId: ").append(toIndentedString(currentUserRoleId)).append("\n");
    sb.append("    currentUserRoleIds: ").append(toIndentedString(currentUserRoleIds)).append("\n");
    sb.append("    repoCount: ").append(toIndentedString(repoCount)).append("\n");
    sb.append("    chartCount: ").append(toIndentedString(chartCount)).append("\n");
    sb.append("    metadata: ").append(toIndentedString(metadata)).append("\n");
    sb.append("    cveAllowlist: ").append(toIndentedString(cveAllowlist)).append("\n");
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
