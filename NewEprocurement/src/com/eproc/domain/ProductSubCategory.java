package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/*
 * Process ProductSubCategory Form page with all setter() and getter()
 * 
 *@auhtor Vaishali Gupta
 */
@Entity
@Table(name = "ProductSubCategory")
public class ProductSubCategory implements Serializable {

      @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer productSubCategoryId;
    private String productSubCategoryName;
    private Integer deptId;
    private Date Created_Date;
    private Integer productCategoryId;
    private String productCategoryName;

    public ProductSubCategory() {
    }

    public Integer getProductSubCategoryId() {
        return productSubCategoryId;
    }

    public void setProductSubCategoryId(Integer productSubCategoryId) {
        this.productSubCategoryId = productSubCategoryId;
    }

    public String getProductSubCategoryName() {
        return productSubCategoryName;
    }

    public void setProductSubCategoryName(String productSubCategoryName) {
        this.productSubCategoryName = productSubCategoryName;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Date getCreated_Date() {
        return Created_Date;
    }

    public void setCreated_Date(Date Created_Date) {
        this.Created_Date = Created_Date;
    }

   

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public String getProductCategoryName() {
        return productCategoryName;
    }

    public void setProductCategoryName(String productCategoryName) {
        this.productCategoryName = productCategoryName;
    }
   
    

}
