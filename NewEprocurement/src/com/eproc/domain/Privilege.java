
package com.eproc.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * Process ProductCategory Form page with all setter() and getter()
 * 
 *@auhtor Vaishali Gupta
 */

@Entity
@Table(name="privilege")
public class Privilege implements Serializable{
 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "privilegeId")
    private int privilegeid;
    
    @Column(name = "privilegeName")
    private String privilegeName;
     
    @Column(name = "privilegeArea")
    private String privilegeArea;
     
    @Column(name="privilegeAction")
    private String privilegeAction; 
    
    public int getPrivilegeid() {
        return privilegeid;
    }

    public void setPrivilegeid(int privilegeid) {
        this.privilegeid = privilegeid;
    }

    public String getPrivilegeName() {
        return privilegeName;
    }

    public void setPrivilegeName(String privilegeName) {
        this.privilegeName = privilegeName;
    }

    public String getPrivilegeArea() {
        return privilegeArea;
    }

    public void setPrivilegeArea(String privilegeArea) {
        this.privilegeArea = privilegeArea;
    }

    public String getPrivilegeAction() {
        return privilegeAction;
    }

    public void setPrivilegeAction(String privilegeAction) {
        this.privilegeAction = privilegeAction;
    }

    
    
    
}
