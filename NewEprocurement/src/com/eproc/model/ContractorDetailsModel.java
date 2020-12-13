
package com.eproc.model;
import com.eproc.domain.ContractorDetails;
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import org.springframework.stereotype.Component;

@Component
public class ContractorDetailsModel  implements Validator{

    @Override
    public boolean supports(Class<?> ContractorDetails) {
    return ContractorDetails.class.equals(ContractorDetails);
        
      
    }

    @Override
    public void validate(Object obj, Errors err) {
      System.out.println("Calling class  Contractor details Model and its method validate");
      ContractorDetails contractordetails=(ContractorDetails) obj;
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contRegistrationNo","required.name", "Please Enter Company Registration Number");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contCompanyEstablishmentYear","required.name", "Please Enter Company Establishment Year");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contCompanyContactNo","required.name", "Please Enter Company Contact Number");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contCompanyEmail","required.name", "Please Enter Company Email Id");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contCompanyWebsite","required.name", "Please  Enter Company Website");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contCompanyAddressNo","required.name", "Please Enter Company Address");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contCompanyPanCardNo","required.name", "Please Enter Company PAN Number");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contAddressNo","required.name", "Please Enter Applicant Address");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contPanCardNo","required.name", "Please Enter Applicant PAN Number");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contBankAccountNo","required.name", "Please Enter Bank Account Number");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contBankName","required.name", "Please Enter Bank Name");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contBankAddress","required.name", "Please Enter Branch Address");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contBeneficiaryAccountNo","required.name", "Please Enter Beneficiary Account Number");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contBankCode","required.name", "Please Enter IFSC Code");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "address","required.name", "Please Enter Address");    
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "state","required.name", "Please Enter State");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "district","required.name", "Please Enter District");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "place","required.name", "Please Enter Place");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "pincode","required.name", "Please Enter Pincode");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "contractor","required.name", "Please Enter Contractor");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "firstName","required.name", "Please Enter FirstName");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "middleName","required.name", "Please Enter MiddleName");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "lastName","required.name", "Please Enter LastName");  
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "clientState","required.name", "Please Enter ClientState"); 
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "clientCity","required.name", "Please Enter ClientCity"); 
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "clientContact","required.name", "Please Enter ClientContact"); 
     
  
    } 
    
}
