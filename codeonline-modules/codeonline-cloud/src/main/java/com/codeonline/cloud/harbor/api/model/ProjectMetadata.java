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
 * ProjectMetadata
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class ProjectMetadata {
  @SerializedName("public")
  private String _public = null;

  @SerializedName("enable_content_trust")
  private String enableContentTrust = null;

  @SerializedName("enable_content_trust_cosign")
  private String enableContentTrustCosign = null;

  @SerializedName("prevent_vul")
  private String preventVul = null;

  @SerializedName("severity")
  private String severity = null;

  @SerializedName("auto_scan")
  private String autoScan = null;

  @SerializedName("reuse_sys_cve_allowlist")
  private String reuseSysCveAllowlist = null;

  @SerializedName("retention_id")
  private String retentionId = null;

  public ProjectMetadata _public(String _public) {
    this._public = _public;
    return this;
  }

   /**
   * The public status of the project. The valid values are \&quot;true\&quot;, \&quot;false\&quot;.
   * @return _public
  **/
  @ApiModelProperty(value = "The public status of the project. The valid values are \"true\", \"false\".")
  public String getPublic() {
    return _public;
  }

  public void setPublic(String _public) {
    this._public = _public;
  }

  public ProjectMetadata enableContentTrust(String enableContentTrust) {
    this.enableContentTrust = enableContentTrust;
    return this;
  }

   /**
   * Whether content trust is enabled or not. If it is enabled, user can&#39;t pull unsigned images from this project. The valid values are \&quot;true\&quot;, \&quot;false\&quot;.
   * @return enableContentTrust
  **/
  @ApiModelProperty(value = "Whether content trust is enabled or not. If it is enabled, user can't pull unsigned images from this project. The valid values are \"true\", \"false\".")
  public String getEnableContentTrust() {
    return enableContentTrust;
  }

  public void setEnableContentTrust(String enableContentTrust) {
    this.enableContentTrust = enableContentTrust;
  }

  public ProjectMetadata enableContentTrustCosign(String enableContentTrustCosign) {
    this.enableContentTrustCosign = enableContentTrustCosign;
    return this;
  }

   /**
   * Whether cosign content trust is enabled or not. If it is enabled, user can&#39;t pull images without cosign signature from this project. The valid values are \&quot;true\&quot;, \&quot;false\&quot;.
   * @return enableContentTrustCosign
  **/
  @ApiModelProperty(value = "Whether cosign content trust is enabled or not. If it is enabled, user can't pull images without cosign signature from this project. The valid values are \"true\", \"false\".")
  public String getEnableContentTrustCosign() {
    return enableContentTrustCosign;
  }

  public void setEnableContentTrustCosign(String enableContentTrustCosign) {
    this.enableContentTrustCosign = enableContentTrustCosign;
  }

  public ProjectMetadata preventVul(String preventVul) {
    this.preventVul = preventVul;
    return this;
  }

   /**
   * Whether prevent the vulnerable images from running. The valid values are \&quot;true\&quot;, \&quot;false\&quot;.
   * @return preventVul
  **/
  @ApiModelProperty(value = "Whether prevent the vulnerable images from running. The valid values are \"true\", \"false\".")
  public String getPreventVul() {
    return preventVul;
  }

  public void setPreventVul(String preventVul) {
    this.preventVul = preventVul;
  }

  public ProjectMetadata severity(String severity) {
    this.severity = severity;
    return this;
  }

   /**
   * If the vulnerability is high than severity defined here, the images can&#39;t be pulled. The valid values are \&quot;none\&quot;, \&quot;low\&quot;, \&quot;medium\&quot;, \&quot;high\&quot;, \&quot;critical\&quot;.
   * @return severity
  **/
  @ApiModelProperty(value = "If the vulnerability is high than severity defined here, the images can't be pulled. The valid values are \"none\", \"low\", \"medium\", \"high\", \"critical\".")
  public String getSeverity() {
    return severity;
  }

  public void setSeverity(String severity) {
    this.severity = severity;
  }

  public ProjectMetadata autoScan(String autoScan) {
    this.autoScan = autoScan;
    return this;
  }

   /**
   * Whether scan images automatically when pushing. The valid values are \&quot;true\&quot;, \&quot;false\&quot;.
   * @return autoScan
  **/
  @ApiModelProperty(value = "Whether scan images automatically when pushing. The valid values are \"true\", \"false\".")
  public String getAutoScan() {
    return autoScan;
  }

  public void setAutoScan(String autoScan) {
    this.autoScan = autoScan;
  }

  public ProjectMetadata reuseSysCveAllowlist(String reuseSysCveAllowlist) {
    this.reuseSysCveAllowlist = reuseSysCveAllowlist;
    return this;
  }

   /**
   * Whether this project reuse the system level CVE allowlist as the allowlist of its own.  The valid values are \&quot;true\&quot;, \&quot;false\&quot;. If it is set to \&quot;true\&quot; the actual allowlist associate with this project, if any, will be ignored.
   * @return reuseSysCveAllowlist
  **/
  @ApiModelProperty(value = "Whether this project reuse the system level CVE allowlist as the allowlist of its own.  The valid values are \"true\", \"false\". If it is set to \"true\" the actual allowlist associate with this project, if any, will be ignored.")
  public String getReuseSysCveAllowlist() {
    return reuseSysCveAllowlist;
  }

  public void setReuseSysCveAllowlist(String reuseSysCveAllowlist) {
    this.reuseSysCveAllowlist = reuseSysCveAllowlist;
  }

  public ProjectMetadata retentionId(String retentionId) {
    this.retentionId = retentionId;
    return this;
  }

   /**
   * The ID of the tag retention policy for the project
   * @return retentionId
  **/
  @ApiModelProperty(value = "The ID of the tag retention policy for the project")
  public String getRetentionId() {
    return retentionId;
  }

  public void setRetentionId(String retentionId) {
    this.retentionId = retentionId;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ProjectMetadata projectMetadata = (ProjectMetadata) o;
    return Objects.equals(this._public, projectMetadata._public) &&
        Objects.equals(this.enableContentTrust, projectMetadata.enableContentTrust) &&
        Objects.equals(this.enableContentTrustCosign, projectMetadata.enableContentTrustCosign) &&
        Objects.equals(this.preventVul, projectMetadata.preventVul) &&
        Objects.equals(this.severity, projectMetadata.severity) &&
        Objects.equals(this.autoScan, projectMetadata.autoScan) &&
        Objects.equals(this.reuseSysCveAllowlist, projectMetadata.reuseSysCveAllowlist) &&
        Objects.equals(this.retentionId, projectMetadata.retentionId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(_public, enableContentTrust, enableContentTrustCosign, preventVul, severity, autoScan, reuseSysCveAllowlist, retentionId);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ProjectMetadata {\n");
    
    sb.append("    _public: ").append(toIndentedString(_public)).append("\n");
    sb.append("    enableContentTrust: ").append(toIndentedString(enableContentTrust)).append("\n");
    sb.append("    enableContentTrustCosign: ").append(toIndentedString(enableContentTrustCosign)).append("\n");
    sb.append("    preventVul: ").append(toIndentedString(preventVul)).append("\n");
    sb.append("    severity: ").append(toIndentedString(severity)).append("\n");
    sb.append("    autoScan: ").append(toIndentedString(autoScan)).append("\n");
    sb.append("    reuseSysCveAllowlist: ").append(toIndentedString(reuseSysCveAllowlist)).append("\n");
    sb.append("    retentionId: ").append(toIndentedString(retentionId)).append("\n");
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

