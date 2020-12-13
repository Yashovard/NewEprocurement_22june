package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "department")
public class Department implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "Name")
    private String name;

    @Column(name = "Role")
    private String role = "DepartmentUser";

    @Column(name = "PhoneNo")
    private String phoneno;

    @Column(name = "FaxNo")
    private String faxno;

    @Column(name = "EmailId")
    private String emailid;

    @Column(name = "LoginId")
    private String loginid;

    @Column(name = "UserName")
    private String username;

    @Column(name = "Status")
    private String status;

    @Column(name = "ShortName")
    private String shortname;

    @Column(name = "Address")
    private String Address;

    @Column(name = "MobileNo")
    private String mobileno;

    @Column(name = "Enc_Pwd")
    private String enc_pwd;

    @Column(name = "Current_Login")
    private Date Current_Login;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getFaxno() {
        return faxno;
    }

    public void setFaxno(String faxno) {
        this.faxno = faxno;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getLoginid() {
        return loginid;
    }

    public void setLoginid(String loginid) {
        this.loginid = loginid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShortname() {
        return shortname;
    }

    public void setShortname(String shortname) {
        this.shortname = shortname;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public Department() {
    }

    public Date getCurrent_Login() {
        return Current_Login;
    }

    public void setCurrent_Login(Date Current_Login) {
        this.Current_Login = Current_Login;
    }

    public String getEnc_pwd() {
        return enc_pwd;
    }

    public void setEnc_pwd(String enc_pwd) {
        this.enc_pwd = enc_pwd;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
