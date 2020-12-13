package com.eproc.dao;

import com.eproc.domain.Department;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import java.util.List;

public interface DepartmentDao extends DepartmentMaster<Department> {

    String checkLogin(String validUser);

    void saveStatus(Common_Logon_Status commonlogin);

    List<Contractor> fetchAllLogonStatus();
}
