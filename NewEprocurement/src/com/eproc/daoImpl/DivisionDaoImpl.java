package com.eproc.daoImpl;

import com.eproc.dao.DivisionDao;
import com.eproc.domain.Division;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DivisionDaoImpl implements DivisionDao<Division> {

    @Autowired
    SessionFactory sessionFactory;
    Division division;
    
    /*insertData
     * Method used to insert division
     * @param division
     */
    @Override
    public boolean insertData(Division division) {
        System.out.println("----------------Method call to insert division in  DivisionDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(division);      
            System.out.println("Begin the transaction");
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println("Class:DivisionDaoImpl \n Method:insertData");
            System.out.print("Exception in insertData division :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
        }      
        
    }
        System.out.println("----------------Method end to insert division in  DivisionDaoImpl----------------");
        return false;
    }


    /*fetchAll
     * Method used to fetch division
     * @param division
     */
    @Override
    public List<Division> fetchAll() {
        System.out.println("----------------Method call to fetchAll division in  DivisionDaoImpl----------------");
        Session session = null;
        List<Division> divisionList = new ArrayList<Division>();
        try {
            session = sessionFactory.openSession();
            divisionList = session.createQuery("FROM Division").list();
            System.out.println("Division Dao...fetch all.......");
        } catch (Exception ex) {
            System.out.println("Class:DivisionDaoImpl \n Method:fetchAll");
            System.out.print("Exception in fetchall in division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAll division in  DivisionDaoImpl----------------");
        return divisionList;
    }

   

    /*fetchData
     * Method used to fetch division  by Id
     * @param division
     */
    @Override
    public Division fetchData(Integer id) {
        System.out.println("----------------Method call to fetch division by id in  DivisionDaoImpl----------------"+id);
        Session session = sessionFactory.openSession(); 
        Division division = new Division();
        try {           
            Query query = session.createQuery("from Division where division_id =:id");
            query.setParameter("id", id);
            System.out.println("Division Dao..........#" + id);
            division = (Division) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:DivisionDaoImpl \n Method:fetchData");
            System.out.println("Exception in fetchData in division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch  division by id in  DivisionDaoImpl----------------");
        return division;
    }

    
    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(Division division) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String checkDuplicateValue(Division division) {
      System.out.println("-----------------Method called to checkDuplicateValue Division in Dao----------------------------");
        String message = "";
        List<Division> divisionList = this.fetchAll();
        Iterator<Division> iterator = divisionList.listIterator();
        while (iterator.hasNext()) {
            Division d = iterator.next();
            if (division.getDivision().trim().equalsIgnoreCase(d.getDivision().trim())
                    &&division.getCircleid()==d.getCircleid()) {
                message = "Duplicate Division Name";
                System.out.println(message);
            }
             else if (division.getDivision().isEmpty() || division.getDivision() == null) {

                message = "Enter Division Name";
             }
        }
        System.out.println("-----------------Method End to checkDuplicateValue Division in Dao----------------------------");
        return message;

    }
    
    }

