/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;


import com.eproc.dao.CitiesDao;
import com.eproc.dao.ContractorDao;
import com.eproc.dao.ContractorDetailsDao;
import com.eproc.dao.ContractorDetailsDocsDao;
import com.eproc.dao.StatesDao;
import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.DepartmentDaoImpl;
import com.eproc.domain.Cities;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.ContractorOtherDetailsDocs;
import com.eproc.domain.States;
import com.eproc.model.ContractorDetailsModel;
import com.eproc.model.ContractorModel;
import com.eproc.util.AesEncrDec;
import com.eproc.util.FileUtility;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Palak Tiwari
 * ContractorDetailsController class
 */
@Controller
public class ContractorDetailsController {
//
    @Autowired
    ContractorDetailsDao contractordetailsdao;
    @Autowired
    ContractorDetailsdaoImpl contractor_detailsdaoImpl;
    @Autowired
    ContractorDetailsDocsDao contractordetailsdocsdao;
    @Autowired
    StatesDao statesdao;
    @Autowired
    CitiesDao citiesdao; 
    @Autowired
    GsonUtility gsonUtility;  
    @Autowired
    ContractorDao  contractordao;
     @Autowired
    DepartmentDaoImpl departmentDaoImpl;
    @Autowired
    AesEncrDec aesEncrDec;
      
 
    
    ContractorDetailsModel contractordetailsvalidator;
    private static final String UPLOAD_DIRECTORY = "/resources/docs";

      
    

    //------------------------------------
   /**
    * initBinder method
    * @param binder 
    */    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        System.out.println("-----------Call initBinder Method Run-----------------");
        binder.addValidators(contractordetailsvalidator);
      //  binder.setValidator(new ContractorModel());
        System.out.println("-----------Call initBinder Method Closed-------------");
    }
    @RequestMapping("/uploadFile")
    @ResponseBody
    public String uploadFile(@RequestParam String id, String fileId,  String property,RedirectAttributes ra, @RequestParam int num,  CommonsMultipartFile file, HttpServletRequest request, HttpSession session, @ModelAttribute ContractorOtherDetailsDocs contractorDetailsDocs, Model m) throws IOException {
        System.out.println("----------uploadFile method is run------------------------------");
        System.out.println("Property value: " + property);
        System.out.println("value is:" + num);
        System.out.println("cont id is:" + id);
        String doc = null;
        int x = Integer.parseInt(session.getAttribute("id").toString());
        System.out.println("My uploading id" + session.getAttribute("id"));
        contractorDetailsDocs.setContOtherId(x);
        System.out.println("file id is:" + fileId);
        System.out.println("Multipart File is : " + file.toString());
        int THRESHOLD_SIZE = 1000000;
        try {     
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(THRESHOLD_SIZE);
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
            ServletFileUpload upload = new ServletFileUpload(factory);
            String path = request.getContextPath();
            System.out.println("context path is:" + path);
            System.out.println("upload path");
            String uploadPath = request.getRealPath(UPLOAD_DIRECTORY);
            System.out.println(uploadPath);
            String fileName = file.getOriginalFilename();
            System.out.println("file original name" + fileName);
            String fileConvertedName = FileUtility.removeExtension(fileName) + FileUtility.generateRandomNoMili()+ fileName.substring(fileName.lastIndexOf("."));
            byte[] bytes = file.getBytes();
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(uploadPath + File.separator + fileConvertedName)));
            stream.write(bytes);
            stream.flush();
            System.out.println("stream is  closed");
            stream.close();
            
            if (fileId != null && !fileId.equalsIgnoreCase("")) {
                Integer fileid = Integer.parseInt(fileId.trim());
            //    ContractorOtherDetailsDocs contractorDocs = (ContractorOtherDetailsDocs) contractordetailsdocsdao.fetchData(fileid);
             //   doc = contractorDocs.getDocConvertedName();
                System.out.println("doc is: " + doc);
                System.out.println("----delete method is call----");
                contractordetailsdocsdao.deletedoc(x, doc, fileid);
                contractordetailsdocsdao.updatedoc(x, fileName, fileConvertedName, fileid);
            }
            
            contractorDetailsDocs.setDocName(fileName);
            contractorDetailsDocs.setDocConvertedName(fileConvertedName);
            contractorDetailsDocs.setDocPath(uploadPath);
            contractorDetailsDocs.setDocUrl(path);
            contractorDetailsDocs.setDocpropertyName(property);
            System.out.println("Insert data method is calling");
            contractordetailsdocsdao.insertData(contractorDetailsDocs);
          //   m.addAttribute("contractorDetailsDocs", new ContractorOtherDetailsDocs());
            int fileIds=contractorDetailsDocs.getFileId();
            System.out.println("file ids:"+fileIds);
            ContractorOtherDetailsDocs contractorOtherDetailsDocs=(ContractorOtherDetailsDocs) contractordetailsdocsdao.fetchData(fileIds);
            m.addAttribute("contractorOtherDetailsDocs", contractorOtherDetailsDocs);
            System.out.println("filecconverted name:"+contractorOtherDetailsDocs.getDocConvertedName());
          
            Gson gson = new Gson();
            String response = gson.toJson(contractorDetailsDocs);
            gsonUtility.writeData(response);
            System.out.println("----------uploadFile method is closed---------------");
            
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:uploadFile");
        }
        return null;
    }

   //------------------------------------

     @RequestMapping(value = "/saveContractordetails", method = RequestMethod.POST)
     @ResponseBody
    public String saveContractorDetails(@ModelAttribute("Contractordetails") ContractorDetails contractorDetails, HttpSession session, @RequestParam  int contOtherId,int regid,Model m) throws Exception {
         System.out.println("Contractor registration is"+regid);
        System.out.println("saveContractorDetails : " + contractorDetails.getContOtherId() + " contOtherId : " + contOtherId);
        try{
        Date date = new Date();

        contractorDetails.setUpdatedOn(date);
        contractorDetails.setContBankBranch("Union");
        contractorDetails.setFeeStatus("process");
        contractorDetails.setContCompanyName("Osmo");
        contractorDetails.setRegId(regid);
      //  contractorDetails.setStatus("disable");
        
       
        contractordetailsdao.insertData(contractorDetails);
        int id = contractorDetails.getContOtherId();
        System.out.println("reg id "+contractorDetails.getRegId());
        
//       ContractorDetails contractordetails= (ContractorDetails) contractordetailsdao.fetchData(id);
//        System.out.println("fetchdata"+contractordetails.getContOtherId());
//        m.addAttribute("Contractordetails",contractordetails);
       // List<States> stateList = statesdao.fetchAll();
//        m.addAttribute("stateList", stateList);
        System.out.println("Id: " + id);
        session.setAttribute("id", id);
        Gson gson = new Gson();
        String response = gson.toJson(id);
        gsonUtility.writeData(response);
        }catch(Exception ex){
        ex.printStackTrace();
        System.out.println("Class:ContractorDetailsController and Method:saveContractorDetails ");
        }
      return null;
     }
    
