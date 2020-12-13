package com.eproc.dao;


import java.util.List;

 /*
 * @author Gaurav Dubey
 * @param <DepartmentUser>
 */
public interface DepartmentUserDao<DepartmentUser> extends DepartmentMaster<DepartmentUser> {
    
    public String checkDuplicateValue(DepartmentUser departmentUser);
    
}