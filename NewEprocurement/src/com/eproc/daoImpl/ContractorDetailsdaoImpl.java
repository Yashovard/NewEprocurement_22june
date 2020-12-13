/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorDetailsDao;
import com.eproc.domain.ContractorDetails;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Palak Tiwari
 * ContractorDetailsdaoImpl Class
 */
@Repository
public class ContractorDetailsdaoImpl implements ContractorDetailsDao {
@Autowired
 SessionFactory sessionFactory;
 ContractorDetails contractorDetails;
 

    @Override
    public boolean insertData(Object contractorDetails) {
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();

            System.out.println("session is opened");
            session.saveOrUpdate(contractorDetails);
            System.out.println("Save contractor details");
         
        } catch (Exception e) {
            txn.rollback();
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:insertdata");
        } finally {
            if(txn != null){
            txn.commit();
        }
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed");
        }
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ContractorDetails fetchData(Integer id) {
        ContractorDetails contractorDetails = new ContractorDetails();
        Session session = null;
        try {

            session = sessionFactory.openSession();
            System.out.println("fetch data from id" + id);
            Query query = session.createQuery("FROM ContractorDetails WHERE contOtherId=:id ");
            query.setParameter("id", id);
            contractorDetails = (ContractorDetails) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchdata()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
        return contractorDetails;
    }

    @Override
    public boolean updateData(Object contractorDetails) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");

            session.saveOrUpdate(contractorDetails);
            System.out.println("Save contractor details");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:updateData");
            
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed");
        }
        return true;
    }

    @Override
    public List<ContractorDetails> fetchAll() {
        System.out.println("fetching all the data from database");
        Session session = null;
        List<ContractorDetails> contractorDetailsList = new ArrayList<ContractorDetails>();
        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened");

            session = sessionFactory.openSession();
            contractorDetailsList = session.createQuery("from ContractorDetails").list();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchAll");
            
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed");
        }
        return contractorDetailsList;
    }

}
  

