
package com.eproc.model;

import com.eproc.domain.AreaOfWork;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Naina Jain
 */
@Component
public class AreaOfWorkModel implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return AreaOfWork.class.equals(type);
    }

    @Override
    public void validate(Object obj, Errors err) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        AreaOfWork addareaofwork = (AreaOfWork) obj;

        if (addareaofwork.getTender_category_id() == -1) {//Condition For Dropdown
            err.rejectValue("tender_category_id", "required.name", "Please Select Tender Category");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "areaofwork_name", "required.name", "Please Enter Area Of Work");
    }
}
