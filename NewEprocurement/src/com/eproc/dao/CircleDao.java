package com.eproc.dao;



//import com.eproc.dao.DepartmentMaster;
//import com.eproc.domain.Circle;


/**
 * This Interface content method to mange country master at department level
 *
 * @author Anshu Baghel
 * @param <Circle>
 */


public interface CircleDao<Circle> extends DepartmentMaster<Circle>
{
 String checkDuplicateValue(Circle circle);
}
