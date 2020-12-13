/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorDao;
import com.eproc.domain.Contractor;
import com.eproc.util.AesEncrDec;
import com.eproc.util.EncDec;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Yashovardhan Singh
 * @Since 01 July 2018
 * @version 2.0.0
 */
@Repository
public class ContractorDaoImpl implements ContractorDao<Contractor> {

    @Autowired
    SessionFactory sessionFactory;
    @Autowired
    AesEncrDec aesEncrDec;
    @Autowired
    EncDec EncDec;

//----------------------------------Contractor Save-----------------------------
     /*
     *InsertContractor
     *Method used to save the Contractor
     *@See Contractor save
     *Param ContractorObject
     */
    @Override
    public boolean insertData(Contractor contractor) {
        Session session = null;
        boolean status = true;
        try {
            session = sessionFactory.openSession();
            System.out.println("Session is opnen");
            Transaction txn = session.beginTransaction();
            System.out.println("Transaction is begin");
            session.saveOrUpdate(contractor);
            txn.commit();
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:insertData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is Closed");
        }
        return status;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
//------------------------------------------------------------------------------
    /*
     *GeneratePassword
     *Method used to Fetch contractor List based on id
     *@See Contractor list based on id
     *Param Contractor list based on id
     */

    @Override
    public Contractor fetchData(Integer id) {
        Session session = null;
        Contractor contractor = new Contractor();
        try {
            System.out.println("call fetchData method to retrieve data by perticuler id for edit details of Contractor");
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Contractor WHERE id =:id");
            query.setParameter("id", id);
            contractor = (Contractor) query.uniqueResult();
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:fetchData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return contractor;
    }
//------------------------------------------------------------------------------

    @Override
    public boolean updateData(Contractor contractor) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

//------------------------------------------------------------------------------
    /*
     *GeneratePassword
     *Method used to Fetch contractor List
     *@See Contractor list
     *Param Contractor list
     */
    @Override
    public List<Contractor> fetchAll() {
        Session session = null;
        List<Contractor> contractorList = new ArrayList<Contractor>();
        try {
            session = sessionFactory.openSession();
            contractorList = session.createQuery("FROM Contractor").list();
            System.out.println(contractorList.size());
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:fetchData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return contractorList;
    }
//------------------------------------------------------------------------------
    /*
     *GeneratePassword
     *Method used to passwordcheck
     *@See passwordcheck
     *Param passwordcheck
     */

    @Override
    public boolean passwordcheck(String password, String newPassword, String currentPassword) {
        Contractor contractor = new Contractor();
        Session session = sessionFactory.openSession();
        System.out.println("session is open");
        boolean ContractorFound = false;
        System.out.println("query execution start");
        Query query = session.createQuery("FROM Contractor WHERE password=?");
        query.setParameter(0, "password");
        System.out.println("Query execution end");
        //        aesEncrDec.decrypt(password);
//      EncDec.decrypt(password);
        System.out.println(password);
        List list = query.list();
        if ((list != null) && (list.size() > 0)) {
            ContractorFound = true;
        }
        session.close();
        return ContractorFound;
    }
}
