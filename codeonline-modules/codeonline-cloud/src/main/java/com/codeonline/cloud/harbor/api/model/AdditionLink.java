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
 * AdditionLink
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class AdditionLink {
  @SerializedName("href")
  private String href = null;

  @SerializedName("absolute")
  private Boolean absolute = null;

  public AdditionLink href(String href) {
    this.href = href;
    return this;
  }

   /**
   * The link of the addition
   * @return href
  **/
  @ApiModelProperty(value = "The link of the addition")
  public String getHref() {
    return href;
  }

  public void setHref(String href) {
    this.href = href;
  }

  public AdditionLink absolute(Boolean absolute) {
    this.absolute = absolute;
    return this;
  }

   /**
   * Determine whether the link is an absolute URL or not
   * @return absolute
  **/
  @ApiModelProperty(value = "Determine whether the link is an absolute URL or not")
  public Boolean isAbsolute() {
    return absolute;
  }

  public void setAbsolute(Boolean absolute) {
    this.absolute = absolute;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    AdditionLink additionLink = (AdditionLink) o;
    return Objects.equals(this.href, additionLink.href) &&
        Objects.equals(this.absolute, additionLink.absolute);
  }

  @Override
  public int hashCode() {
    return Objects.hash(href, absolute);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class AdditionLink {\n");
    
    sb.append("    href: ").append(toIndentedString(href)).append("\n");
    sb.append("    absolute: ").append(toIndentedString(absolute)).append("\n");
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

