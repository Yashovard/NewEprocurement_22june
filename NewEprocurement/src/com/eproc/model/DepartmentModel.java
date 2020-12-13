package com.eproc.model;

import com.eproc.domain.Department;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class DepartmentModel implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Department.class.equals(type);
    }

    @Override
    public void validate(Object obj, Errors err) {
        System.out.println("Calling class StudentModel its method validate");
        Department department = (Department) obj;

        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptName", "required.name", "Enter a valid name");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptPhoneNo", "required.name", "Enter a valid phone");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptFaxNo", "required.name", "Enter a valid faxno");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptEmailId", "required.name", "Enter a valid emailid");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptLoginId", "required.name", "Enter a valid loginid");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptLoginPass", "required.name", "Enter a valid loginpass");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptRegistrationDate", "required.name", "Enter a valid registrationdate");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptUserName", "required.name", "Enter a valid username");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptStatus", "required.name", "Enter a valid status");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptShortName", "required.name", "Enter a valid shortname");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptAddress", "required.name", "Enter a valid address");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptMobNo", "required.name", "Enter a valid mobileno");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptWebUrl", "required.name", "Enter a valid weburl");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "encreptPassword", "required.name", "Enter a valid password");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "updatedOn", "required.name", "Enter a valid updateon");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptLogoFileName", "required.name", "Enter a valid logofilename");
//        ValidationUtils.rejectIfEmptyOrWhitespace(err, "deptLogoLocation", "required.name", "Enter a valid logolocation");
    }
}