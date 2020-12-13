/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.ProductSubCategory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Windows7
 */
public class ProductSubCategoryModel implements Validator{

    @Override
    public boolean supports(Class<?> ProductSubCategory) {
       return ProductSubCategory.class.equals(ProductSubCategory);
    }

    @Override
    public void validate(Object obj, Errors err) {
        ProductSubCategory productSubCategory=(ProductSubCategory) obj;
        
         ValidationUtils.rejectIfEmptyOrWhitespace(err, "productSubCategoryName","required.name", "Please enter ProductSubCategoryName");
         ValidationUtils.rejectIfEmptyOrWhitespace(err, "productCategoryId","required.name", "Please Select Product Category");
     
    }
    
}
