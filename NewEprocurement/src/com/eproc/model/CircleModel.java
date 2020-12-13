
package com.eproc.model;

import com.eproc.domain.Circle;
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CircleModel implements Validator{

    @Override
    public boolean supports(Class<?> Circle) 
    {
         return Circle.class.equals(Circle);
    }
    @Override
    public void validate(Object obj, Errors err) {
        System.out.println("Calling class CircleModel its method validate");
       Circle dc =(Circle)  obj;
      
       ValidationUtils.rejectIfEmptyOrWhitespace(err, "circle","required.name", "Please enter circle name");
    }
}
