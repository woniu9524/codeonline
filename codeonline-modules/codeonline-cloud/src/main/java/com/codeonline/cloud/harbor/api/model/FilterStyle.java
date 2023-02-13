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
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * The style of the resource filter
 */
@ApiModel(description = "The style of the resource filter")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-12-30T20:20:43.840Z")
public class FilterStyle {
  @SerializedName("type")
  private String type = null;

  @SerializedName("style")
  private String style = null;

  @SerializedName("values")
  private List<String> values = null;

  public FilterStyle type(String type) {
    this.type = type;
    return this;
  }

   /**
   * The filter type
   * @return type
  **/
  @ApiModelProperty(value = "The filter type")
  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public FilterStyle style(String style) {
    this.style = style;
    return this;
  }

   /**
   * The filter style
   * @return style
  **/
  @ApiModelProperty(value = "The filter style")
  public String getStyle() {
    return style;
  }

  public void setStyle(String style) {
    this.style = style;
  }

  public FilterStyle values(List<String> values) {
    this.values = values;
    return this;
  }

  public FilterStyle addValuesItem(String valuesItem) {
    if (this.values == null) {
      this.values = new ArrayList<String>();
    }
    this.values.add(valuesItem);
    return this;
  }

   /**
   * The filter values
   * @return values
  **/
  @ApiModelProperty(value = "The filter values")
  public List<String> getValues() {
    return values;
  }

  public void setValues(List<String> values) {
    this.values = values;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    FilterStyle filterStyle = (FilterStyle) o;
    return Objects.equals(this.type, filterStyle.type) &&
        Objects.equals(this.style, filterStyle.style) &&
        Objects.equals(this.values, filterStyle.values);
  }

  @Override
  public int hashCode() {
    return Objects.hash(type, style, values);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class FilterStyle {\n");
    
    sb.append("    type: ").append(toIndentedString(type)).append("\n");
    sb.append("    style: ").append(toIndentedString(style)).append("\n");
    sb.append("    values: ").append(toIndentedString(values)).append("\n");
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

