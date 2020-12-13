/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.google.gson.Gson;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Gaurav Dubey
 */
@Controller
public class MainController {
    
    
   @RequestMapping("/")
   public String departmentAdmin(Model m){
       System.out.println("The User Login to Department Admin");
        m.addAttribute("contractor", new Contractor());
        m.addAttribute("commonlogin", new Contractor());
       return "LotusHomePage";
   }
   @RequestMapping("/ChangePassword")
   public String changepassword(Model m)
   {
   m.addAttribute("contractor", new Contractor());
   return "ChangePassword";
   } 
//   //Shashank Shukla
//    @RequestMapping("/fetchTable")
//    @ResponseBody
//    public String fetch() throws Exception {
//        String str = "Live";
//        System.out.println("%%%%%%%%% Controller called");
//        List<Tender> statusList = tenderDAOImpl.fetchLiveTender(str);
//        Gson gson = new Gson();
//        return gson.toJson(statusList);
//
//    }
//
//    //Shashank Shukla
//    @RequestMapping("/searchData")
//    @ResponseBody
//    public String searchBarFetch(@RequestParam String nitNumber) throws Exception {
//        System.out.println("%%%%%%%%% Controller SearchBar called" + nitNumber);
//        List<Tender> statuslist = tenderDAOImpl.fetchSearchBar(nitNumber);
//        Gson gson = new Gson();
//        return gson.toJson(statuslist);
// }
//    
//     @RequestMapping("tenderdetailsfirst")
//    public String tenderDetailsFetch(@RequestParam int tender_Id, Model m)throws Exception{
//        System.out.println("@@@@@@@@@@@ Controller Called by tenderDetails Page"+tender_Id);
//        Tender tender11 = tenderDAOImpl.fetchTender(tender_Id);
//        m.addAttribute("tender11", tender11);
//       return "tenderDetails";
//     } 
//    
//  @RequestMapping("MainHomePage")
//    public String returnMainPage(Model m) {
//    m.addAttribute("commonlogin", new Department());
//       m.addAttribute("deptAdminLogin", new DepartmentAdmin());
//       return "index";
//}
}