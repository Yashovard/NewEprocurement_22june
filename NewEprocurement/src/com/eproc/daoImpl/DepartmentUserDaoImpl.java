
package com.eproc.daoImpl;

import com.eproc.dao.DepartmentMaster;
import com.eproc.dao.DepartmentUserDao;
import com.eproc.domain.DepartmentUser;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * 
 * @author Gaurav Dubey
 */
@Repository
public class DepartmentUserDaoImpl implements DepartmentUserDao<DepartmentUser>{

    @Autowired
    SessionFactory sessionFactory;
    DepartmentUser departmentUser;
 
    /*
     * fetchAll DepartmentUser 
     * Method used to fetch All DepartmentUser
     * @param 
     * @return departmentUsers
     */
    @Override
    public List fetchAll() {
     System.out.println("-----------------Method called to fetchAll DepartmentUser in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentUser> departmentUsers = new ArrayList<>();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser");
         departmentUsers = query.list();
         System.out.println("The Depratment User List is: "+departmentUsers.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchAll");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method called to fetchAll DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return departmentUsers;
    }

    /*
     * SaveOrUpdate DepartmentUser 
     * Method used to save or update DepartmentUser
     * @param DepartmentUser
     * @return true
     */
    @Override
    @Transactional 
    public boolean insertData(DepartmentUser departmentUser) {
         System.out.println("-----------------Method called to insertData DepartmentUser in DepartmentUserDaoImpl----------------------------"); 
     Session session = null;
     boolean result = false;
     try{
        
         session = sessionFactory.openSession();
         Transaction txn = session.beginTransaction();
         session.saveOrUpdate(departmentUser);
          txn.commit();
     }catch(Exception ex){
            System.out.println("Class: DepartmentUserDaoImpl \n Method:insertdata");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
      System.out.println("-----------------Method called to insertData DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return result;
    }

    @Override
    public boolean updateData(DepartmentUser e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /*
     * remove DepartmentUser 
     * Method used to remove DepartmentUser
     * @param id
     * @return true
     */
    @Override
    public boolean removeData(Integer id) {
        System.out.println("-----------------Method called to remove DepartmentUser in DepartmentUserDaoImpl----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("DELETE FROM DepartmentUser WHERE reg_Id =:id");
            query.setParameter("id", id);
            query.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in removeData By Id of DepartmentUser : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to remove DepartmentUser in DepartmentUserDaoImpl----------------------------");
        return true;
    }

     /*
     * fetch DepartmentUser 
     * Method used to fetch DepartmentUser
     * @param reg_Id
     * @return departmentUser
     */
    @Override
    public DepartmentUser fetchData(Integer reg_Id) {
        
         System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
       DepartmentUser departmentUser = null;
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM DepartmentUser WHERE reg_Id =:reg_Id");
           departmentUser = (DepartmentUser) query.setParameter("reg_Id", reg_Id).uniqueResult();
           System.out.println("The Department User: getDivisionName"+departmentUser.getDivisionName());
           System.out.println("The Department User: getSubDivisionName"+departmentUser.getSubdivisionName());
         
       }catch(Exception ex){
              System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchData");
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
        System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
       return departmentUser;
    }

    @Override
    public String checkDuplicateValue(DepartmentUser departmentUser) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
   
    
}
