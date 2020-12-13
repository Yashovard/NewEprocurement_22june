package com.eproc.daoImpl;

import com.eproc.dao.DesignationDao;
import com.eproc.domain.Designation;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *@author Mansi Jain
 * @since 18june2018
 * @version 2.0.0
 */
@Repository
public class DesignationDaoImpl implements DesignationDao<Designation>{
     @Autowired
    SessionFactory sessionFactory;
   
    Designation designation; 

 
    @Override
    public boolean insertData(Designation designation) {
        
          System.out.println("----------------Method call to insert Designation in  DesignationDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(designation);      
            System.out.println("Begin the transaction");
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println("Class:DesignationDaoImpl \n Method:insertData");
            System.out.print("Exception in Designation  :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
        }      
        
    }
          System.out.println("----------------Method end to insert Designation in  DesignationDaoImpl----------------");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Designation fetchData(Integer id) {
        System.out.println("-----------------Method call to fetchdata Designation in  DesignationDaoImpl-----------------"+id);
        Session session = sessionFactory.openSession(); 
        try {           
           Query query = session.createQuery("FROM Designation WHERE id =:id");
            query.setParameter("id", id);
            designation = (Designation) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:DesignationDaoImpl \n Method:fetchData");
            System.out.println("Exception in fetchData in Designation " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchdata Designation in  DesignationDaoImpl----------------");
        return designation;
    }

    @Override
    public boolean updateData(Designation designation) {
throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        
         System.out.println("----------------Method call to fetchAll Designation in  DesignationDaoImpl----------------");
        Session session = null;
        List<Designation> designationList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
             designationList = session.createQuery("FROM Designation").list();
             System.out.println("size of designation"+designationList.size());
        } catch (Exception ex) {
            System.out.println("Class:DesignationDaoImpl \n Method:fetchAll");
            System.out.print("Exception in fetchall in Designation " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAll Designation in  DesignationDaoImpl----------------");
       return designationList;
    }

   
    
}
