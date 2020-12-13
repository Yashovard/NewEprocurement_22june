
package com.eproc.model;
import com.eproc.domain.Division;
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class DivisionModel implements Validator{

    @Override
    public boolean supports(Class<?> Division) {
         return Division.class.equals(Division);
         }

    @Override
    public void validate(Object obj, Errors err) {
         System.out.println("Calling class CircleModel its method validate");
         Division division =(Division)  obj;
         ValidationUtils.rejectIfEmptyOrWhitespace(err, "division","required.name", "Please enter Division name");
         ValidationUtils.rejectIfEmptyOrWhitespace(err, "circleid","required.name", "Please Select Circle name");
     

    }

 
    
    
}
