package com.eproc.dao;


import java.util.List;

 /*
 * @author Aditya Vyas
 * @param <E>
 */
public interface DepartmentMaster<E> {
    
    public abstract boolean insertData(E e);
    public abstract boolean removeData(Integer id);
    public abstract E fetchData(Integer id);
    public abstract boolean updateData(E e);
    public abstract List fetchAll();
    
   
    
}