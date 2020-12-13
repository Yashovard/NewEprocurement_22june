/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.Cities;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Shashank Shukla
 */
public class CitiesModel implements Validator{

    @Override
    public boolean supports(Class<?> type) {
         return Cities.class.equals(type);
    
    }

    @Override
    public void validate(Object obj, Errors err) {
    Cities cities = (Cities) obj;
        System.out.println("########"+cities.getCountry_id());
        System.out.println("########"+cities.getState_id());
    if (cities.getCountry_id() == null) {//Condition For Dropdown
            err.rejectValue("country_id", "required.name", "Please Select Country Name");
        }
    
    if (cities.getState_id() == null) {//Condition For Dropdown
            err.rejectValue("state_id", "required.name", "Please Select State Name");
        }
    
    ValidationUtils.rejectIfEmptyOrWhitespace(err, "city_name", "required.name", "Please Enter City Name");
    }
    
}
