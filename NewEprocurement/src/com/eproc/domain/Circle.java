/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * Process Department Circle Form page with all setter() and getter()
 * Department can insert and update Department Circle.
 * #Author  Anshu Baghel
 */
@Entity
@Table(name="Circle")
public class Circle implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="circleid" , unique = true, nullable = false)
    private Integer circleid;
   
    @Column(name = "dept_Id")
    private Integer dept_Id; 
    
       @Column(name = "circle")
    private  String circle;
       
     @Column(name = "created_Date")
    private Date  created_Date ;

    public Integer getCircleid() {
        return circleid;
    }

    public void setCircleid(Integer circleid) {
        this.circleid = circleid;
    }

    public Integer getDept_Id() {
        return dept_Id;
    }

    public void setDept_Id(Integer dept_Id) {
        this.dept_Id = dept_Id;
    }

    public String getCircle() {
        return circle;
    }

    public void setCircle(String circle) {
        this.circle = circle;
    }

    public Date getCreated_Date() {
        return created_Date;
    }

    public void setCreated_Date(Date created_Date) {
        this.created_Date = created_Date;
    }

   
}

