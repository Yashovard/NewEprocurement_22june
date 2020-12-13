/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.CitiesDao;
import com.eproc.dao.StatesDao;
import com.eproc.domain.Cities;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.States;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderKeyDates;
import com.eproc.util.CommonUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Naina Jain
 */
@Controller
public class ForgotPasswordController {

    private String generatedotp;
    
    @Autowired
    CommonUtil commonUtil;
      @Autowired
    StatesDao statesdao;
    @Autowired
    CitiesDao citiesdao; 

    @RequestMapping("/forgotPassword")
    public String forgotPassword(@ModelAttribute Common_Logon_Status forgotEmail,Model m) {
      m.addAttribute("forgotEmail", new Common_Logon_Status());
        return "forgotPwd";
    }

    @RequestMapping("/registeredEmail")
    public String registeredEmail(@RequestParam String emailid,HttpServletRequest request,Model m) {
        System.out.println("");
        String userExists = commonUtil.checkLogin(emailid);
        System.out.println("$$$$$$"+userExists);
         if (userExists == "DepartmentUser") {         
         } else if (userExists == "Contractor"){         
         }
         generatedotp = CommonUtil.generatePassword();
         HttpSession hsession = request.getSession(true);
         hsession.setAttribute("OTP", generatedotp);
         System.out.println("OTP : " + generatedotp);
         m.addAttribute("generatedotp", generatedotp);
        return "OTPVerification";
    }
    
    @RequestMapping("/verifyOTPDeptAdmin")
     public String verifyOTPDeptAdmin(@RequestParam String verifyingotp,@RequestParam String generatedotp) {
        System.out.println("#########"+generatedotp);
        System.out.println("~~~~~~~~~"+verifyingotp);
         try {
          if(verifyingotp.equals(generatedotp)){
          return "redirect:/dashboard";
          }else{
          return "OTPNotVerified";
          }     
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }
    @RequestMapping("/verifyOTPDeptUser")
     public String verifyOTPDeptUser(@RequestParam String verifyingotp,@RequestParam String generatedotp) {
        System.out.println("######### verifyOTPDeptUser"+generatedotp);
        System.out.println("~~~~~~~~~ verifyOTPDeptUser"+verifyingotp);
         try {
          if(verifyingotp.equals(generatedotp)){
          return "redirect:/tenderProcess";
          }else{
          return "";
          }     
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }
    @RequestMapping("/verifyOTPContractor")
     public String verifyOTPContractor(@ModelAttribute Tender tenderContractor,Model m,@ModelAttribute TenderKeyDates keyDates,@RequestParam String verifyingotp,@RequestParam String generatedotp,int regid, String contId,RedirectAttributes ra,HttpSession session) {
        System.out.println("######### verifyOTPContractor" + generatedotp);
        System.out.println("@@@@@@ contractor registration Id is:"+regid);
        System.out.println("@@@Contractor other details id is:"+contId);
        System.out.println("~~~~~~~~~ verifyOTPContractor" + verifyingotp);
        try {
            if (verifyingotp.equals(generatedotp)) {
                
                System.out.println("otp is matched");
                m.addAttribute("Contractordetails", new ContractorDetails());
                List<States> stateList = statesdao.fetchAll();
                List<Cities> citiesList = citiesdao.fetchAll();
                System.out.println("------contractordetails method is run------------- ");
                m.addAttribute("stateList", stateList);
                m.addAttribute("citiesList", citiesList);
                m.addAttribute("regid", regid);
               if (contId != null && !contId.equalsIgnoreCase("")){
                Integer contid=Integer.parseInt(contId);
                m.addAttribute("contOtherId", contid);
               }
            
          
                return "Contractor/contractorotherdetail";
            } else {
                return "";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
