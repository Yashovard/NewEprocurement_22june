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
 * @author Naina jain
 */
@Entity
@Table(name = "common_logon_status")
public class Common_Logon_Status {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    private int id;

    @Column(name = "EmailId")
    private String emailid;

    @Column(name = "Role")
    private String role;

    @Column(name = "MobileNo")
    private String mobileno;

    @Column(name = "Current_Login")
    private Date Current_Login;

    @Column(name = "Last_Login")
    private Date Last_Login;

    @Column(name = "Ip_Address")
    private String Ip_Address;

    @Column(name = "Mac_Address")
    private StringBuilder Mac_Address;

    @Column(name = "Enc_Pwd")
    private String enc_pwd;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public Date getCurrent_Login() {
        return Current_Login;
    }

    public void setCurrent_Login(Date Current_Login) {
        this.Current_Login = Current_Login;
    }

    public Date getLast_Login() {
        return Last_Login;
    }

    public void setLast_Login(Date Last_Login) {
        this.Last_Login = Last_Login;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public String getIp_Address() {
        return Ip_Address;
    }

    public void setIp_Address(String Ip_Address) {
        this.Ip_Address = Ip_Address;
    }

    public StringBuilder getMac_Address() {
        return Mac_Address;
    }

    public void setMac_Address(StringBuilder Mac_Address) {
        this.Mac_Address = Mac_Address;
    }

    public String getEnc_pwd() {
        return enc_pwd;
    }

    public void setEnc_pwd(String enc_pwd) {
        this.enc_pwd = enc_pwd;
    }

}