//------------------------------------------------------------------------------    
   @RequestMapping("/fetchData")
   @ResponseBody
   public String contractordetailsFetch(@RequestParam int contOtherId){
       System.out.println("contractor detail id is:"+contOtherId);
       try{
       ContractorDetails contractordetails= (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
       System.out.println("fetchdata:"+contractordetails.getContOtherId());
       System.out.println("address"+contractordetails.getAddress());
        Gson gson = new Gson();
        String response = gson.toJson(contractordetails);
        gsonUtility.writeData(response);
       }catch(Exception ex){
        ex.printStackTrace();
        System.out.println("Class:ContractorDetailsController and Method:contractordetailsFetch ");
        }
       return null;
   }
//------------------------------------------------------------------------------------
 /*  Contractor Registration
 *  @author Yashovardhan Singh 
 *  Since 01-07-2018
 *  @Version 2.0.0
 */
//------------------------------------------------------------------------------------   
   
   
    /*
     *Contractor Registration
     *Method for go to Contractor HomePage
     */
    @RequestMapping("/contractor")
    public String contractorHome(Model m) {
        m.addAttribute("contractor", new Contractor());
        return "Contractor";
    }
//------------------------------------------------------------------------------
    /*
     *Contractor Regitration
     *Method used to saved contactor details
     *@Save Contactor details
     */
    @RequestMapping("/Contractorsave")
    public String contractorSave(@ModelAttribute("contractor") @Validated Contractor contractor, BindingResult result, Model m,HttpSession session) {
        System.out.println("Server Side vaLoidation is called");
        try {
            boolean status = false;
            if (result.hasErrors()) {
                m.addAttribute("msg", "Not Saved Sucessfully");
                System.out.println("Data is not save, because some field are empty");
                return "LotusHomePage";
            }
            String firstname = contractor.getFirstname().trim();
            System.out.println("firstname:"+firstname);
            contractor.setFirstname(firstname);
            String middlename = contractor.getMiddlename().trim();
            contractor.setMiddlename(middlename);
            String lastname = contractor.getLastname().trim();
            contractor.setLastname(lastname);
            String company = contractor.getCompany().trim();
            contractor.setCompany(company);
            String designation = contractor.getDesignation().trim();
            contractor.setDesignation(designation);
            String moblie = contractor.getMobileno().trim();
            contractor.setMobileno(moblie);
            String emailid = contractor.getEmailid().trim();
            contractor.setEmailid(emailid);
            String password = contractor.getPassword().trim();
            contractor.setPassword(password);
            String fullname = "" + contractor.getFirstname() + " " + contractor.getMiddlename() + " " + contractor.getLastname();
            System.out.println("fullname is:"+fullname);
            contractor.setFullname(fullname);
            Date date = new Date();
            contractor.setDate(date);
            System.out.println("Password Encryption Method is Called..");
            String pass=aesEncrDec.encrypt(contractor.getPassword());
            contractor.setPassword(pass);
            System.out.println("Password is Encrypted Sucessfully");
            status = contractordao.insertData(contractor);
//            int reg_id= contractor.getId();
//            session.setAttribute("reg_id", reg_id);
            
            System.out.println("Status  : " + status);
            Common_Logon_Status commonlogin = new Common_Logon_Status();
             commonlogin.setEmailid(contractor.getEmailid());
             commonlogin.setEnc_pwd(contractor.getPassword());
             commonlogin.setCurrent_Login(contractor.getDate());
             commonlogin.setMobileno(contractor.getMobileno());
             commonlogin.setRole("Contractor");
             departmentDaoImpl.saveStatus(commonlogin);
             m.addAttribute("commonlogin", new Contractor());
         
           if (!status) {
                gsonUtility.writeData("Data Not Saved Sucessfully");
            } else {
                gsonUtility.writeData("Data Saved Sucessfully");
            }
        } catch (Exception e) {
           System.out.println("Exception:" + e.getMessage());
            System.out.println("ContractorController\nMethod:contractorSave");
        }
        return null;
    }

//------------------------------CheckDuplicaeteEmailId--------------------------
    /*
     *CheckDuplicaeteEmailId
     *Method used to check exist email id
     *@duplicate Emailid
     */
    @RequestMapping("/CheckEmail")
    @ResponseBody
    public String checkEmail(@RequestParam String email, @ModelAttribute Contractor contractor) {
        String msg = "valid EmailId";
        List<Contractor> contractorList = contractordao.fetchAll();
        System.out.println("........CheckEmailId" + email);
        Iterator<Contractor> iterator = contractorList.listIterator();
        while (iterator.hasNext()) {
            Contractor dept = iterator.next();
            System.out.println("Contractor from list is: " + "    " + dept.getEmailid());
            if (email.equalsIgnoreCase(dept.getEmailid())) {
                msg = "Email Id is exist";
                System.out.println("duplicate EmailId.........." + " " + email);
                return msg;
            }
        }
        return msg;
    }

//-------------------------CheckDuplicateNumber---------------------------------  
    /*
     *CheckDuplicateNumber
     *Method used to check duplicate Mobile Number
     *@duplicate Mobile Number
     */
    @RequestMapping("/checkUserContact")
    @ResponseBody
    public String checkContact(@RequestParam String mobile, @ModelAttribute Contractor contractor) {
        String msg = "valid mobile_no";
        List<Contractor> contractorList = contractordao.fetchAll();
        System.out.println(".....................checkusercontact" + mobile);
        Iterator<Contractor> iterator = (Iterator<Contractor>) contractorList.listIterator();
        while (iterator.hasNext()) {
            Contractor cont = iterator.next();
            System.out.println("mobile_no................mobile_no from list is: " + cont.getMobileno());
            if (mobile.equalsIgnoreCase(cont.getMobileno())) {
                msg = "Mobile Number is already exist";
                System.out.println("duplicate mobile Number.." + " " + mobile);
                return msg;
            }
        }
       return msg;
    }

//------------------------------------------------------------------------------
    /*
     *Update contractor
     *Method used to update contractor home page
     *@duplicate contractor home page
     */
@RequestMapping("/updatecontractor")
    String updateContracor(Model m) {
        try {
            System.out.println("Manage Desigantion Here");
            m.addAttribute("contractor", new Contractor());
            List<Contractor> contractorList = contractordao.fetchAll();
            m.addAttribute("contractorList", contractorList);
        } catch (Exception e) {
            System.out.println("Exception:" + e.getMessage());
            System.out.println("ContractorController\nMethod:updateContracor");
        }
        return "UpdateContractor";
    }
//------------------------------------------------------------------------------
    /*
     *Fetch contractor by Id
     *Method used to Edit contractor home page
     *@Fetch contractor by Id
     */
    @RequestMapping("/editContractor")
    public String editProductCategory(@RequestParam Integer id, Model m) {
        System.out.println("-------Method called to edit Product category-----------");
        try {
            Contractor contractor = (Contractor) contractordao.fetchData(id);
            m.addAttribute("contractor", contractor);
            contractordao.insertData(contractor);
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("ContractorController\nMethod:editContractor");
        }
   System.out.println("---------------------------Method End to edit Product Category-----------------------------------");
   return "updateCont";
    }
 }  
