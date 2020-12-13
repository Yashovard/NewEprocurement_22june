package com.eproc.dao;


import com.eproc.dao.DepartmentMaster;
/**
 * This Interface content method to mange country master at department level
 *
 * @author Aditya Vyas
 * @param <Division>
 */

public interface DivisionDao<Division> extends DepartmentMaster<Division>

{

   String checkDuplicateValue(Division division);
}
