
package com.eproc.model;
import com.eproc.domain.SubDivision;
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SubDivisionModel implements Validator{

    @Override
    public boolean supports(Class<?> SubDivision) {
         return SubDivision.class.equals(SubDivision);
         }

    @Override
    public void validate(Object obj, Errors err) {
        System.out.println("Calling class CircleModel its method validate");
      SubDivision subdivision  =(SubDivision)  obj;
            ValidationUtils.rejectIfEmptyOrWhitespace(err, "circleid","required.name", "Please Select Circle name");
            ValidationUtils.rejectIfEmptyOrWhitespace(err, "division_id","required.name", "Please Select Division name");
            ValidationUtils.rejectIfEmptyOrWhitespace(err, "subdivision","required.name", "Please Enter subdivision name");
         
             

    }

 
    
    
}
