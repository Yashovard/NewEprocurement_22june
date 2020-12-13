package com.eproc.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author Mansi Jain
 * @since 18 june 2018
 * @version 2.0.0
 */
@Entity
@Table(name = "Designation")
public class Designation implements Serializable{
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "designationid")
    private int designationid;
    
//    @Column(name = "dept_Id")
//     private int dept_Id; 
    
    @Column(name = "designation")
    private String designation;

   

    public int getDesignationid() {
        return designationid;
    }

    public void setDesignationid(int designationid) {
        this.designationid = designationid;
    }
//
//    public int getDept_Id() {
//        return dept_Id;
//    }
//
//    public void setDept_Id(int dept_Id) {
//        this.dept_Id = dept_Id;
//    }

  

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
    
    
}
