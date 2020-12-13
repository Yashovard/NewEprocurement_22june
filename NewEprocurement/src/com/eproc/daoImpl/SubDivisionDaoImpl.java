/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.SubDivisionDao;
import com.eproc.domain.SubDivision;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubDivisionDaoImpl implements SubDivisionDao<SubDivision>{

    @Autowired
    SessionFactory sessionFactory;
    SubDivision   subdivision;
    
   /*insertData
   * Method used to insert subdivision
   * @param subdivision
   */
   @Override
   public boolean insertData(SubDivision subdivision) {
      System.out.println("----------------Method call to insert subdivision in  SubDivisionDaoImpl----------------");
      Session session = null;
      Transaction txn=null;
      System.out.print(" subdivision save object is " + subdivision);
      try {
         session  = sessionFactory.openSession();
          txn = session.beginTransaction();
          session.saveOrUpdate(subdivision);
         txn.commit();
         System.out.println("subdivision save status is : " );
         
      } catch (Exception ex) {
            txn.rollback();
          System.out.println("Class:SubDivisionDaoImpl \n Method:insertData");
         System.out.print("Exception in insertData in subdivision " + ex.getMessage());
      } finally {
           if(txn != null){
            txn.commit();
        }
         if(session != null){
             session.close();
         }
      }
      System.out.println("----------------Method end to insert subdivision in  SubDivisionDaoImpl----------------");
      return false;
}
   
   /*fetchAll
   * Method used to fetchall data from subdivision
   * @param subdivision
   */
     @Override   
    public List<SubDivision> fetchAll() {
        System.out.println("----------------Method call to fetchAll subdivision in  SubDivisionDaoImpl----------------");
        List<SubDivision> subdivisionList = new ArrayList<SubDivision>();
        try{
        Session session = sessionFactory.openSession();
        subdivisionList = session.createQuery("FROM SubDivision").list();
            Iterator it = subdivisionList.iterator();
            while(it.hasNext()) {
                SubDivision dept1 = (SubDivision)it.next();
                System.out.println("Depart ID " + dept1.getSubdivision_id());
                
            }
             session.close();
        }
         catch (Exception ex) {
             System.out.println("Class:SubDivisionDaoImpl \n Method:fetchAll");
         System.out.print("Exception in fetchAll in subdivision " + ex.getMessage());
      }
         System.out.println("----------------Method end to fetchAll subdivision in  SubDivisionDaoImpl----------------");
         return subdivisionList ;
    }
    
   /*fetchData
   * Method used to fetch subdivision by Id
   * @param subdivision
   */
      @Override
    public SubDivision fetchData(Integer id) {
        System.out.println("----------------Method call to fetch subdivision by Id in  SubDivisionDaoImpl----------------");  
        SubDivision subdivision = new SubDivision();
        Session session =null;
        try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM SubDivision WHERE subdivision_id=:id");
        query.setParameter("id", id );
        subdivision = (SubDivision) query.uniqueResult();
   
        }
         catch (Exception ex) {
             System.out.println("Class:SubDivisionDaoImpl \n Method:fetchData");
         System.out.print("Exception in fetchdata subdivision " + ex.getMessage());
        }
        finally
        {
           session.close();
        }
        System.out.println("----------------Method end to fetch subdivision by Id in  SubDivisionDaoImpl----------------");
        return  subdivision;
   }
    
   /*updateData
   * Method used to update subdivision 
   * @param subdivision
   */
      @Override
    public boolean updateData(SubDivision  subdivision ) {
        System.out.println("----------------Method call to update subdivision in  SubDivisionDaoImpl----------------");
        Session session =null;
        Transaction txn =null;
        try{
         session = sessionFactory.openSession();
         txn = session.beginTransaction();
         session.saveOrUpdate(subdivision);
           }
            catch(Exception ex)
        {
            System.out.println("Class:SubDivisionDaoImpl \n Method:updateData");
            System.out.print("Exception in updateData subdivision " + ex.getMessage());
        }
        finally
        {
        txn.commit();
        session.close();
        }
        System.out.println("----------------Method end to update subdivision in  SubDivisionDaoImpl----------------");
         return false;
    }
    
   /*removeData
   * Method used to remove data from subdivision by Id
   * @param subdivision
   */
     @Override
   public boolean removeData(Integer subdivision_id  ) {
         Session session=null;
         try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM SubDivision WHERE "
                + "subdivision_id  =:subdivision_id");
        query.setParameter("subdivision_id", subdivision_id );
        query.executeUpdate();
            }
          catch(Exception ex)
        {
            System.out.println("Class:SubDivisionDaoImpl \n Method:removeData");
            System.out.print("Exception in updateData subdivision " + ex.getMessage());
        }
           finally
         {
        session.close();
         }
         return false;
    }

   @Override
    public String checkDuplicateValue(SubDivision subdivision) {
  System.out.println("-----------------Method called to checkDuplicateValue SubDivision in Dao----------------------------");
        String message = "";
        List<SubDivision> subdivisionList = this.fetchAll();
        Iterator<SubDivision> iterator = subdivisionList.listIterator();
        while (iterator.hasNext()) {
            SubDivision sd = iterator.next();
            if (subdivision.getSubdivision().trim().equalsIgnoreCase(sd.getSubdivision().trim())
                    &&subdivision.getDivision_id()==sd.getDivision_id()) {
                message = "Duplicate Subdivision Name";
                System.out.println(message);

            } else if (subdivision.getSubdivision().isEmpty() || subdivision.getSubdivision()== null) {

                message = "Enter Subdivision Name";

            }
        }
        System.out.println("-----------------Method End to checkDuplicateValue SubDivision in Dao----------------------------");
        return message;

    }
    
    }


  

    
  
