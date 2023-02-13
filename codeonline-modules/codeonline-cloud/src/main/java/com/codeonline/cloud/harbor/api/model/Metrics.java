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
 * Metrics
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class Metrics {
  @SerializedName("task_count")
  private Integer taskCount = null;

  @SerializedName("success_task_count")
  private Integer successTaskCount = null;

  @SerializedName("error_task_count")
  private Integer errorTaskCount = null;

  @SerializedName("pending_task_count")
  private Integer pendingTaskCount = null;

  @SerializedName("running_task_count")
  private Integer runningTaskCount = null;

  @SerializedName("scheduled_task_count")
  private Integer scheduledTaskCount = null;

  @SerializedName("stopped_task_count")
  private Integer stoppedTaskCount = null;

  public Metrics taskCount(Integer taskCount) {
    this.taskCount = taskCount;
    return this;
  }

   /**
   * The count of task
   * @return taskCount
  **/
  @ApiModelProperty(value = "The count of task")
  public Integer getTaskCount() {
    return taskCount;
  }

  public void setTaskCount(Integer taskCount) {
    this.taskCount = taskCount;
  }

  public Metrics successTaskCount(Integer successTaskCount) {
    this.successTaskCount = successTaskCount;
    return this;
  }

   /**
   * The count of success task
   * @return successTaskCount
  **/
  @ApiModelProperty(value = "The count of success task")
  public Integer getSuccessTaskCount() {
    return successTaskCount;
  }

  public void setSuccessTaskCount(Integer successTaskCount) {
    this.successTaskCount = successTaskCount;
  }

  public Metrics errorTaskCount(Integer errorTaskCount) {
    this.errorTaskCount = errorTaskCount;
    return this;
  }

   /**
   * The count of error task
   * @return errorTaskCount
  **/
  @ApiModelProperty(value = "The count of error task")
  public Integer getErrorTaskCount() {
    return errorTaskCount;
  }

  public void setErrorTaskCount(Integer errorTaskCount) {
    this.errorTaskCount = errorTaskCount;
  }

  public Metrics pendingTaskCount(Integer pendingTaskCount) {
    this.pendingTaskCount = pendingTaskCount;
    return this;
  }

   /**
   * The count of pending task
   * @return pendingTaskCount
  **/
  @ApiModelProperty(value = "The count of pending task")
  public Integer getPendingTaskCount() {
    return pendingTaskCount;
  }

  public void setPendingTaskCount(Integer pendingTaskCount) {
    this.pendingTaskCount = pendingTaskCount;
  }

  public Metrics runningTaskCount(Integer runningTaskCount) {
    this.runningTaskCount = runningTaskCount;
    return this;
  }

   /**
   * The count of running task
   * @return runningTaskCount
  **/
  @ApiModelProperty(value = "The count of running task")
  public Integer getRunningTaskCount() {
    return runningTaskCount;
  }

  public void setRunningTaskCount(Integer runningTaskCount) {
    this.runningTaskCount = runningTaskCount;
  }

  public Metrics scheduledTaskCount(Integer scheduledTaskCount) {
    this.scheduledTaskCount = scheduledTaskCount;
    return this;
  }

   /**
   * The count of scheduled task
   * @return scheduledTaskCount
  **/
  @ApiModelProperty(value = "The count of scheduled task")
  public Integer getScheduledTaskCount() {
    return scheduledTaskCount;
  }

  public void setScheduledTaskCount(Integer scheduledTaskCount) {
    this.scheduledTaskCount = scheduledTaskCount;
  }

  public Metrics stoppedTaskCount(Integer stoppedTaskCount) {
    this.stoppedTaskCount = stoppedTaskCount;
    return this;
  }

   /**
   * The count of stopped task
   * @return stoppedTaskCount
  **/
  @ApiModelProperty(value = "The count of stopped task")
  public Integer getStoppedTaskCount() {
    return stoppedTaskCount;
  }

  public void setStoppedTaskCount(Integer stoppedTaskCount) {
    this.stoppedTaskCount = stoppedTaskCount;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Metrics metrics = (Metrics) o;
    return Objects.equals(this.taskCount, metrics.taskCount) &&
        Objects.equals(this.successTaskCount, metrics.successTaskCount) &&
        Objects.equals(this.errorTaskCount, metrics.errorTaskCount) &&
        Objects.equals(this.pendingTaskCount, metrics.pendingTaskCount) &&
        Objects.equals(this.runningTaskCount, metrics.runningTaskCount) &&
        Objects.equals(this.scheduledTaskCount, metrics.scheduledTaskCount) &&
        Objects.equals(this.stoppedTaskCount, metrics.stoppedTaskCount);
  }

  @Override
  public int hashCode() {
    return Objects.hash(taskCount, successTaskCount, errorTaskCount, pendingTaskCount, runningTaskCount, scheduledTaskCount, stoppedTaskCount);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Metrics {\n");
    
    sb.append("    taskCount: ").append(toIndentedString(taskCount)).append("\n");
    sb.append("    successTaskCount: ").append(toIndentedString(successTaskCount)).append("\n");
    sb.append("    errorTaskCount: ").append(toIndentedString(errorTaskCount)).append("\n");
    sb.append("    pendingTaskCount: ").append(toIndentedString(pendingTaskCount)).append("\n");
    sb.append("    runningTaskCount: ").append(toIndentedString(runningTaskCount)).append("\n");
    sb.append("    scheduledTaskCount: ").append(toIndentedString(scheduledTaskCount)).append("\n");
    sb.append("    stoppedTaskCount: ").append(toIndentedString(stoppedTaskCount)).append("\n");
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

