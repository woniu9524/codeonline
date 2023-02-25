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
 * RetentionExecutionTask
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class RetentionExecutionTask {
  @SerializedName("id")
  private Long id = null;

  @SerializedName("execution_id")
  private Long executionId = null;

  @SerializedName("repository")
  private String repository = null;

  @SerializedName("job_id")
  private String jobId = null;

  @SerializedName("status")
  private String status = null;

  @SerializedName("status_code")
  private Integer statusCode = null;

  @SerializedName("status_revision")
  private Long statusRevision = null;

  @SerializedName("start_time")
  private String startTime = null;

  @SerializedName("end_time")
  private String endTime = null;

  @SerializedName("total")
  private Integer total = null;

  @SerializedName("retained")
  private Integer retained = null;

  public RetentionExecutionTask id(Long id) {
    this.id = id;
    return this;
  }

   /**
   * Get id
   * @return id
  **/
  @ApiModelProperty(value = "")
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public RetentionExecutionTask executionId(Long executionId) {
    this.executionId = executionId;
    return this;
  }

   /**
   * Get executionId
   * @return executionId
  **/
  @ApiModelProperty(value = "")
  public Long getExecutionId() {
    return executionId;
  }

  public void setExecutionId(Long executionId) {
    this.executionId = executionId;
  }

  public RetentionExecutionTask repository(String repository) {
    this.repository = repository;
    return this;
  }

   /**
   * Get repository
   * @return repository
  **/
  @ApiModelProperty(value = "")
  public String getRepository() {
    return repository;
  }

  public void setRepository(String repository) {
    this.repository = repository;
  }

  public RetentionExecutionTask jobId(String jobId) {
    this.jobId = jobId;
    return this;
  }

   /**
   * Get jobId
   * @return jobId
  **/
  @ApiModelProperty(value = "")
  public String getJobId() {
    return jobId;
  }

  public void setJobId(String jobId) {
    this.jobId = jobId;
  }

  public RetentionExecutionTask status(String status) {
    this.status = status;
    return this;
  }

   /**
   * Get status
   * @return status
  **/
  @ApiModelProperty(value = "")
  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public RetentionExecutionTask statusCode(Integer statusCode) {
    this.statusCode = statusCode;
    return this;
  }

   /**
   * Get statusCode
   * @return statusCode
  **/
  @ApiModelProperty(value = "")
  public Integer getStatusCode() {
    return statusCode;
  }

  public void setStatusCode(Integer statusCode) {
    this.statusCode = statusCode;
  }

  public RetentionExecutionTask statusRevision(Long statusRevision) {
    this.statusRevision = statusRevision;
    return this;
  }

   /**
   * Get statusRevision
   * @return statusRevision
  **/
  @ApiModelProperty(value = "")
  public Long getStatusRevision() {
    return statusRevision;
  }

  public void setStatusRevision(Long statusRevision) {
    this.statusRevision = statusRevision;
  }

  public RetentionExecutionTask startTime(String startTime) {
    this.startTime = startTime;
    return this;
  }

   /**
   * Get startTime
   * @return startTime
  **/
  @ApiModelProperty(value = "")
  public String getStartTime() {
    return startTime;
  }

  public void setStartTime(String startTime) {
    this.startTime = startTime;
  }

  public RetentionExecutionTask endTime(String endTime) {
    this.endTime = endTime;
    return this;
  }

   /**
   * Get endTime
   * @return endTime
  **/
  @ApiModelProperty(value = "")
  public String getEndTime() {
    return endTime;
  }

  public void setEndTime(String endTime) {
    this.endTime = endTime;
  }

  public RetentionExecutionTask total(Integer total) {
    this.total = total;
    return this;
  }

   /**
   * Get total
   * @return total
  **/
  @ApiModelProperty(value = "")
  public Integer getTotal() {
    return total;
  }

  public void setTotal(Integer total) {
    this.total = total;
  }

  public RetentionExecutionTask retained(Integer retained) {
    this.retained = retained;
    return this;
  }

   /**
   * Get retained
   * @return retained
  **/
  @ApiModelProperty(value = "")
  public Integer getRetained() {
    return retained;
  }

  public void setRetained(Integer retained) {
    this.retained = retained;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    RetentionExecutionTask retentionExecutionTask = (RetentionExecutionTask) o;
    return Objects.equals(this.id, retentionExecutionTask.id) &&
        Objects.equals(this.executionId, retentionExecutionTask.executionId) &&
        Objects.equals(this.repository, retentionExecutionTask.repository) &&
        Objects.equals(this.jobId, retentionExecutionTask.jobId) &&
        Objects.equals(this.status, retentionExecutionTask.status) &&
        Objects.equals(this.statusCode, retentionExecutionTask.statusCode) &&
        Objects.equals(this.statusRevision, retentionExecutionTask.statusRevision) &&
        Objects.equals(this.startTime, retentionExecutionTask.startTime) &&
        Objects.equals(this.endTime, retentionExecutionTask.endTime) &&
        Objects.equals(this.total, retentionExecutionTask.total) &&
        Objects.equals(this.retained, retentionExecutionTask.retained);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, executionId, repository, jobId, status, statusCode, statusRevision, startTime, endTime, total, retained);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class RetentionExecutionTask {\n");
    
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    executionId: ").append(toIndentedString(executionId)).append("\n");
    sb.append("    repository: ").append(toIndentedString(repository)).append("\n");
    sb.append("    jobId: ").append(toIndentedString(jobId)).append("\n");
    sb.append("    status: ").append(toIndentedString(status)).append("\n");
    sb.append("    statusCode: ").append(toIndentedString(statusCode)).append("\n");
    sb.append("    statusRevision: ").append(toIndentedString(statusRevision)).append("\n");
    sb.append("    startTime: ").append(toIndentedString(startTime)).append("\n");
    sb.append("    endTime: ").append(toIndentedString(endTime)).append("\n");
    sb.append("    total: ").append(toIndentedString(total)).append("\n");
    sb.append("    retained: ").append(toIndentedString(retained)).append("\n");
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
