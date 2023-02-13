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
 * BoolConfigItem
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class BoolConfigItem {
  @SerializedName("value")
  private Boolean value = null;

  @SerializedName("editable")
  private Boolean editable = null;

  public BoolConfigItem value(Boolean value) {
    this.value = value;
    return this;
  }

   /**
   * The boolean value of current config item
   * @return value
  **/
  @ApiModelProperty(value = "The boolean value of current config item")
  public Boolean isValue() {
    return value;
  }

  public void setValue(Boolean value) {
    this.value = value;
  }

  public BoolConfigItem editable(Boolean editable) {
    this.editable = editable;
    return this;
  }

   /**
   * The configure item can be updated or not
   * @return editable
  **/
  @ApiModelProperty(value = "The configure item can be updated or not")
  public Boolean isEditable() {
    return editable;
  }

  public void setEditable(Boolean editable) {
    this.editable = editable;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    BoolConfigItem boolConfigItem = (BoolConfigItem) o;
    return Objects.equals(this.value, boolConfigItem.value) &&
        Objects.equals(this.editable, boolConfigItem.editable);
  }

  @Override
  public int hashCode() {
    return Objects.hash(value, editable);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class BoolConfigItem {\n");
    
    sb.append("    value: ").append(toIndentedString(value)).append("\n");
    sb.append("    editable: ").append(toIndentedString(editable)).append("\n");
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

