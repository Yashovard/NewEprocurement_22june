/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.Countries;
import com.eproc.domain.States;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Shashank Shukla
 */
public class StatesModel implements Validator {

    @Override
    public boolean supports(Class<?> type) {
          return States.class.equals(type);
    }

    @Override
    public void validate(Object obj, Errors err) {
          States state = (States) obj;
          if (state.getCountry_id() == null) {//Condition For Dropdown
            err.rejectValue("country_id", "required.name", "Please Select Country Name");
        }
    ValidationUtils.rejectIfEmptyOrWhitespace(err, "state_name", "required.state_name", "Please Enter State Name");
    }
    
}
