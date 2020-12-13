/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Windows7
 */
@Entity
@Table(name="Contractor_Class")
public class ContractorClass {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "contractorClass_id")
    private Integer contractorClass_id;
    
     @Column(name = "contractorClass_Name")
     private String contractorClass_Name;
     
      @Column(name = "contractorClass_Creationdate")
      private String contractorClass_Creationdate;

    public Integer getContractorClass_id() {
        return contractorClass_id;
    }

    public void setContractorClass_id(Integer contractorClass_id) {
        this.contractorClass_id = contractorClass_id;
    }

    public String getContractorClass_Name() {
        return contractorClass_Name;
    }

    public void setContractorClass_Name(String contractorClass_Name) {
        this.contractorClass_Name = contractorClass_Name;
    }

    public String getContractorClass_Creationdate() {
        return contractorClass_Creationdate;
    }

    public void setContractorClass_Creationdate(String contractorClass_Creationdate) {
        this.contractorClass_Creationdate = contractorClass_Creationdate;
    }

    
      
      
    
    
}
