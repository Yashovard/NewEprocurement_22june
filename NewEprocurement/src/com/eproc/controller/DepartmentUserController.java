/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.DepartmentDaoImpl;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.DepartmentUser;
import com.eproc.model.DepartmentModel;
import com.eproc.util.AesEncrDec;
import com.eproc.util.CommonUtil;
import java.awt.BorderLayout;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Naina Jain
 */
@Controller
public class DepartmentUserController {

    private String generatedotp;

    @Autowired
    DepartmentDaoImpl departmentDaoImpl;
    DepartmentModel departmentModel;
    @Autowired
    AesEncrDec aesEncrDec;
     @Autowired
    ContractorDetailsdaoImpl contractor_detailsdaoImpl;

  //  CommonUtil commonUtil = new CommonUtil();

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        binder.addValidators(departmentModel);
    }

    @RequestMapping("/manageDepartmentUser")
    public String manageDepartmentUser(@ModelAttribute("departmentUser") DepartmentUser departmentUser, Model m) {
        System.out.println("**************manageDepartmentUser method run**************");
        m.addAttribute(departmentUser);
        System.out.println("*******************END****************************************");
        return "ManageDepartmentUser";
    }

//**************************DEPARTMENT START***************************************************************//
//*************************Naina Jain's Code Start*************************//
    @RequestMapping("/login")
    public String login(@ModelAttribute("commonlogin") Contractor contractor, Model m, @RequestParam String emailid,
            @RequestParam String password, HttpServletRequest request, RedirectAttributes ra, HttpSession session ) {
        System.out.println("**************dept User login method run**************");
        Common_Logon_Status commonlogin=new Common_Logon_Status();
        try {
            String validUser = emailid.trim();
            System.out.println("Valid user is:"+validUser);
            if (password.contains(" ")) {
                       String invalidUser = "Sorry..!!!Password does not contain spaces";
                       ra.addFlashAttribute("invalidUser", invalidUser);
                       return "redirect:/";
            }
            String pwd = aesEncrDec.encrypt(password) ;
            commonlogin.setEnc_pwd(pwd);
             String userExists = departmentDaoImpl.checkLogin(validUser);
             System.out.println("userexists is:"+userExists);

          
              if (userExists == "DepartmentUser") {
                List<Contractor> contractorList = departmentDaoImpl.fetchAllLogonStatus();
                Iterator<Contractor> iterator = contractorList.iterator();
                System.out.println("inside if condition");
                while (iterator.hasNext()) {
                Contractor dept = iterator.next();
               // aesEncrDec.decrypt(dept.getPassword(), null);
                System.out.println("inside while");
                System.out.println("enc password contractor is:"+dept.getPassword());
                 if (validUser.equalsIgnoreCase(dept.getEmailid()) ) {
//                       commonlogin.setLast_Login(dept.);
                        Date date = new Date();
                        System.out.println("date is:" + date);
                        commonlogin.setCurrent_Login(date);
                        commonlogin.setRole(userExists);
                        commonlogin.setMobileno(dept.getMobileno());
                        departmentDaoImpl.saveStatus(commonlogin);
                      }
                    
                 contractorList = departmentDaoImpl.fetchAllLogonStatus();
                 m.addAttribute("common_logonList", contractorList);
//                 String id=request.getParameter(emailid);
//                 int no=Integer.parseInt(id);
//                    System.out.println(no);
                }
                generatedotp = CommonUtil.generatePassword();
                HttpSession hsession = request.getSession(true);
                hsession.setAttribute("OTP", generatedotp);
                System.out.println("OTP : " + generatedotp);
                m.addAttribute("generatedotp", generatedotp);
                return "OTPVerificationDeptUser";
            } else if (userExists == "Contractor") {
                List<Contractor> contractorList = departmentDaoImpl.fetchAllLogonStatus();
                Iterator<Contractor> iterator = contractorList. iterator();
                System.out.println("inside if condition");
                while (iterator.hasNext()) {
                    System.out.println("inside while");
                    Contractor dept = iterator.next();
                    System.out.println("dept status is"+dept.getEmailid());
                    System.out.println("dept mobile number is:"+dept.getMobileno());
                    System.out.println("valid user is:"+validUser);
                    if (validUser.equalsIgnoreCase(dept.getEmailid())) {
                       //System.out.println("last login is:" + dept.getCurrent_Login());
                      // commonlogin.setLast_Login(dept.getCurrent_Login());
                       Date date = new Date();
                       int regid=dept.getId();
                       System.out.println("registration id"+regid);
                       System.out.println("set values for common_logon");
                       commonlogin.setCurrent_Login(date);
                       commonlogin.setRole(userExists);
                       commonlogin.setMobileno(dept.getMobileno());
                       System.out.println("save commonlogon status");
                      List<ContractorDetails> contractorDetailsList=contractor_detailsdaoImpl.fetchAll();
                      Iterator<ContractorDetails> contractorIterator = contractorDetailsList.iterator();
                      while (contractorIterator.hasNext()){
                      ContractorDetails cont= contractorIterator.next();
                      int contRegId=cont.getRegId();
                      System.out.println("contractor registration id is:"+contRegId);
                      if(regid==contRegId){
                      int contOtherId=cont.getContOtherId();
                      System.out.println("contractor other details id is:"+contOtherId);
                      m.addAttribute("contOtherId",contOtherId );
                         }
                      else{
                          System.out.println("id is not matched");
                      }
                          
                       }
                      departmentDaoImpl.saveStatus(commonlogin);
                       m.addAttribute("regid", regid);
                       
                     }
                     
                    System.out.println("id@@@@@@@@" + commonlogin.getId());
                    contractorList = departmentDaoImpl.fetchAllLogonStatus();
                    m.addAttribute("common_logonList", contractorList);
                }
                generatedotp = CommonUtil.generatePassword();
                HttpSession hsession = request.getSession(true);
                hsession.setAttribute("OTP", generatedotp);
                System.out.println("OTP : " + generatedotp);
                m.addAttribute("generatedotp", generatedotp);
               
                return "OTPVerificationContractor";
            }
            System.out.println("*******************END****************************************");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String invalidUser = "Sorry..!!!You have entered wrong ID and Password";
        ra.addFlashAttribute("invalidUser", invalidUser);
        return "redirect:/";
    }
//*************************Naina Jain's Code END*************************//

//**************************END OF DEPARTMENT***************************************************************//
//    @RequestMapping("/departmentDetails")
//    @ResponseBody
//    public String fetchDepartmentUserDetails(){
//        System.out.println("Fetching the details of Department User");
//        List<DepartmentUser>  departmentUsers = new ArrayList<>();
//        String response = null;
//        try{
//            departmentUsers = departmentDaoImpl.fetchAll();
//            System.out.println("The Department User list size: "+departmentUsers.size());
//            Gson gson = new Gson();          
//            response = gson.toJson(departmentUsers);
//            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
//            HttpServletResponse httpServletResponse = ((ServletRequestAttributes) requestAttributes).getResponse();
//            httpServletResponse.setContentType("text/html; charset=UTF-8");
//            httpServletResponse.setCharacterEncoding("UTF-8");
//            PrintWriter out = httpServletResponse.getWriter(); 
//            out.print(response);
//            out.flush();
//            out.close();  
//        }catch(Exception ex){
//         ex.printStackTrace();
//        }
//        return null;
//    }
//    
//    @RequestMapping("/updateDepartmentUser")
//    @ResponseBody
//    public String updateDepartmentUser(@RequestParam int id){
//        System.out.println("Update The Department User"+id);
//        DepartmentUser departmentUser = null;
//        String response = null;
//        try{
//          departmentUser = (DepartmentUser) departmentDaoImpl.fetchData(id);
//          System.out.println("The Department User: "+departmentUser);
//          Gson gson = new Gson();          
//          response = gson.toJson(departmentUser);
//          RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
//          HttpServletResponse httpServletResponse = ((ServletRequestAttributes) requestAttributes).getResponse();
//          httpServletResponse.setContentType("text/html; charset=UTF-8");
//          httpServletResponse.setCharacterEncoding("UTF-8");
//          PrintWriter out = httpServletResponse.getWriter(); 
//          out.print(response);
//          out.flush();
//          out.close();
//        }catch(Exception ex){
//            ex.printStackTrace();
//        }
//        return null;
//    } 
//    
//    @RequestMapping("/saveDepartmentUser")
//    @ResponseBody
//    public String saveDepartmentUser(@ModelAttribute DepartmentUser departmentUser){
//        System.out.println("The Department User is:"+departmentUser.getFirstName()+"Last Name: "+departmentUser.getLastName()
//        +"Mobile Number: "+departmentUser.getMobNo()+"Email Id: "+departmentUser.getEmailAdd()+"Date Of Birth: "
//         +departmentUser.getDob()+"Address: "+departmentUser.getAddress()+" Password: "+departmentUser.getPassword()
//        +"Pan Card Number: "+departmentUser.getPanCardNo()+" Pincode: "+departmentUser.getPincode());        
//        boolean result = false;
//        String message = null;
//        try{
//          result = departmentDaoImpl.insertData(departmentUser);
//          if(result == true){
//              System.out.println("The Department Registration Done Successfully");
//              message = "The Department Registration Done Successfully";
//          }else{
//              System.out.println("The Department Registration Not Successfull");
//              message = "The Department Registration Not Successfully";
//          }
//        }catch(Exception ex){
//            ex.printStackTrace();
//        }
//        return message;
//    }
}

//      String EmailId = departmentlogin.getEmailid();
//        String Dec_Pwd = departmentlogin.getDec_pwd();
//        boolean userExists = departmentDao.checkLogin(EmailId, Dec_Pwd);
//        if (userExists) {
//            List<Dept_Logon_Status> dept_logonList = departmentDao.fetchAll();
//            Iterator<Dept_Logon_Status> iterator = dept_logonList.iterator();
//            while (iterator.hasNext()) {
//                Dept_Logon_Status dept = iterator.next();
//                if (emailid.equalsIgnoreCase(dept.getEmailid())) {
//                    departmentlogin.setLast_Login(dept.getCurrent_Login());
//                    Date date = new Date();
//                    departmentlogin.setCurrent_Login(date);
//                }
//                departmentDao.saveStatus(departmentlogin);
//                dept_logonList = departmentDao.fetchAll();
//                m.addAttribute("dept_logonList", dept_logonList);
//            }
//            return "fetch_logon_status";
//        } else {
//            return "loginerror";
//        }