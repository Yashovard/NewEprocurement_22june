/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Palak Tiwari
 * ContractorOtherDetailsDocs class 
 */
@Entity
@Table(name = "contractordetailsdocs")
public class ContractorOtherDetailsDocs implements Serializable{
 @Id 
 @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer fileId;

   
    private int contOtherId;
    private String docUrl;
    private String docPath;
    private String docName;
    private String docConvertedName;
    private String docpropertyName;

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }
    


    public int getContOtherId() {
        return contOtherId;
    }

    public void setContOtherId(int contOtherId) {
        this.contOtherId = contOtherId;
    }

    public String getDocUrl() {
        return docUrl;
    }

    public void setDocUrl(String docUrl) {
        this.docUrl = docUrl;
    }

    public String getDocPath() {
        return docPath;
    }

    public void setDocPath(String docPath) {
        this.docPath = docPath;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocConvertedName() {
        return docConvertedName;
    }

    public void setDocConvertedName(String docConvertedName) {
        this.docConvertedName = docConvertedName;
    }

    public String getDocpropertyName() {
        return docpropertyName;
    }

    public void setDocpropertyName(String docpropertyName) {
        this.docpropertyName = docpropertyName;
    }
}
