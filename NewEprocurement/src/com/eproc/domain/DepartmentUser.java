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
import javax.persistence.Transient;

/**
 *
 * @author Gaurav Dubey
 */
@Entity
@Table(name = "department_user_registration1")
public class DepartmentUser {
   
   @Id
   @Column(name ="reg_Id")
   @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer reg_Id;

    public Integer getReg_Id() {
        return reg_Id;
    }

    public void setReg_Id(Integer reg_Id) {
        this.reg_Id = reg_Id;
    }
   
   
    @Column(name = "firstName")
    private String firstName;
    
    @Column(name = "lastName")
    private String lastName;
    
    @Column(name = "mobNo")
    private String mobNo;
    
    @Column(name = "emailAdd")
    private String emailAdd;
    
    @Column(name = "dob")
    private String dob;
    
    @Column(name = "userType")
    private String userType;
    
    @Column(name = "password")
    private String password;
    
    @Column(name = "status")
    private String status;
    
    @Column(name = "panCardNo")
    private String panCardNo;
    
    @Column(name = "address")
    private String address;
    
    @Column(name = "pincode")
    private String pincode;
    
    @Column(name = "city")
    private String city;
    
    @Column(name = "state")
    private String state;
    
    @Column(name = "deptcircle")
    private String deptcircle;
    
    @Column(name = "deptSubDivision")
    private String deptSubDivision;
    
    @Column(name = "deptId")
    private String deptId;
    
    @Column(name = "secretKey")
    private String secretKey;
    
    @Column(name = "userId")
    private String userId;
    
    @Column(name = "designation")
    private Integer designationName;
    
    @Column(name = "circleName")
    private Integer circleName;
    
    @Column(name = "divisionName")
    private Integer divisionName;
    
    @Column(name = "subdivisionName")
    private Integer subdivisionName;
    
    @Column(name = "deptUserRegistrationDate")
    private Date deptUserRegistrationDate;
    
    @Column(name = "lastModifiedBy")
    private String lastModifiedBy;
    
    @Column(name = "lastModifiedOn")
    private String lastModifiedOn;
    
    @Column(name = "userStatus")
    private String userStatus;
    
    @Column(name = "deptName")
    private String deptName;
    
    @Column(name="psclimit")
    private String psclimit;
    
    @Transient
    private String circle;
    
    @Transient
    private String division;
    
    @Transient
    private String subDivision;
    
    @Transient
    private String designations;
    
//    @Column(name = "DepartmentUserPrivilege")
//      private String[] userPrivileges;

     @Column(name = "DepartmentUserPrivilege")
      private String userPrivileges;
   

    
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

    public String getMobNo() {
        return mobNo;
    }

    public void setMobNo(String mobNo) {
        this.mobNo = mobNo;
    }

    public String getEmailAdd() {
        return emailAdd;
    }

    public void setEmailAdd(String emailAdd) {
        this.emailAdd = emailAdd;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPanCardNo() {
        return panCardNo;
    }

    public void setPanCardNo(String panCardNo) {
        this.panCardNo = panCardNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDeptcircle() {
        return deptcircle;
    }

    public void setDeptcircle(String deptcircle) {
        this.deptcircle = deptcircle;
    }

    public String getDeptSubDivision() {
        return deptSubDivision;
    }

    public void setDeptSubDivision(String deptSubDivision) {
        this.deptSubDivision = deptSubDivision;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDesignations() {
        return designations;
    }

    public void setDesignations(String designations) {
        this.designations = designations;
    }

    

  
    public Integer getCircleName() {
        return circleName;
    }

    public void setCircleName(Integer circleName) {
        this.circleName = circleName;
    }

    public Integer getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(Integer divisionName) {
        this.divisionName = divisionName;
    }

    public Integer getSubdivisionName() {
        return subdivisionName;
    }

    public void setSubdivisionName(Integer subdivisionName) {
        this.subdivisionName = subdivisionName;
    }

    public Date getDeptUserRegistrationDate() {
        return deptUserRegistrationDate;
    }

    public void setDeptUserRegistrationDate(Date deptUserRegistrationDate) {
        this.deptUserRegistrationDate = deptUserRegistrationDate;
    }

    public String getPsclimit() {
        return psclimit;
    }

    public void setPsclimit(String psclimit) {
        this.psclimit = psclimit;
    }

    public String getCircle() {
        return circle;
    }

    public void setCircle(String circle) {
        this.circle = circle;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getSubDivision() {
        return subDivision;
    }

    public void setSubDivision(String subDivision) {
        this.subDivision = subDivision;
    }

    public Integer getDesignationName() {
        return designationName;
    }

    public void setDesignationName(Integer designationName) {
        this.designationName = designationName;
    }

    

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public String getLastModifiedOn() {
        return lastModifiedOn;
    }

    public void setLastModifiedOn(String lastModifiedOn) {
        this.lastModifiedOn = lastModifiedOn;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

//    public String[] getUserPrivileges() {
//        return userPrivileges;
//    }
//
//    public void setUserPrivileges(String[] userPrivileges) {
//        this.userPrivileges = userPrivileges;
//    }

    public String getUserPrivileges() {
        return userPrivileges;
    }

    public void setUserPrivileges(String userPrivileges) {
        this.userPrivileges = userPrivileges;
    }

    

   
 


    

   


   
   
    
    
}
