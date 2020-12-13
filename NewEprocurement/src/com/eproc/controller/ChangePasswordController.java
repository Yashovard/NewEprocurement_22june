package com.eproc.controller;




import com.eproc.dao.ContractorDao;
import com.eproc.domain.Contractor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Yashovardhan Singh
 */
@Controller
public class ChangePasswordController {
    
      @Autowired
      ContractorDao contractordao;
    @RequestMapping("/PassChange")
    public String ChangePassword(@ModelAttribute("contractor") Contractor contractor){
        System.out.println(contractor.getPassword());
        System.out.println(contractor.getCurrentPassword());
        System.out.println(contractor.getNewPassword());
        boolean usertrue=contractordao.passwordcheck("password", "newPassword", "currentPassword");
        if(usertrue){
        return "passwordchange";
        }else{
            return "ChangePassword";
    }
    }
}