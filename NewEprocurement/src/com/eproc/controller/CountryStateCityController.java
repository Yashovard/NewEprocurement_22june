/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.CitiesDaoImpl;
import com.eproc.daoImpl.CountriesDaoImpl;
import com.eproc.daoImpl.StatesDaoImpl;
import com.eproc.domain.Cities;
import com.eproc.domain.Countries;
import com.eproc.domain.States;
import com.eproc.model.CitiesModel;
import com.eproc.model.CountriesModel;
import com.eproc.model.StatesModel;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
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
 * @author Shashank Shukla
 */
@Controller
public class CountryStateCityController {

    @Autowired
    CountriesDaoImpl countriesDao;

    @Autowired
    StatesDaoImpl statesDaoImpl;

    @Autowired
    CitiesDaoImpl citiesDaoImpl;

     @InitBinder("countries")
    protected void initCountryBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        binder.setValidator(new CountriesModel());
    }
    
      @InitBinder("state")
    protected void initStateBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        binder.setValidator(new StatesModel());
    }
    
      @InitBinder("cities")
    protected void initCitiesBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        binder.setValidator(new CitiesModel());
    }
    
    @RequestMapping("/country_state_city")
    public String welcome(Model m, @ModelAttribute("countries") Countries countries, @ModelAttribute("state") States state, @ModelAttribute("cities") Cities cities) {
        System.out.println("----------------Method begin to call the country state city----------------------");

        try {
            List<Countries> countryList = countriesDao.fetchAll();
//            System.out.println("The size of COuntry list is: " + countryList.size());
//            List<States> statesList = statesDaoImpl.fetchAll();
//            List<Cities> citiesList = citiesDaoImpl.fetchAll();
            m.addAttribute("countryList", countryList);
//            m.addAttribute("stateList", statesList);
//            m.addAttribute("citiesList", citiesList);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "DepartmentAdmin/CountryStateCity";
    }

    @RequestMapping("/saveCountries")
    public String saveCountries(@ModelAttribute("countries") @Validated  Countries countries,BindingResult result,@ModelAttribute("state") States state, @ModelAttribute("cities") Cities cities, Model m, RedirectAttributes ra) {
        System.out.println("---------------------------Method called to save Countries-----------------------------------");
       
         if(result.hasErrors()){
            return "CountryStateCity";
        }
        String msg = "";
        msg = countriesDao.checkDuplicateValue(countries);
        if (!msg.equalsIgnoreCase("Duplicate Country Name") && !msg.equalsIgnoreCase("Enter Country Name")) {
            countriesDao.insertData(countries);
            ra.addFlashAttribute("msg", "Country Added Successfully");
        } else if (msg.equals("Duplicate Country Name")) {
            ra.addFlashAttribute("msg2", "Country is Alredy Exists");
            return "redirect:/country_state_city";
        } else if (msg.equals("Enter Country Name")) {
            ra.addFlashAttribute("msg22", "Please Enter Country");
            return "redirect:/country_state_city";
        }
        System.out.println("---------------------------Method End to save Country-----------------------------------");
        return "redirect:/country_state_city";
    }

    @RequestMapping(value = "/getCountryByAjax")
    @ResponseBody
    public String getCountryByAjax() {
        System.out.println("controller called by ajax111");
        List<Countries> countryList = countriesDao.fetchAll();
        Gson gson = new Gson();
        writeData(gson.toJson(countryList));
        return null;
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

    //Shashank Shukla
    @RequestMapping(value = "/Showstate")
    @ResponseBody
    public String getStateByAjax(@RequestParam int country_id, Model m) {
        System.out.println("controller called by ajax2222      :::" + country_id);
        List<States> stateList = statesDaoImpl.fetchStates(country_id);
//        System.out.println("Country id is:" + gson.toJson(stateList));
        Gson gson = new Gson();
        return gson.toJson(stateList);

    }

    @RequestMapping(value = "/city")
    @ResponseBody
    public String getCityByAjax(@RequestParam int state_id, Model m) {
        List<States> cityList = citiesDaoImpl.fetchCity(state_id);
        System.out.println("Country id is:" + cityList);
        Gson gson = new Gson();
        return gson.toJson(cityList);

    }

    @RequestMapping("/saveState")
    public String saveState(@ModelAttribute("state") @Validated  States state, BindingResult result,@RequestParam Integer country_id,@ModelAttribute("countries") Countries countries, @ModelAttribute("cities") Cities cities, Model m, RedirectAttributes ra) {
        System.out.println("---------------------------Method called to save State-----------------------------------" + state);
       
           if(result.hasErrors()){
            return "DepartmentAdmin/CountryStateCity";
        }
           
        String msg = "State added successfully";
        List str = statesDaoImpl.getDuplicateState(state);
        if (str.size() > 0) {
            msg = "State already Exist";
            m.addAttribute("msg2", msg);
            List<Countries> countryList = countriesDao.fetchAll();
            m.addAttribute("countryList", countryList);
            List<States> statesesList = statesDaoImpl.fetchAll();
            m.addAttribute("statesesList", statesesList);
            return "CountryStateCity";
        }
        if (!msg.equalsIgnoreCase("State already Exist")) {
            List<Countries> countryList = countriesDao.fetchAll();
            Iterator<Countries> iterator = countryList.iterator();
            while (iterator.hasNext()) {
                Countries ctr = iterator.next();
                if (country_id == ctr.getCountry_id()) {
                    state.setCountry_name(ctr.getCountry_name());
                }
            }
            statesDaoImpl.insertData(state);
            m.addAttribute("msg", "State Added Successfully");
            countryList = countriesDao.fetchAll();
            m.addAttribute("countryList", countryList);
            List<States> statesesList = statesDaoImpl.fetchAll();
            m.addAttribute("statesesList", statesesList);
        }
        System.out.println("---------------------------Method End to save State-----------------------------------");

        return "CountryStateCity";
    }

    @RequestMapping(value = "/getStatesByAjax")
    @ResponseBody
    public String getStatesByAjax() {
        List<States> countryList = statesDaoImpl.fetchAll();
        Gson gson = new Gson();
        writeData(gson.toJson(countryList));
        return null;
    }

    @RequestMapping(value = "/getCitiesByAjax")
    @ResponseBody
    public String getCitiesByAjax(@RequestParam int state_id) {
        System.out.println("controller called by ajax3333");
        List<Cities> citiesList = new ArrayList<>();
        citiesList = citiesDaoImpl.fetchCitiesByState(state_id);
        Gson gson = new Gson();
        System.out.println("@@@@@@@@@@@@@@@@" + gson.toJson(citiesList));
        writeData(gson.toJson(citiesList));
        return null;
    }

    @RequestMapping("/saveCity")
    public String saveCategory(@ModelAttribute("cities") @Validated Cities cities, BindingResult result,@RequestParam Integer country_id, @RequestParam Integer state_id, @ModelAttribute("countries") Countries countries, @ModelAttribute("state") States state, Model m, RedirectAttributes ra) {
        
          if(result.hasErrors()){
            return "CountryStateCity";
        }
        String msg = "City added successfully";
        List str1 = citiesDaoImpl.getDuplicateCities(cities);
        if (str1.size() > 0) {
            msg = "City already Exist";
            m.addAttribute("msg2", msg);
            List<Countries> countryList = countriesDao.fetchAll();
            m.addAttribute("countryList", countryList);
            List<States> statesesList = statesDaoImpl.fetchAll();
            m.addAttribute("statesesList", statesesList);
            return "CountryStateCity";
        }
        if (!msg.equalsIgnoreCase("City already Exist")) {
            List<Countries> countryList = countriesDao.fetchAll();
            Iterator<Countries> iterator = countryList.iterator();
            while (iterator.hasNext()) {
                Countries ctr = iterator.next();
                if (country_id == ctr.getCountry_id()) {
                    cities.setCountry_name(ctr.getCountry_name());
                }
            }
            List<States> stateList = statesDaoImpl.fetchAll();
            Iterator<States> iterator1 = stateList.iterator();
            while (iterator1.hasNext()) {
                States states = iterator1.next();
                if (state_id == states.getState_id()) {
                    cities.setState_name(states.getState_name());
                }
            }
            citiesDaoImpl.insertData(cities);
            m.addAttribute("msg", "City Added Successfully");
            countryList = countriesDao.fetchAll();
            m.addAttribute("countryList", countryList);
            List<States> statesesList = statesDaoImpl.fetchAll();
            m.addAttribute("statesesList", statesesList);

        }
        System.out.println("---------------------------Method End to save Cities-----------------------------------");
        List<Countries> countryList = countriesDao.fetchAll();
        m.addAttribute("countryList", countryList);
        List<States> statesesList = statesDaoImpl.fetchAll();
        m.addAttribute("statesesList", statesesList);
        return "CountryStateCity";
    }

    @RequestMapping("/edit")
    @ResponseBody
    public String fetchById(@RequestParam int state_id, Model m) {
        States states = statesDaoImpl.fetchById(state_id);
//        Countries countries = countriesDao.fetchData(states.getCountry_id());
        System.out.println("@@@@@@@@@@@@@@####################" + states.getCountry_id());
//        states.setCountry_name(countries.getCountry_name());
        Gson gson = new Gson();
        return gson.toJson(states);

    }

    @RequestMapping("/editcity")
    @ResponseBody
    public String fetchByIdcity(@RequestParam int city_id, Model m) {
        Cities cities = citiesDaoImpl.fetchByIdEdit(city_id);
        Gson gson = new Gson();
        return gson.toJson(cities);

    }

}
