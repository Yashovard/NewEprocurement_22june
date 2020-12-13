/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Gaurav Dubey
 */
@Entity
@Table(name = "tender")
public class Tender {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tender_Id")
    private int tender_Id;
    
    @Column(name = "tender_No")
    private int tender_No;
    
    @Column(name = "contractorClass")
    private String contractorClass;
    
    @Column(name = "emdApplicable")
    private String emdApplicable;
    
    @Column(name = "nameOfWork")
    private String nameOfWork;
    
    @Column(name = "nitDate")
    private String nitDate;
    
    @Column(name = "nitNumber")
    private String nitNumber;
    
    @Column(name = "numberOfWork")
    private String numberOfWork;
    
    @Column(name = "officerName")
    private String officerName;
    
    @Column(name = "pacLimitInFigure")
    private String pacLimitInFigure;
    
    @Column(name = "pacLimitInWords")
    private String pacLimitInWords;
    
    @Column(name = "shortDescription")
    private String shortDescription;
    
    @Column(name = "tenderKeyWords")
    private String tenderKeyWords;
    
    @Column(name = "valueSlab")
    private String valueSlab;
    
    @Column(name = "documentFile")
    private String documentFile;
    
    @Column(name = "documentName")
    private String documentName;
    
    @Column(name = "emdInFigure")
    private String emdInFigure;
    
    @Column(name = "emdInWord")
    private String emdInWord;
    
    @Column(name = "pacLimit")
    private String pacLimit;
    
    @Column(name = "rainySeason")
    private String rainySeason;
    
    @Column(name = "selectiveTender")
    private String selectiveTender;
    
    @Column(name = "stageWiseTender")
    private String stageWiseTender;
    
    @Column(name = "tenderCategory")
    private String tenderCategory;
    
    @Column(name = "tenderFeeInFigure")
    private String tenderFeeInFigure;
    
    @Column(name = "tenderFeeInWords")
    private String tenderFeeInWords;
    
    @Column(name = "tenderNotice")
    private String tenderNotice;
    
    @Column(name = "timeDuration")
    private String timeDuration;
    
    @Column(name = "timePeriod")
    private String timePeriod;
    
    @Column(name = "typeOfTender")
    private String typeOfTender;
    
    @Column(name = "tender_Status")
    private String tender_Status;
    
    @Column(name = "wizardStep")
    private String wizardStep;
 
    
    public int getTender_Id() {
        return tender_Id;
    }

    public void setTender_Id(int tender_Id) {
        this.tender_Id = tender_Id;
    }

    public int getTender_No() {
        return tender_No;
    }

    public void setTender_No(int tender_No) {
        this.tender_No = tender_No;
    }

    public String getContractorClass() {
        return contractorClass;
    }

    public void setContractorClass(String contractorClass) {
        this.contractorClass = contractorClass;
    }

    public String getEmdApplicable() {
        return emdApplicable;
    }

    public void setEmdApplicable(String emdApplicable) {
        this.emdApplicable = emdApplicable;
    }

    public String getNameOfWork() {
        return nameOfWork;
    }

    public void setNameOfWork(String nameOfWork) {
        this.nameOfWork = nameOfWork;
    }

    public String getNitDate() {
        return nitDate;
    }

    public void setNitDate(String nitDate) {
        this.nitDate = nitDate;
    }

    public String getNitNumber() {
        return nitNumber;
    }

    public void setNitNumber(String nitNumber) {
        this.nitNumber = nitNumber;
    }

    public String getNumberOfWork() {
        return numberOfWork;
    }

    public void setNumberOfWork(String numberOfWork) {
        this.numberOfWork = numberOfWork;
    }

    public String getOfficerName() {
        return officerName;
    }

    public void setOfficerName(String officerName) {
        this.officerName = officerName;
    }

    public String getPacLimitInFigure() {
        return pacLimitInFigure;
    }

    public void setPacLimitInFigure(String pacLimitInFigure) {
        this.pacLimitInFigure = pacLimitInFigure;
    }

    public String getPacLimitInWords() {
        return pacLimitInWords;
    }

    public void setPacLimitInWords(String pacLimitInWords) {
        this.pacLimitInWords = pacLimitInWords;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getTenderKeyWords() {
        return tenderKeyWords;
    }

    public void setTenderKeyWords(String tenderKeyWords) {
        this.tenderKeyWords = tenderKeyWords;
    }

    public String getValueSlab() {
        return valueSlab;
    }

    public void setValueSlab(String valueSlab) {
        this.valueSlab = valueSlab;
    }

    public String getDocumentFile() {
        return documentFile;
    }

    public void setDocumentFile(String documentFile) {
        this.documentFile = documentFile;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public String getEmdInFigure() {
        return emdInFigure;
    }

    public void setEmdInFigure(String emdInFigure) {
        this.emdInFigure = emdInFigure;
    }

    public String getEmdInWord() {
        return emdInWord;
    }

    public void setEmdInWord(String emdInWord) {
        this.emdInWord = emdInWord;
    }

    public String getPacLimit() {
        return pacLimit;
    }

    public void setPacLimit(String pacLimit) {
        this.pacLimit = pacLimit;
    }

    public String getRainySeason() {
        return rainySeason;
    }

    public void setRainySeason(String rainySeason) {
        this.rainySeason = rainySeason;
    }

    public String getSelectiveTender() {
        return selectiveTender;
    }

    public void setSelectiveTender(String selectiveTender) {
        this.selectiveTender = selectiveTender;
    }

    public String getStageWiseTender() {
        return stageWiseTender;
    }

    public void setStageWiseTender(String stageWiseTender) {
        this.stageWiseTender = stageWiseTender;
    }

    public String getTenderCategory() {
        return tenderCategory;
    }

    public void setTenderCategory(String tenderCategory) {
        this.tenderCategory = tenderCategory;
    }

    public String getTenderFeeInFigure() {
        return tenderFeeInFigure;
    }

    public void setTenderFeeInFigure(String tenderFeeInFigure) {
        this.tenderFeeInFigure = tenderFeeInFigure;
    }

    public String getTenderFeeInWords() {
        return tenderFeeInWords;
    }

    public void setTenderFeeInWords(String tenderFeeInWords) {
        this.tenderFeeInWords = tenderFeeInWords;
    }

    public String getTenderNotice() {
        return tenderNotice;
    }

    public void setTenderNotice(String tenderNotice) {
        this.tenderNotice = tenderNotice;
    }

    public String getTimeDuration() {
        return timeDuration;
    }

    public void setTimeDuration(String timeDuration) {
        this.timeDuration = timeDuration;
    }

    public String getTimePeriod() {
        return timePeriod;
    }

    public void setTimePeriod(String timePeriod) {
        this.timePeriod = timePeriod;
    }

    public String getTypeOfTender() {
        return typeOfTender;
    }

    public void setTypeOfTender(String typeOfTender) {
        this.typeOfTender = typeOfTender;
    }

    public String getTender_Status() {
        return tender_Status;
    }

    public void setTender_Status(String tender_Status) {
        this.tender_Status = tender_Status;
    }

    public String getWizardStep() {
        return wizardStep;
    }

    public void setWizardStep(String wizardStep) {
        this.wizardStep = wizardStep;
    }
    
    

}
