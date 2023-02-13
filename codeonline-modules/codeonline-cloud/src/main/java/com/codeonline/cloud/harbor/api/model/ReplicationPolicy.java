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
 * ReplicationPolicy
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class ReplicationPolicy {
  @SerializedName("id")
  private Long id = null;

  @SerializedName("name")
  private String name = null;

  @SerializedName("description")
  private String description = null;

  @SerializedName("src_registry")
  private Registry srcRegistry = null;

  @SerializedName("dest_registry")
  private Registry destRegistry = null;

  @SerializedName("dest_namespace")
  private String destNamespace = null;

  @SerializedName("dest_namespace_replace_count")
  private Integer destNamespaceReplaceCount = null;

  @SerializedName("trigger")
  private ReplicationTrigger trigger = null;

  @SerializedName("filters")
  private List<ReplicationFilter> filters = null;

  @SerializedName("replicate_deletion")
  private Boolean replicateDeletion = null;

  @SerializedName("deletion")
  private Boolean deletion = null;

  @SerializedName("override")
  private Boolean override = null;

  @SerializedName("enabled")
  private Boolean enabled = null;

  @SerializedName("creation_time")
  private String creationTime = null;

  @SerializedName("update_time")
  private String updateTime = null;

  @SerializedName("speed")
  private Integer speed = null;

  @SerializedName("copy_by_chunk")
  private Boolean copyByChunk = null;

  public ReplicationPolicy id(Long id) {
    this.id = id;
    return this;
  }

   /**
   * The policy ID.
   * @return id
  **/
  @ApiModelProperty(value = "The policy ID.")
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public ReplicationPolicy name(String name) {
    this.name = name;
    return this;
  }

   /**
   * The policy name.
   * @return name
  **/
  @ApiModelProperty(value = "The policy name.")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public ReplicationPolicy description(String description) {
    this.description = description;
    return this;
  }

   /**
   * The description of the policy.
   * @return description
  **/
  @ApiModelProperty(value = "The description of the policy.")
  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public ReplicationPolicy srcRegistry(Registry srcRegistry) {
    this.srcRegistry = srcRegistry;
    return this;
  }

   /**
   * The source registry.
   * @return srcRegistry
  **/
  @ApiModelProperty(value = "The source registry.")
  public Registry getSrcRegistry() {
    return srcRegistry;
  }

  public void setSrcRegistry(Registry srcRegistry) {
    this.srcRegistry = srcRegistry;
  }

  public ReplicationPolicy destRegistry(Registry destRegistry) {
    this.destRegistry = destRegistry;
    return this;
  }

   /**
   * The destination registry.
   * @return destRegistry
  **/
  @ApiModelProperty(value = "The destination registry.")
  public Registry getDestRegistry() {
    return destRegistry;
  }

  public void setDestRegistry(Registry destRegistry) {
    this.destRegistry = destRegistry;
  }

  public ReplicationPolicy destNamespace(String destNamespace) {
    this.destNamespace = destNamespace;
    return this;
  }

   /**
   * The destination namespace.
   * @return destNamespace
  **/
  @ApiModelProperty(value = "The destination namespace.")
  public String getDestNamespace() {
    return destNamespace;
  }

  public void setDestNamespace(String destNamespace) {
    this.destNamespace = destNamespace;
  }

  public ReplicationPolicy destNamespaceReplaceCount(Integer destNamespaceReplaceCount) {
    this.destNamespaceReplaceCount = destNamespaceReplaceCount;
    return this;
  }

   /**
   * Specify how many path components will be replaced by the provided destination namespace. The default value is -1 in which case the legacy mode will be applied.
   * @return destNamespaceReplaceCount
  **/
  @ApiModelProperty(value = "Specify how many path components will be replaced by the provided destination namespace. The default value is -1 in which case the legacy mode will be applied.")
  public Integer getDestNamespaceReplaceCount() {
    return destNamespaceReplaceCount;
  }

  public void setDestNamespaceReplaceCount(Integer destNamespaceReplaceCount) {
    this.destNamespaceReplaceCount = destNamespaceReplaceCount;
  }

  public ReplicationPolicy trigger(ReplicationTrigger trigger) {
    this.trigger = trigger;
    return this;
  }

   /**
   * Get trigger
   * @return trigger
  **/
  @ApiModelProperty(value = "")
  public ReplicationTrigger getTrigger() {
    return trigger;
  }

  public void setTrigger(ReplicationTrigger trigger) {
    this.trigger = trigger;
  }

  public ReplicationPolicy filters(List<ReplicationFilter> filters) {
    this.filters = filters;
    return this;
  }

  public ReplicationPolicy addFiltersItem(ReplicationFilter filtersItem) {
    if (this.filters == null) {
      this.filters = new ArrayList<ReplicationFilter>();
    }
    this.filters.add(filtersItem);
    return this;
  }

   /**
   * The replication policy filter array.
   * @return filters
  **/
  @ApiModelProperty(value = "The replication policy filter array.")
  public List<ReplicationFilter> getFilters() {
    return filters;
  }

  public void setFilters(List<ReplicationFilter> filters) {
    this.filters = filters;
  }

  public ReplicationPolicy replicateDeletion(Boolean replicateDeletion) {
    this.replicateDeletion = replicateDeletion;
    return this;
  }

   /**
   * Whether to replicate the deletion operation.
   * @return replicateDeletion
  **/
  @ApiModelProperty(value = "Whether to replicate the deletion operation.")
  public Boolean isReplicateDeletion() {
    return replicateDeletion;
  }

  public void setReplicateDeletion(Boolean replicateDeletion) {
    this.replicateDeletion = replicateDeletion;
  }

  public ReplicationPolicy deletion(Boolean deletion) {
    this.deletion = deletion;
    return this;
  }

   /**
   * Deprecated, use \&quot;replicate_deletion\&quot; instead. Whether to replicate the deletion operation.
   * @return deletion
  **/
  @ApiModelProperty(value = "Deprecated, use \"replicate_deletion\" instead. Whether to replicate the deletion operation.")
  public Boolean isDeletion() {
    return deletion;
  }

  public void setDeletion(Boolean deletion) {
    this.deletion = deletion;
  }

  public ReplicationPolicy override(Boolean override) {
    this.override = override;
    return this;
  }

   /**
   * Whether to override the resources on the destination registry.
   * @return override
  **/
  @ApiModelProperty(value = "Whether to override the resources on the destination registry.")
  public Boolean isOverride() {
    return override;
  }

  public void setOverride(Boolean override) {
    this.override = override;
  }

  public ReplicationPolicy enabled(Boolean enabled) {
    this.enabled = enabled;
    return this;
  }

   /**
   * Whether the policy is enabled or not.
   * @return enabled
  **/
  @ApiModelProperty(value = "Whether the policy is enabled or not.")
  public Boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(Boolean enabled) {
    this.enabled = enabled;
  }

  public ReplicationPolicy creationTime(String creationTime) {
    this.creationTime = creationTime;
    return this;
  }

   /**
   * The create time of the policy.
   * @return creationTime
  **/
  @ApiModelProperty(value = "The create time of the policy.")
  public String getCreationTime() {
    return creationTime;
  }

  public void setCreationTime(String creationTime) {
    this.creationTime = creationTime;
  }

  public ReplicationPolicy updateTime(String updateTime) {
    this.updateTime = updateTime;
    return this;
  }

   /**
   * The update time of the policy.
   * @return updateTime
  **/
  @ApiModelProperty(value = "The update time of the policy.")
  public String getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(String updateTime) {
    this.updateTime = updateTime;
  }

  public ReplicationPolicy speed(Integer speed) {
    this.speed = speed;
    return this;
  }

   /**
   * speed limit for each task
   * @return speed
  **/
  @ApiModelProperty(value = "speed limit for each task")
  public Integer getSpeed() {
    return speed;
  }

  public void setSpeed(Integer speed) {
    this.speed = speed;
  }

  public ReplicationPolicy copyByChunk(Boolean copyByChunk) {
    this.copyByChunk = copyByChunk;
    return this;
  }

   /**
   * Whether to enable copy by chunk.
   * @return copyByChunk
  **/
  @ApiModelProperty(value = "Whether to enable copy by chunk.")
  public Boolean isCopyByChunk() {
    return copyByChunk;
  }

  public void setCopyByChunk(Boolean copyByChunk) {
    this.copyByChunk = copyByChunk;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ReplicationPolicy replicationPolicy = (ReplicationPolicy) o;
    return Objects.equals(this.id, replicationPolicy.id) &&
        Objects.equals(this.name, replicationPolicy.name) &&
        Objects.equals(this.description, replicationPolicy.description) &&
        Objects.equals(this.srcRegistry, replicationPolicy.srcRegistry) &&
        Objects.equals(this.destRegistry, replicationPolicy.destRegistry) &&
        Objects.equals(this.destNamespace, replicationPolicy.destNamespace) &&
        Objects.equals(this.destNamespaceReplaceCount, replicationPolicy.destNamespaceReplaceCount) &&
        Objects.equals(this.trigger, replicationPolicy.trigger) &&
        Objects.equals(this.filters, replicationPolicy.filters) &&
        Objects.equals(this.replicateDeletion, replicationPolicy.replicateDeletion) &&
        Objects.equals(this.deletion, replicationPolicy.deletion) &&
        Objects.equals(this.override, replicationPolicy.override) &&
        Objects.equals(this.enabled, replicationPolicy.enabled) &&
        Objects.equals(this.creationTime, replicationPolicy.creationTime) &&
        Objects.equals(this.updateTime, replicationPolicy.updateTime) &&
        Objects.equals(this.speed, replicationPolicy.speed) &&
        Objects.equals(this.copyByChunk, replicationPolicy.copyByChunk);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, name, description, srcRegistry, destRegistry, destNamespace, destNamespaceReplaceCount, trigger, filters, replicateDeletion, deletion, override, enabled, creationTime, updateTime, speed, copyByChunk);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ReplicationPolicy {\n");
    
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    description: ").append(toIndentedString(description)).append("\n");
    sb.append("    srcRegistry: ").append(toIndentedString(srcRegistry)).append("\n");
    sb.append("    destRegistry: ").append(toIndentedString(destRegistry)).append("\n");
    sb.append("    destNamespace: ").append(toIndentedString(destNamespace)).append("\n");
    sb.append("    destNamespaceReplaceCount: ").append(toIndentedString(destNamespaceReplaceCount)).append("\n");
    sb.append("    trigger: ").append(toIndentedString(trigger)).append("\n");
    sb.append("    filters: ").append(toIndentedString(filters)).append("\n");
    sb.append("    replicateDeletion: ").append(toIndentedString(replicateDeletion)).append("\n");
    sb.append("    deletion: ").append(toIndentedString(deletion)).append("\n");
    sb.append("    override: ").append(toIndentedString(override)).append("\n");
    sb.append("    enabled: ").append(toIndentedString(enabled)).append("\n");
    sb.append("    creationTime: ").append(toIndentedString(creationTime)).append("\n");
    sb.append("    updateTime: ").append(toIndentedString(updateTime)).append("\n");
    sb.append("    speed: ").append(toIndentedString(speed)).append("\n");
    sb.append("    copyByChunk: ").append(toIndentedString(copyByChunk)).append("\n");
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

