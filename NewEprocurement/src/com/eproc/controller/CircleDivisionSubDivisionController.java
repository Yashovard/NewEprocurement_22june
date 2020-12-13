/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.CircleDaoImpl;
import com.eproc.daoImpl.DivisionDaoImpl;
import com.eproc.daoImpl.SubDivisionDaoImpl;
import com.eproc.domain.Circle;
import com.eproc.domain.Division;
import com.eproc.domain.SubDivision;
import com.eproc.model.CircleModel;
import com.eproc.model.DivisionModel;
import com.eproc.model.SubDivisionModel;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Mansi Jain
 */
@Controller

public class CircleDivisionSubDivisionController {

    @Autowired
    CircleDaoImpl circleDao;
    @Autowired
    DivisionDaoImpl Divisiondao;
    @Autowired
    SubDivisionDaoImpl subDivisionDao;
    @Autowired
    SessionFactory sessionfactory;
    
    
      /*
     *  initBinder 
     * Method used to apply the server side validation 
     * @param binder
     * @return CircleDivisionSubDivision.jsp
     */
    @InitBinder("circle")
    protected void initCircleBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for circle");
        binder.setValidator(new CircleModel());
    }
     @InitBinder("division")
    protected void initDivisionBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for circle");
        binder.setValidator(new DivisionModel());
    }
   
   @InitBinder("subdivision")
    protected void initSubDivisionBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for circle");
        binder.setValidator(new SubDivisionModel());
    }
   

    private Map<Integer, String> itemselected = new HashMap<>();

    public Map<Integer, String> getItemselected() {
        return itemselected;
    }

    public void setItemselected(Map<Integer, String> itemselected) {
        this.itemselected = itemselected;
    }

    /*manageController
     * Method used to manage circle,Division and subdivision
     * @param ModelAttribute
     */
    @RequestMapping("/circledivisionsubdivision")
    public String manageController(Model m,@ModelAttribute("circle") Circle circle, @ModelAttribute("division") Division division, @ModelAttribute("subdivision") SubDivision subdivision) {
        System.out.println("---------------- Welcome in controller----------");
        try {
            List<Circle> circleList = circleDao.fetchAll();
            m.addAttribute("circleList", circleList);
            m.addAttribute("circle", new Circle());
            System.out.println(".................division list..................");
            List<Division> divisionList = Divisiondao.fetchAll();
            m.addAttribute("divisionList", divisionList);
            m.addAttribute("division", new Division());
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionsubDivisionController");
            System.out.println("Exception in circledivisionsubdivision controller" + ex.getMessage());
        }
        return "DepartmentAdmin/CircleDivisionSubDivision";
    }
    
    
    /*saveCircle
     * Method used to insert circle into Database
     * @param ModelAttribute
     */
    @RequestMapping(value = "/savecircleModel")
    public String saveCircle(@ModelAttribute("circle") @Validated Circle circle, BindingResult result,@ModelAttribute("division") Division division, @ModelAttribute("subdivision") SubDivision subdivision, Model m, RedirectAttributes ra) {
        System.out.println("----------------in controller savecircleModel-----------------");
        try {
            
             
            if (result.hasErrors()) {
                System.out.println("****************validate******************");
                return "CircleDivisionSubDivision";
            }
            
            
            Date date = new Date();
            circle.setCreated_Date(date);
           
               
            String message = "";
            message = circleDao.checkDuplicateValue(circle);
            if (!message.equalsIgnoreCase("Duplicate Circle Name") && !message.equalsIgnoreCase("Enter Circle Name")) {
                circleDao.insertData(circle);
                ra.addFlashAttribute("msg", "Circle Added Successfully");
            } else if (message.equals("Duplicate Circle Name")) {
                ra.addFlashAttribute("msg2", "Circle is Alredy Exists");
                return "redirect:/circledivisionsubdivision";
            } else if (message.equals("Enter Circle Name")) {
                ra.addFlashAttribute("msg2", "Please Enter Circle name");
                return "redirect:/circledivisionsubdivision";
            }
            List<Circle> circleList = circleDao.fetchAll();
            m.addAttribute("circleList", circleList);
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionSubDivision_Controller");
            System.out.println("Exception in saveCircle controller" + ex.getMessage());
        }
        System.out.println("----------------End savecircleModel Controller-----------------");
        return "redirect:/circledivisionsubdivision";
    }

    /*saveDivision
     * Method used to insert Division into Database
     * @param ModelAttribute
     */
     @Transactional
    @RequestMapping(value = "/savedivision")
    public String saveDivision(@ModelAttribute("division") @Validated Division division,BindingResult result,@ModelAttribute("circle") Circle circle, @ModelAttribute("subdivision") SubDivision subdivision,Model m,RedirectAttributes ra) {
        System.out.println("---------------in controller saveDivision-----------------");
        System.out.println("The Division: " + division.getDivision() + "Division ID: " + division.getDivision_id());
       
          try {
              
            if (result.hasErrors()) {
                System.out.println("****************validate Division******************");
                return "CircleDivisionSubDivision";
            }
            
              
            Date date = new Date();
            division.setCreated_Date(date);
             circle = circleDao.fetchData(division.getCircleid());
            division.setCircle(circle.getCircle());
            
             String message = "";
            message = Divisiondao.checkDuplicateValue(division);
            if (!message.equalsIgnoreCase("Duplicate Division Name") && !message.equalsIgnoreCase("Enter Division Name")) {
               Divisiondao.insertData(division);
                ra.addFlashAttribute("msg", "Division Added Successfully");
            } else if (message.equals("Duplicate Division Name")) {
                ra.addFlashAttribute("msg2", "Division is Alredy Exists");
                return "redirect:/circledivisionsubdivision";
            } else if (message.equals("Enter Division Name")) {
                ra.addFlashAttribute("msg2", "Please Enter Division name");
                return "redirect:/circledivisionsubdivision";
            }
            
           // Divisiondao.insertData(division);
            List<Circle> circleList = circleDao.fetchAll();
            m.addAttribute("circleList", circleList);
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionSubDivisionController");
            System.out.println("Exception in saveDivision Controller::" + ex.getMessage());
        }
        return "redirect:/circledivisionsubdivision";
    }

    /*saveSubDivision
     * Method used to insert SubDivision into Database
     * @param ModelAttribute
     */
    @RequestMapping(value = "/savesubdivision")
    public String saveSubDivision(@ModelAttribute("subdivision") @Validated SubDivision subdivision, BindingResult result,@ModelAttribute("circle") Circle circle, @ModelAttribute("division") Division division,Model m,RedirectAttributes ra) {
        System.out.println("-------------in controller savesubdivision----------------");
        System.out.println("Division id%%%" + subdivision.getDivision_id());
        try {
            Date date = new Date();
            subdivision.setCreated_Date(date);

            if (result.hasErrors()) {
                System.out.println("****************validate SubDivision******************");
                return "CircleDivisionSubDivision";
            }

             circle = circleDao.fetchData(subdivision.getCircleid());
            System.out.println("The Circle is: " + circle.getCircle());
            subdivision.setCircle(circle.getCircle());
            System.out.println("The circle in subdivision: " + subdivision.getCircle());
            division = (Division) Divisiondao.fetchData(subdivision.getDivision_id());
            System.out.println("The Division is: " + division.getDivision());
            subdivision.setDivision(division.getDivision());

            String message = "";
            message = subDivisionDao.checkDuplicateValue(subdivision);
            if (!message.equalsIgnoreCase("Duplicate Subdivision Name")) {
                subDivisionDao.insertData(subdivision);
               ra.addFlashAttribute("msg", "SubDivision Added Successfully");
            } else if (message.equals("Duplicate Subdivision Name")) {
                ra.addFlashAttribute("msg2", "Subdivision is Alredy Exists");
                return "redirect:/circledivisionsubdivision";
            } else if (message.equals("Enter Subdivision Name")) {
                ra.addFlashAttribute("msg2", "Please Enter Subdivision name");
                return "redirect:/circledivisionsubdivision";
            }
            List<Circle> circleList = circleDao.fetchAll();
            m.addAttribute("circleList", circleList);
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionSubDivisionController");
            System.out.println("Exception in saveSubDivision Controller" + ex.getMessage());
        }
        return "redirect:/circledivisionsubdivision";
    }

    /*getCircleByAjax
     * Method used to get circleList by ajax
     * @param Model
     */
    @RequestMapping(value = "/getCircleByAjax")
    @ResponseBody
    public List<Circle> getCircleByAjax(Model m) {
        System.out.println(".................getCircleByAjax Controller.............");
        List<Circle> circleList = circleDao.fetchAll();
        m.addAttribute("circleList", circleList);
        return circleList;
    }

    /*getDivisionByAjax
     * Method used to get division corresponding it's circle
     * @param id
     */
    @RequestMapping(value = "/getDivisionByAjax", method = RequestMethod.GET)
    public @ResponseBody
    String getDivisionByAjax(@RequestParam Integer circleid) {
        System.out.println("...............getDivisionByAjax controller................");
        System.out.println("circle Id@@" + circleid);
//         Division division = Divisiondao.fetchData(circleid);
//        Gson gson = new Gson();
//        writeData(gson.toJson(division));
        List<Division> division = new ArrayList<Division>();
        Session session = sessionfactory.openSession();
        System.out.println("session is open");
        Query query = session.createQuery("FROM Division WHERE circleid =:circleid");
        division = query.setParameter("circleid", circleid).list();
        System.out.println("division list size " + division.size());
        Gson gson = new Gson();
        return gson.toJson(division);
        // return null;
    }


    /*getSubDivisionByAjax
     * Method used to get SubDivision corresponding it's division
     * @param id
     */
    @RequestMapping(value = "/getSubDivisionByAjax")
    public @ResponseBody
    String getSubDivisionByAjax(@RequestParam Integer division_id) {

        System.out.println("................getSubDivisionByAjax controller.................");
        List<SubDivision> subdivision = new ArrayList<SubDivision>();
        Session session = sessionfactory.openSession();
        System.out.println("session is open");
        Query query = session.createQuery("FROM SubDivision WHERE division_id =:division_id");
        subdivision = query.setParameter("division_id", division_id).list();
        System.out.println("subdivision list size " + subdivision.size());
        Gson gson = new Gson();
        return gson.toJson(subdivision);
    }

     /*editDivision
     * Method used to update Division
     * @param id
     */
    @RequestMapping("/editCircle")
    @ResponseBody
    public String editCircle(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit Circle-----------------------------------");
        try {
           Circle circle = circleDao.fetchData(id);
            Gson gson = new Gson();
            writeData(gson.toJson(circle));
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:circledivisionsubdivision Controller\nMethod:editCircle");

        }
        System.out.println("---------------------------Method End to edit Circle-----------------------------------");
        return "redirect:/circledivisionsubdivision";

    }
    
    /*editDivision
     * Method used to update Division
     * @param id
     */
    @RequestMapping("/editDivision")
    @ResponseBody
    public String editDivision(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit Division-----------------------------------");
        try {
          Division  division = Divisiondao.fetchData(id);
            Gson gson = new Gson();
            writeData(gson.toJson(division));
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:circledivisionsubdivision Controller\nMethod:editDivision");

        }
        System.out.println("---------------------------Method End to edit Division-----------------------------------");
        return "redirect:/circledivisionsubdivision";

    }

    /*editSubDivision
     * Method used to update SubDivision
     * @param id
     */
    @RequestMapping("/editSubDivision")
    @ResponseBody
    public String editSubDivision(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit SubDivision-----------------------------------");
        try {
            SubDivision subdivision = subDivisionDao.fetchData(id);
            Gson gson = new Gson();
            writeData(gson.toJson(subdivision));
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:circledivisionsubdivision Controller\nMethod:editSubDivision");
        }
        System.out.println("---------------------------Method End to edit SubDivision-----------------------------------");
        return "redirect:/circledivisionsubdivision";
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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
