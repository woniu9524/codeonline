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

import java.util.Objects;

/**
 * Task
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class Task {
  @SerializedName("id")
  private Integer id = null;

  @SerializedName("execution_id")
  private Integer executionId = null;

  @SerializedName("status")
  private String status = null;

  @SerializedName("status_message")
  private String statusMessage = null;

  @SerializedName("run_count")
  private Integer runCount = null;

  @SerializedName("extra_attrs")
  private ExtraAttrs extraAttrs = null;

  @SerializedName("creation_time")
  private String creationTime = null;

  @SerializedName("update_time")
  private String updateTime = null;

  @SerializedName("start_time")
  private String startTime = null;

  @SerializedName("end_time")
  private String endTime = null;

  public Task id(Integer id) {
    this.id = id;
    return this;
  }

   /**
   * The ID of task
   * @return id
  **/
  @ApiModelProperty(value = "The ID of task")
  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Task executionId(Integer executionId) {
    this.executionId = executionId;
    return this;
  }

   /**
   * The ID of task execution
   * @return executionId
  **/
  @ApiModelProperty(value = "The ID of task execution")
  public Integer getExecutionId() {
    return executionId;
  }

  public void setExecutionId(Integer executionId) {
    this.executionId = executionId;
  }

  public Task status(String status) {
    this.status = status;
    return this;
  }

   /**
   * The status of task
   * @return status
  **/
  @ApiModelProperty(value = "The status of task")
  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public Task statusMessage(String statusMessage) {
    this.statusMessage = statusMessage;
    return this;
  }

   /**
   * The status message of task
   * @return statusMessage
  **/
  @ApiModelProperty(value = "The status message of task")
  public String getStatusMessage() {
    return statusMessage;
  }

  public void setStatusMessage(String statusMessage) {
    this.statusMessage = statusMessage;
  }

  public Task runCount(Integer runCount) {
    this.runCount = runCount;
    return this;
  }

   /**
   * The count of task run
   * @return runCount
  **/
  @ApiModelProperty(value = "The count of task run")
  public Integer getRunCount() {
    return runCount;
  }

  public void setRunCount(Integer runCount) {
    this.runCount = runCount;
  }

  public Task extraAttrs(ExtraAttrs extraAttrs) {
    this.extraAttrs = extraAttrs;
    return this;
  }

   /**
   * Get extraAttrs
   * @return extraAttrs
  **/
  @ApiModelProperty(value = "")
  public ExtraAttrs getExtraAttrs() {
    return extraAttrs;
  }

  public void setExtraAttrs(ExtraAttrs extraAttrs) {
    this.extraAttrs = extraAttrs;
  }

  public Task creationTime(String creationTime) {
    this.creationTime = creationTime;
    return this;
  }

   /**
   * The creation time of task
   * @return creationTime
  **/
  @ApiModelProperty(value = "The creation time of task")
  public String getCreationTime() {
    return creationTime;
  }

  public void setCreationTime(String creationTime) {
    this.creationTime = creationTime;
  }

  public Task updateTime(String updateTime) {
    this.updateTime = updateTime;
    return this;
  }

   /**
   * The update time of task
   * @return updateTime
  **/
  @ApiModelProperty(value = "The update time of task")
  public String getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(String updateTime) {
    this.updateTime = updateTime;
  }

  public Task startTime(String startTime) {
    this.startTime = startTime;
    return this;
  }

   /**
   * The start time of task
   * @return startTime
  **/
  @ApiModelProperty(value = "The start time of task")
  public String getStartTime() {
    return startTime;
  }

  public void setStartTime(String startTime) {
    this.startTime = startTime;
  }

  public Task endTime(String endTime) {
    this.endTime = endTime;
    return this;
  }

   /**
   * The end time of task
   * @return endTime
  **/
  @ApiModelProperty(value = "The end time of task")
  public String getEndTime() {
    return endTime;
  }

  public void setEndTime(String endTime) {
    this.endTime = endTime;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Task task = (Task) o;
    return Objects.equals(this.id, task.id) &&
        Objects.equals(this.executionId, task.executionId) &&
        Objects.equals(this.status, task.status) &&
        Objects.equals(this.statusMessage, task.statusMessage) &&
        Objects.equals(this.runCount, task.runCount) &&
        Objects.equals(this.extraAttrs, task.extraAttrs) &&
        Objects.equals(this.creationTime, task.creationTime) &&
        Objects.equals(this.updateTime, task.updateTime) &&
        Objects.equals(this.startTime, task.startTime) &&
        Objects.equals(this.endTime, task.endTime);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, executionId, status, statusMessage, runCount, extraAttrs, creationTime, updateTime, startTime, endTime);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Task {\n");
    
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    executionId: ").append(toIndentedString(executionId)).append("\n");
    sb.append("    status: ").append(toIndentedString(status)).append("\n");
    sb.append("    statusMessage: ").append(toIndentedString(statusMessage)).append("\n");
    sb.append("    runCount: ").append(toIndentedString(runCount)).append("\n");
    sb.append("    extraAttrs: ").append(toIndentedString(extraAttrs)).append("\n");
    sb.append("    creationTime: ").append(toIndentedString(creationTime)).append("\n");
    sb.append("    updateTime: ").append(toIndentedString(updateTime)).append("\n");
    sb.append("    startTime: ").append(toIndentedString(startTime)).append("\n");
    sb.append("    endTime: ").append(toIndentedString(endTime)).append("\n");
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
