/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.ProductCategoryDaoImpl;
import com.eproc.daoImpl.ProductSubCategoryDaoImpl;
import com.eproc.domain.ProductCategory;
import com.eproc.domain.ProductSubCategory;
import com.eproc.model.ProductCategoryModel;
import com.eproc.model.ProductSubCategoryModel;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Mansi Jain
 */
@Controller
public class ProductCategorySubCategoryController {

    @Autowired
    ProductCategoryDaoImpl productCategoryDao;
    @Autowired
    ProductSubCategoryDaoImpl productSubCategoryDao;
    @Autowired
    SessionFactory sessionfactory;
    
       /*
     *  initBinder 
     * Method used to apply the server side validation 
     * @param binder
     * @return CircleDivisionSubDivision.jsp
     */
    @InitBinder("category")
    protected void initProductCategoryBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for ProductCategory");
        binder.setValidator(new ProductCategoryModel());
    }
    
    @InitBinder("productSubCategory")
    protected void initProductSubCategoryBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for productSubCategory");
        binder.setValidator(new ProductSubCategoryModel());
    }

    @RequestMapping("/manageProductCategorySubCategory")
    public String manageProductCategory(Model m, @ModelAttribute("category") ProductCategory productCategory, @ModelAttribute("productSubCategory") ProductSubCategory productSubCategory) {
        System.out.println("Manage Product Category here");
        m.addAttribute("category", new ProductCategory());
        m.addAttribute("productSubCategory", new ProductSubCategory());
        List<ProductCategory> productList = productCategoryDao.fetchAll();
        m.addAttribute("productList", productList);
        return "DepartmentAdmin/ProductCategorySubCategory";
    }

    /*
     * add ProductCategory 
     * Method used to add Product  Category 
     * @param modelAtribute Category
     * @return jsp page
     */
    @RequestMapping("/saveProductCategories")
    public String saveCategory(@ModelAttribute("category") @Validated ProductCategory productCategory, BindingResult result,@ModelAttribute("productSubCategory") ProductSubCategory productSubCategory,Model m, RedirectAttributes ra) {
        System.out.println("---------------------------Method called to save Product category-----------------------------------");
        String message = "";

        Date date = new Date();
        productCategory.setCreated_date(date);
        try {
            
              
            if (result.hasErrors()) {
                System.out.println("****************validate******************");
                return "ProductCategorySubCategory";
            }
            
            message = productCategoryDao.checkDuplicateValue(productCategory);

            if (!message.equalsIgnoreCase("Duplicate productCategory Name") && !message.equalsIgnoreCase("Enter productCategory Name")) {

                productCategoryDao.insertData(productCategory);
                ra.addFlashAttribute("msg", "Product Category Added Successfully");

            } else if (message.equals("Duplicate productCategory Name")) {
                ra.addFlashAttribute("msg2", "Product Category is Alredy Exists");
                return "redirect:/manageProductCategorySubCategory";

            } else if (message.equals("Enter productCategory Name")) {
                ra.addFlashAttribute("msg2", "Please Enter ProductCategory");
                return "redirect:/manageProductCategorySubCategory";
            }
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductCategoryController\nMethod:saveCategory");
        }
        System.out.println("---------------------------Method End to save Product category-----------------------------------");
        return "redirect:/manageProductCategorySubCategory";
    }

    /*
     * add ProductSubCategory 
     * Method used to add Product Sub Category 
     * @param modelAtribute productSubCategory
     * @return jsp page
     */
    @RequestMapping("/saveProductSubCategory")
    public String saveProductSubCategory(@ModelAttribute("productSubCategory") @Validated ProductSubCategory productSubCategory,BindingResult result, @ModelAttribute("category") ProductCategory productCategory,Model m, RedirectAttributes ra) {
        System.out.println("---------------------------Method called to save Product Subcategory-----------------------------------");
        System.out.println("subcateID::"+productSubCategory.getProductCategoryName());
        String message = "";
        try {
            
               
            if (result.hasErrors()) {
                System.out.println("****************validate******************");
                return "ProductCategorySubCategory";
            }
            
           productCategory = productCategoryDao.fetchData(productSubCategory.getProductCategoryId());
            productSubCategory.setProductCategoryName(productCategory.getProductCategoryName());

            Date date = new Date();
            productSubCategory.setCreated_Date(date);
            message = productSubCategoryDao.checkDuplicateValue(productSubCategory);

            if (!message.equalsIgnoreCase("Duplicate productSubCategory") && !message.equalsIgnoreCase("Enter ProductSubCategory")) {

                productSubCategoryDao.insertData(productSubCategory);
                ra.addFlashAttribute("msg", "Product Sub-Category Added Successfully");
                return "redirect:/manageProductCategorySubCategory";

            } else if (message.equals("Duplicate productSubCategory")) {
                ra.addFlashAttribute("msg2", "Product Sub-Category is Alredy Exists");
                return "redirect:/manageProductCategorySubCategory";

            } else if (message.equals("Enter productSubCategory")) {
                ra.addFlashAttribute("msg2", "Please Enter ProductSubCategory");
                return "redirect:/manageProductCategorySubCategory";
            }
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductSubCategoryController \n Method:saveProductSubCategory");

        }
        System.out.println("---------------------------Method end to save Product Sub category-----------------------------------");
        return "redirect:/manageProductCategorySubCategory";
    }

    /*
     * fetch ProductCategory by Ajax
     * Method used to fetchProduct Category 
     * @param modelAtribute productList
     * @return jsp page
     */
    @RequestMapping("/getProductcategoryByAjax")
    @ResponseBody
    public String getProductcategoryByAjax() {
        System.out.println("---------------------------Method called to Fetch Product category-----------------------------------");
        try {
            List<ProductCategory> productList = productCategoryDao.fetchAll();
            Gson gson = new Gson();
            writeData(gson.toJson(productList));
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductCategoryController\nMethod:getProductcategoryByAjax");
        }
        System.out.println("---------------------------Method End to Fetch Product category-----------------------------------");
        return "productList";
    }

    @RequestMapping(value = "/getProductSubCategoryByAjax")
    public @ResponseBody
    String getProductSubCategoryByAjax(@RequestParam Integer productCategoryId) {
        System.out.println("...............getProductSubCategoryByAjax controller................");
        System.out.println("ProductSubCategory Id@@" + productCategoryId);
        List<ProductSubCategory> productSubCategory = new ArrayList<>();
        Session session = sessionfactory.openSession();
        System.out.println("session is open");
        Query query = session.createQuery("FROM ProductSubCategory WHERE productCategoryId =:productCategoryId");
        query.setParameter("productCategoryId", productCategoryId);
        productSubCategory = query.list();
        Gson gson = new Gson();
        System.out.println("productSubCategory list size:: " + productSubCategory.size());
        return gson.toJson(productSubCategory);
    }

    /*
     * edit ProductSubCategory 
     * Method used to edit Product Sub Category 
     * @param productSubCategoryId
     * @return jsp page
     */
    @RequestMapping("/editProductSubCategory")
    @ResponseBody
    public String editProductSubCategory(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit Product Sub category-----------------------------------");
        try {
            ProductSubCategory productSubCategory = productSubCategoryDao.fetchData(id);
            Gson gson = new Gson();
            writeData(gson.toJson(productSubCategory));
            //  m.addAttribute("productSubCategory", productSubCategory);
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductSubCategoryController\nMethod:editProductSubCategory");

        }
        System.out.println("---------------------------Method End to edit Product Subcategory-----------------------------------");
        return "redirect:/manageProductCategorySubCategory";

    }
    
    
    
    /*
     * edit ProductSubCategory 
     * Method used to edit Product Sub Category 
     * @param productSubCategoryId
     * @return jsp page
     */
    @RequestMapping("/editProductCategory")
    @ResponseBody
    public String editProductCategory(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit Product category-----------------------------------");
        try {
            ProductCategory productCategory = productCategoryDao.fetchData(id);
            Gson gson = new Gson();
            writeData(gson.toJson(productCategory));
            //  m.addAttribute("productSubCategory", productSubCategory);
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductSubCategoryController\nMethod:editProductCategory");

        }
        System.out.println("---------------------------Method End to edit Product Category-----------------------------------");
        return "redirect:/manageProductCategorySubCategory";

    }


    private void writeData(String data) {
        try {
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            HttpServletResponse httpServletResponse = ((ServletRequestAttributes) requestAttributes).getResponse();
            httpServletResponse.setContentType("text/plain");
            httpServletResponse.setCharacterEncoding("UTF-8");
            ServletOutputStream out = httpServletResponse.getOutputStream();
            out.print(data);
            out.flush();
            out.close();
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductCategoryController\nMethod:writeData");

        }
    }
}
