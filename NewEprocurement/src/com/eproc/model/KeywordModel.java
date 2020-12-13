package com.eproc.model;

import com.eproc.domain.AddKeywords;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Naina Jain
 */
@Component
public class KeywordModel implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return AddKeywords.class.equals(type);
    }

    @Override
    public void validate(Object obj, Errors err) {
        System.out.println("**************Calling class AddKeywordsModel it's method validate***************");
        AddKeywords addkeyword = (AddKeywords) obj;

        ValidationUtils.rejectIfEmptyOrWhitespace(err, "tenderKeyWordsName", "required.name", "Please Enter Tender Keyword");

        if (addkeyword.getTender_category_id() == -1) {
            err.rejectValue("tender_category_id", "required.name", "Please Select Tender Category");
        }
        if (addkeyword.getAreaofwork_id() == -1) {
            err.rejectValue("areaofwork_id", "required.name", "Please Select Area Of Work");
        }

    }
}
