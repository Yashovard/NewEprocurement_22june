package com.eproc.dao;


import com.eproc.dao.DepartmentMaster;

/**
 * This Interface content method to mange country master at department level
 *
 * @author Aditya Vyas
 * @param <SubDivision>
 */

public interface SubDivisionDao<SubDivision>  extends DepartmentMaster<SubDivision>
{
  String checkDuplicateValue(SubDivision subdivision);

    
}



 
    
 