/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.DepartmentMaster;
import com.eproc.dao.PrivilegeDao;
import com.eproc.domain.Privilege;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vaishali Gupta
 */
@Repository
public class PrivilegeDaoImpl implements PrivilegeDao<Privilege>{
    
    
    @Autowired
    SessionFactory sessionFactory;
    Privilege Privilege;
    
  
    
    
     public List fetchAll() {
        System.out.println("-----------------Method called to fetchAll Product category in Dao----------------------------");
        List<Privilege> priviligeList = new ArrayList<Privilege>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
           priviligeList = session.createQuery("FROM Privilege").list();
            System.out.println("Size of Privilege is " + priviligeList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll productCategoryList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll Product category in Dao----------------------------");
        return priviligeList;
    }

    @Override
    public boolean insertData(Privilege e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Privilege fetchData(Integer id) {
        
        System.out.println("-----------------Method Called to fetchdata Privilege in Dao----------------------------");

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Privilege WHERE privilegeid =:privilegeid");
            query.setParameter("privilegeid", id);
          Privilege = (Privilege) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of Privilege : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata Privilege  in Dao----------------------------");
        return Privilege;
    }

    @Override
    public boolean updateData(Privilege e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

   

   
}
