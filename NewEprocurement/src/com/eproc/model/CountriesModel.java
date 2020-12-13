/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.Countries;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Windows7
 */
@Component
public class CountriesModel implements Validator {

    @Override
    public boolean supports(Class<?> type) {
       return Countries.class.equals(type);
    }

    @Override
    public void validate(Object obj, Errors err) {
        Countries countries = (Countries) obj;
       
         ValidationUtils.rejectIfEmptyOrWhitespace(err, "country_name", "required.country_name", "Please Enter Country Name");
   
    }
    
}
