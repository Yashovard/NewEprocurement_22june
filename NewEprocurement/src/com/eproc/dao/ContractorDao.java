/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

/*
 * @author Yashovardhan Singh
 * @Param<Contractor Registration>
 * Since 25 july 2018
 * @Version 2.0.0
 */
public interface ContractorDao<Contractor> extends DepartmentMaster<Contractor>{

    public boolean passwordcheck(String password, String newPassword, String currentPassword);
      
}
