package com.eproc.controller;

import com.eproc.dao.AddKeywordDAO;
import com.eproc.dao.AreaOfWorkDAO;
import com.eproc.dao.CategoryDAO;
import com.eproc.domain.AddKeywords;
import com.eproc.domain.AreaOfWork;
import com.eproc.domain.TenderCategory;
import com.eproc.model.AreaOfWorkModel;
import com.eproc.model.KeywordModel;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Naina Jain
 */
@Controller
public class TenderCategoryAreaofworkkeywords {

    Map<Integer, String> AreaOfWork = new HashMap<Integer, String>();

    @Autowired
    SessionFactory sessionFactory;

    @Autowired
    AreaOfWorkDAO areaofworkDAO;

    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    AddKeywordDAO keywordDAO;

    @InitBinder("addareaofwork")
    protected void initAreaOfWorkBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        binder.setValidator(new AreaOfWorkModel());
    }
    
    @InitBinder("addkeywords")
    protected void initAddKeywordsBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        binder.setValidator(new KeywordModel());
    }

    @RequestMapping("/tender_areaofwork_keyword")
    public String tender_areaofwork_keyword(@ModelAttribute("addareaofwork") AreaOfWork addareaofwork, @ModelAttribute("addkeywords") AddKeywords addkeywords, Model m) {
        m.addAttribute(addareaofwork);
        m.addAttribute(addkeywords);
        List<TenderCategory> categoryList = categoryDAO.fetchAll();
        m.addAttribute("categoryList", categoryList);
        List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
        m.addAttribute("areaofworkList", areaofworkList);
        return "DepartmentAdmin/TenderAreaOfWorkKeyWords";
    }

    @RequestMapping("/fetchTenderCategory")
    @ResponseBody
    public List<TenderCategory> fetchTenderCategory(Model m) {
        List<TenderCategory> categoryList = categoryDAO.fetchAll();
        m.addAttribute("categoryList", categoryList);
        return categoryList;
    }

    @RequestMapping("/fetchAreaOfWork")
    @ResponseBody
    public List<AreaOfWork> fetchAreaOfWork(Model m, @RequestParam int tender_category_id) {
        System.out.println("Tender Id ::::@@@@" + tender_category_id);
        List<AreaOfWork> areaworkList = new ArrayList();
        List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
        Iterator<AreaOfWork> iterator = areaofworkList.iterator();
        while (iterator.hasNext()) {
            AreaOfWork areaOfWork = iterator.next();
            if (tender_category_id == areaOfWork.getTender_category_id()) {
                areaworkList.add(areaOfWork);
            }
        }
        return areaworkList;
    }

    @RequestMapping("/fetchKeyword")
    @ResponseBody
    public List<AddKeywords> fetchKeyword(Model m, @RequestParam int areaofwork_id) {
        System.out.println("Tender Id ::::@@@@" + areaofwork_id);
        List<AddKeywords> keywordList = new ArrayList();
        List<AddKeywords> addKeywordList = keywordDAO.fetchAll();
        Iterator<AddKeywords> iterator = addKeywordList.iterator();
        while (iterator.hasNext()) {
            AddKeywords addKeyword = iterator.next();
            if (areaofwork_id == addKeyword.getAreaofwork_id()) {
                keywordList.add(addKeyword);
            }
        }
        return keywordList;
    }

    //*************saveAreaOfWork**************//
    @RequestMapping("/save_AreaOfWork")
    public String save_AreaOfWork(@ModelAttribute("addareaofwork") @Validated AreaOfWork addareaofwork, BindingResult result, @ModelAttribute("addkeywords") AddKeywords addkeywords,
            Model m, @RequestParam int tender_category_id) {
        System.out.println("****************saveAreaOfWork method run****************" +addareaofwork.getAreaofwork_name());

        Date date = new Date();
        addareaofwork.setDate(date);
        try {
            if (result.hasErrors() && addareaofwork.getAreaofwork_name().equalsIgnoreCase("")) {
                System.out.println("result.haserrors");
                List<TenderCategory> categoryList = categoryDAO.fetchAll();
                m.addAttribute("categoryList", categoryList);
                List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
                m.addAttribute("areaofworkList", areaofworkList);
                return "DepartmentAdmin/TenderAreaOfWorkKeyWords";
            }
            String msg = areaofworkDAO.getDuplicateAreaOfWork(addareaofwork);//calling getDuplicateCategory method
            if (msg.equalsIgnoreCase("Area Of Work already Exist")) {
                m.addAttribute("msg2", msg);
                List<TenderCategory> categoryList = categoryDAO.fetchAll();
                m.addAttribute("categoryList", categoryList);
                List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
                m.addAttribute("areaofworkList", areaofworkList);
                return "DepartmentAdmin/TenderAreaOfWorkKeyWords";
            }
            if (!msg.equalsIgnoreCase("Area Of Work already Exist")) {
                List<TenderCategory> categoryList = categoryDAO.fetchAll();
                Iterator<TenderCategory> iterator = categoryList.iterator();
                while (iterator.hasNext()) {
                    TenderCategory tendercategory = iterator.next();
                    if (tender_category_id == tendercategory.getTender_category_id()) {
                        addareaofwork.setTender_category_name(tendercategory.getTender_category_name());
                    }
                }
                areaofworkDAO.insertData(addareaofwork); //FOR Save AreaOFWork  
                m.addAttribute("msg", "Area of work added successfully");
                categoryList = categoryDAO.fetchAll();
                m.addAttribute("categoryList", categoryList);
                List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
                m.addAttribute("areaofworkList", areaofworkList);
                return "DepartmentAdmin/TenderAreaOfWorkKeyWords";
            }
        } catch (Exception ex) {
            System.out.println("Class:TenderCategory_Areaofwork_keywordsController\n Method:saveAreaOfWork");
            System.out.println("Exception in TenderCategory_Areaofwork_keywordsController " + ex.getMessage());
        }
        return "DepartmentAdmin/TenderAreaOfWorkKeyWords";
    }

    //*************editAreaOfWork/UpdateAreaOfWork**************//
    @RequestMapping("/edit_AreaOfWork")
    @ResponseBody
    public String edit_AreaOfWork(@RequestParam int id, Model m, @ModelAttribute("addareaofwork") AreaOfWork addareaofwork) {
        System.out.println("**************editKeyword method run**************" + id);
        addareaofwork = (AreaOfWork) areaofworkDAO.fetchData(id);
        m.addAttribute("addareaofwork", addareaofwork);
        System.out.println("*******************END****************************************");
        Gson gson = new Gson();
        return gson.toJson(addareaofwork);
    }

    //*************saveKeywords**************//
    @RequestMapping("/save_Keywords")
    public String save_Keywords(Locale locale, @ModelAttribute("addkeywords") @Validated AddKeywords addkeywords,BindingResult result, @ModelAttribute("addareaofwork") AreaOfWork addareaofwork,
             Model m, @RequestParam int tender_category_id, @RequestParam int areaofwork_id) {
        System.out.println("**************saveKeywords method run**************");
        Date date = new Date();
        addkeywords.setDate(date);
        try {
            if (result.hasErrors() && addkeywords.getTenderKeyWordsName().equalsIgnoreCase("")) {
                List<TenderCategory> categoryList = categoryDAO.fetchAll();
                m.addAttribute("categoryList", categoryList);
                List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
                m.addAttribute("areaofworkList", areaofworkList);
                List<AddKeywords> addKeywordList = keywordDAO.fetchAll();
                m.addAttribute("addKeywordList", addKeywordList);
                return "TenderAreaOfWorkKeyWords";
            }
            List<TenderCategory> categoryList = categoryDAO.fetchAll();
              String msg = keywordDAO.getDuplicateAddKeyword(addkeywords);//calling getDuplicateCategory method
            if (msg.equalsIgnoreCase("Keyword already Exist")) {
                m.addAttribute("msg2", msg);
               categoryList = categoryDAO.fetchAll();
                m.addAttribute("categoryList", categoryList);
                List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
                m.addAttribute("areaofworkList", areaofworkList);
                  List<AddKeywords> addKeywordList = keywordDAO.fetchAll();
                m.addAttribute("addKeywordList", addKeywordList);
                return "TenderAreaOfWorkKeyWords";
            }           
            if (!msg.equalsIgnoreCase("Keyword already Exist")) {
                Iterator<TenderCategory> iterator = categoryList.iterator();
                while (iterator.hasNext()) {
                    TenderCategory tendercategory = iterator.next();
                    if (tender_category_id == tendercategory.getTender_category_id()) {
                        addkeywords.setTender_category_name(tendercategory.getTender_category_name());
                    }
                }
                List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAll();
                Iterator<AreaOfWork> iterator1 = areaofworkList.iterator();
                while (iterator1.hasNext()) {
                    AreaOfWork areaofwork = iterator1.next();
                    if (areaofwork_id == areaofwork.getAreaofwork_id()) {
                        System.out.println("%%%%%%%%%%%%%%%%%%" + areaofwork.getAreaofwork_name());
                        addkeywords.setAreaofwork_name(areaofwork.getAreaofwork_name());
                    }
                }
                keywordDAO.insertData(addkeywords); //FOR SAVE Keywords  
                m.addAttribute("msg", "Keyword Added Successfully");
                categoryList = categoryDAO.fetchAll();
                m.addAttribute("categoryList", categoryList);
                areaofworkList = areaofworkDAO.fetchAll();
                m.addAttribute("areaofworkList", areaofworkList);
                List<AddKeywords> addKeywordList = keywordDAO.fetchAll();
                m.addAttribute("addKeywordList", addKeywordList);
                return "TenderAreaOfWorkKeyWords";
            }
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:saveKeywords");
        }
        return "TenderAreaOfWorkKeyWords";
    }

    //*************editKeyword/UpdateKeyword**************//
    @RequestMapping("/edit_Keyword")
    @ResponseBody
    public String edit_Keyword(@RequestParam int id, Model m) {
        System.out.println("**************editKeyword method run**************");
        try {
            AddKeywords addkeywords = (AddKeywords) keywordDAO.fetchData(id);
            m.addAttribute("addkeywords", addkeywords);
            Gson gson = new Gson();
            return gson.toJson(addkeywords);
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
        }
        System.out.println("*******************END****************************************");
        return null;
    }

    //*************AreaOfWorkByCatIdByAjax**************//    
    @RequestMapping("/getTenderAreaWorkByCatId")
    @ResponseBody //to convert JSON Data into String Format taking as response from controller to jsp
    public String getTenderAreaWorkByCatId(@RequestParam Integer tender_category_id) {
        System.out.println("################## Inside getTenderAreaWorkByCatId ##################  " + tender_category_id);
       try{
        List<AreaOfWork> areaofworkList = new ArrayList<AreaOfWork>();
        Session s = sessionFactory.openSession();
        Query query = s.createQuery("from AreaOfWork where tender_category_id =:tender_category_id");
        query.setParameter("tender_category_id", tender_category_id);
        areaofworkList = query.list();
        System.out.println();
        for (AreaOfWork t : areaofworkList) {
            if (tender_category_id == t.getTender_category_id()) {
                AreaOfWork.put(t.getAreaofwork_id(), t.getAreaofwork_name());
            }
            System.out.println(t.getTender_category_id());
        }
        Gson gson = new Gson();
            return gson.toJson(areaofworkList);        
       }catch(Exception ex){
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:getTenderAreaWorkByCatId");
       }
        return null;
    }

}
