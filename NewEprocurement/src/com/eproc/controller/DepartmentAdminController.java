/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Gaurav Dubey
 */
@Controller
public class DepartmentAdminController {
    
    
    @RequestMapping("/DepartmentAdminLogin")
    public String departmentAdminDashboard(){
        return "DepartmentAdmin/AdminDashboard";
    }
}
