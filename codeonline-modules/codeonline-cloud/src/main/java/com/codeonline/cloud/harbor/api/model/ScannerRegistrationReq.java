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
 * ScannerRegistrationReq
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class ScannerRegistrationReq {
  @SerializedName("name")
  private String name = null;

  @SerializedName("description")
  private String description = null;

  @SerializedName("url")
  private String url = null;

  @SerializedName("auth")
  private String auth = null;

  @SerializedName("access_credential")
  private String accessCredential = null;

  @SerializedName("skip_certVerify")
  private Boolean skipCertVerify = false;

  @SerializedName("use_internal_addr")
  private Boolean useInternalAddr = false;

  @SerializedName("disabled")
  private Boolean disabled = false;

  public ScannerRegistrationReq name(String name) {
    this.name = name;
    return this;
  }

   /**
   * The name of this registration
   * @return name
  **/
  @ApiModelProperty(example = "Trivy", required = true, value = "The name of this registration")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public ScannerRegistrationReq description(String description) {
    this.description = description;
    return this;
  }

   /**
   * An optional description of this registration.
   * @return description
  **/
  @ApiModelProperty(example = "A free-to-use tool that scans container images for package vulnerabilities. ", value = "An optional description of this registration.")
  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public ScannerRegistrationReq url(String url) {
    this.url = url;
    return this;
  }

   /**
   * A base URL of the scanner adapter.
   * @return url
  **/
  @ApiModelProperty(example = "http://harbor-scanner-trivy:8080", required = true, value = "A base URL of the scanner adapter.")
  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public ScannerRegistrationReq auth(String auth) {
    this.auth = auth;
    return this;
  }

   /**
   * Specify what authentication approach is adopted for the HTTP communications. Supported types Basic\&quot;, \&quot;Bearer\&quot; and api key header \&quot;X-ScannerAdapter-API-Key\&quot; 
   * @return auth
  **/
  @ApiModelProperty(example = "Bearer", value = "Specify what authentication approach is adopted for the HTTP communications. Supported types Basic\", \"Bearer\" and api key header \"X-ScannerAdapter-API-Key\" ")
  public String getAuth() {
    return auth;
  }

  public void setAuth(String auth) {
    this.auth = auth;
  }

  public ScannerRegistrationReq accessCredential(String accessCredential) {
    this.accessCredential = accessCredential;
    return this;
  }

   /**
   * An optional value of the HTTP Authorization header sent with each request to the Scanner Adapter API. 
   * @return accessCredential
  **/
  @ApiModelProperty(example = "Bearer: JWTTOKENGOESHERE", value = "An optional value of the HTTP Authorization header sent with each request to the Scanner Adapter API. ")
  public String getAccessCredential() {
    return accessCredential;
  }

  public void setAccessCredential(String accessCredential) {
    this.accessCredential = accessCredential;
  }

  public ScannerRegistrationReq skipCertVerify(Boolean skipCertVerify) {
    this.skipCertVerify = skipCertVerify;
    return this;
  }

   /**
   * Indicate if skip the certificate verification when sending HTTP requests
   * @return skipCertVerify
  **/
  @ApiModelProperty(value = "Indicate if skip the certificate verification when sending HTTP requests")
  public Boolean isSkipCertVerify() {
    return skipCertVerify;
  }

  public void setSkipCertVerify(Boolean skipCertVerify) {
    this.skipCertVerify = skipCertVerify;
  }

  public ScannerRegistrationReq useInternalAddr(Boolean useInternalAddr) {
    this.useInternalAddr = useInternalAddr;
    return this;
  }

   /**
   * Indicate whether use internal registry addr for the scanner to pull content or not
   * @return useInternalAddr
  **/
  @ApiModelProperty(value = "Indicate whether use internal registry addr for the scanner to pull content or not")
  public Boolean isUseInternalAddr() {
    return useInternalAddr;
  }

  public void setUseInternalAddr(Boolean useInternalAddr) {
    this.useInternalAddr = useInternalAddr;
  }

  public ScannerRegistrationReq disabled(Boolean disabled) {
    this.disabled = disabled;
    return this;
  }

   /**
   * Indicate whether the registration is enabled or not
   * @return disabled
  **/
  @ApiModelProperty(value = "Indicate whether the registration is enabled or not")
  public Boolean isDisabled() {
    return disabled;
  }

  public void setDisabled(Boolean disabled) {
    this.disabled = disabled;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ScannerRegistrationReq scannerRegistrationReq = (ScannerRegistrationReq) o;
    return Objects.equals(this.name, scannerRegistrationReq.name) &&
        Objects.equals(this.description, scannerRegistrationReq.description) &&
        Objects.equals(this.url, scannerRegistrationReq.url) &&
        Objects.equals(this.auth, scannerRegistrationReq.auth) &&
        Objects.equals(this.accessCredential, scannerRegistrationReq.accessCredential) &&
        Objects.equals(this.skipCertVerify, scannerRegistrationReq.skipCertVerify) &&
        Objects.equals(this.useInternalAddr, scannerRegistrationReq.useInternalAddr) &&
        Objects.equals(this.disabled, scannerRegistrationReq.disabled);
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, description, url, auth, accessCredential, skipCertVerify, useInternalAddr, disabled);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ScannerRegistrationReq {\n");
    
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    description: ").append(toIndentedString(description)).append("\n");
    sb.append("    url: ").append(toIndentedString(url)).append("\n");
    sb.append("    auth: ").append(toIndentedString(auth)).append("\n");
    sb.append("    accessCredential: ").append(toIndentedString(accessCredential)).append("\n");
    sb.append("    skipCertVerify: ").append(toIndentedString(skipCertVerify)).append("\n");
    sb.append("    useInternalAddr: ").append(toIndentedString(useInternalAddr)).append("\n");
    sb.append("    disabled: ").append(toIndentedString(disabled)).append("\n");
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

