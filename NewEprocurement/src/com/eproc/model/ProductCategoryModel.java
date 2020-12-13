/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.ProductCategory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Windows7
 */
public class ProductCategoryModel implements Validator{

    @Override
    public boolean supports(Class<?> ProductCategory) {
         return ProductCategory.class.equals(ProductCategory);
    }

    @Override
    public void validate(Object obj, Errors err) {
       
        ProductCategory productCategory=(ProductCategory) obj;
         ValidationUtils.rejectIfEmptyOrWhitespace(err, "productCategoryName","required.name", "Please enter productCategory name");
        
    }
    
}
