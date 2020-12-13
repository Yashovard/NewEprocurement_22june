/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.Contractor;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/*
 * @author Yashovardhan Singh
 * Contactor Model Validator Class
*  Server Side Validation
 */
public class ContractorModel implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Contractor.class.equals(type);
    }
//------------------------------------------------------------------------------
    @Override
    public void validate(Object obj, Errors err) {
        Contractor contrator = (Contractor) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "firstname", "required name", "Please Enter your first name");
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "lastname", "required name", "Please Enter your Last name");
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "company", "required name", "Please Enter your Company name");
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "designation", "required name", "Please Enter your Designation name");
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "emailid", "required name", "Please Enter your EmailId name");
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "mobileno", "required name", "Please Enter your Mobile Number name");
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "password", "required name", "Please Enter Password");
    }
}

