 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Palak Tiwari
 * ContractorDetails  class 
 */

@Entity
@Table(name = "contractordetails")
public class ContractorDetails implements Serializable {
       
 @Id 
 @GeneratedValue(strategy = GenerationType.AUTO)
   private int contOtherId;
 
   private int regId=2; 
   private String contRegistrationNo; 
   private String contCompanyEstablishmentYear; 
   private String contCompanyContactNo; 
   private String contCompanyEmail; 
   private String contCompanyWebsite; 
   private String contCompanyType; 
   private String contOrganization; 
   private String contCompanyName; 
   private String contCompanyAddressNo; 
   private String contCompanyPanCardNo; 
   private String contAddressNo; 
   private String contPanCardNo; 
   private String contBankAccountNo;
   private String contBankName;
   private String contBankAddress; 
   private String contBeneficiaryAccountNo;
   private String contBankCode;
   private Date updatedOn;
   private String otherOrganization;
    private String contBankBranch;
    private String FeeStatus;
    private String address;
    private Integer state;
    private String district;
    private String place;
    private String pincode;
    private String contractor;
    //for indian client registration
    private String firstName;
    private String middleName;
    private String lastName;
    private Integer clientState;
    private String clientCity;
    private String clientContact;
//    private String status;
//
//    public String getStatus() {
//        return status;
//    }
//
//    public void setStatus(String status) {
//        this.status = status;
//    }
    public int getContOtherId() {
        return contOtherId;
    }

    public void setContOtherId(int contOtherId) {
        this.contOtherId = contOtherId;
    }

    public int getRegId() {
        return regId;
    }

    public void setRegId(int regId) {
        this.regId = regId;
    }

    public String getContRegistrationNo() {
        return contRegistrationNo;
    }

    public void setContRegistrationNo(String contRegistrationNo) {
        this.contRegistrationNo = contRegistrationNo;
    }

    public String getContCompanyEstablishmentYear() {
        return contCompanyEstablishmentYear;
    }

    public void setContCompanyEstablishmentYear(String contCompanyEstablishmentYear) {
        this.contCompanyEstablishmentYear = contCompanyEstablishmentYear;
    }

    public String getContCompanyContactNo() {
        return contCompanyContactNo;
    }

    public void setContCompanyContactNo(String contCompanyContactNo) {
        this.contCompanyContactNo = contCompanyContactNo;
    }

    public String getContCompanyEmail() {
        return contCompanyEmail;
    }

    public void setContCompanyEmail(String contCompanyEmail) {
        this.contCompanyEmail = contCompanyEmail;
    }

    public String getContCompanyWebsite() {
        return contCompanyWebsite;
    }

    public void setContCompanyWebsite(String contCompanyWebsite) {
        this.contCompanyWebsite = contCompanyWebsite;
    }

    public String getContCompanyType() {
        return contCompanyType;
    }

    public void setContCompanyType(String contCompanyType) {
        this.contCompanyType = contCompanyType;
    }

    public String getContOrganization() {
        return contOrganization;
    }

    public void setContOrganization(String contOrganization) {
        this.contOrganization = contOrganization;
    }

    public String getContCompanyName() {
        return contCompanyName;
    }

    public void setContCompanyName(String contCompanyName) {
        this.contCompanyName = contCompanyName;
    }

    public String getContCompanyAddressNo() {
        return contCompanyAddressNo;
    }

    public void setContCompanyAddressNo(String contCompanyAddressNo) {
        this.contCompanyAddressNo = contCompanyAddressNo;
    }

    public String getContCompanyPanCardNo() {
        return contCompanyPanCardNo;
    }

    public void setContCompanyPanCardNo(String contCompanyPanCardNo) {
        this.contCompanyPanCardNo = contCompanyPanCardNo;
    }

    public String getContAddressNo() {
        return contAddressNo;
    }

    public void setContAddressNo(String contAddressNo) {
        this.contAddressNo = contAddressNo;
    }

    public String getContPanCardNo() {
        return contPanCardNo;
    }

    public void setContPanCardNo(String contPanCardNo) {
        this.contPanCardNo = contPanCardNo;
    }

    public String getContBankAccountNo() {
        return contBankAccountNo;
    }

    public void setContBankAccountNo(String contBankAccountNo) {
        this.contBankAccountNo = contBankAccountNo;
    }

    public String getContBankName() {
        return contBankName;
    }

    public void setContBankName(String contBankName) {
        this.contBankName = contBankName;
    }

    public String getContBankAddress() {
        return contBankAddress;
    }

    public void setContBankAddress(String contBankAddress) {
        this.contBankAddress = contBankAddress;
    }

    public String getContBeneficiaryAccountNo() {
        return contBeneficiaryAccountNo;
    }

    public void setContBeneficiaryAccountNo(String contBeneficiaryAccountNo) {
        this.contBeneficiaryAccountNo = contBeneficiaryAccountNo;
    }

    public String getContBankCode() {
        return contBankCode;
    }

    public void setContBankCode(String contBankCode) {
        this.contBankCode = contBankCode;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public void setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
    }
    public String getContBankBranch() {
        return contBankBranch;
    }

    public void setContBankBranch(String contBankBranch) {
        this.contBankBranch = contBankBranch;
    }

    public String getFeeStatus() {
        return FeeStatus;
    }

    public void setFeeStatus(String FeeStatus) {
        this.FeeStatus = FeeStatus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getDistrict() {
        return district;
    }
   public void setDistrict(String district) {
        this.district = district;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getContractor() {
        return contractor;
    }

    public void setContractor(String contractor) {
        this.contractor = contractor;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }



    public String getClientCity() {
        return clientCity;
    }

    public void setClientCity(String clientCity) {
        this.clientCity = clientCity;
    }

    public String getClientContact() {
        return clientContact;
    }

    public void setClientContact(String clientContact) {
        this.clientContact = clientContact;
    }
  

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getClientState() {
        return clientState;
    }

    public void setClientState(Integer clientState) {
        this.clientState = clientState;
    }
      public String getOtherOrganization() {
        return otherOrganization;
    }

    public void setOtherOrganization(String otherOrganization) {
        this.otherOrganization = otherOrganization;
    }
}
