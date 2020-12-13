package com.eproc.daoImpl;

import com.eproc.dao.StatesDao;
import com.eproc.domain.States;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatesDaoImpl implements StatesDao<States> {

    @Autowired
    SessionFactory sessionFactory;
    States state;

    /*insertData
     * Method used to insert division
     * @param division
     */
    @Override
    public boolean insertData(States state) {
        System.out.println("----------------Method call to insert division in  DivisionDaoImpl----------------");
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            session.saveOrUpdate(state);
            txn.commit();
        } catch (Exception ex) {
            System.out.print("Exception in insertData division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to insert division in  DivisionDaoImpl----------------");
        return true;
    }

    /*fetchAll
     * Method used to fetch division
     * @param division
     */
    @Override
    public List fetchAll() {
        System.out.println("----------------Method call to fetchAll division in  DivisionDaoImpl----------------");
        Session session = null;
        List<States> stateList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            stateList = session.createQuery("FROM States").list();

        } catch (Exception ex) {
            System.out.print("Exception in fetchall in statesList " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAll division in  DivisionDaoImpl----------------");
        return stateList;
    }

    
    /*updateData
     * Method used to update states
     * @param states
     */
    @Override
    public boolean updateData(States state) {
        System.out.println("----------------Method call to update data in division in  DivisionDaoImpl----------------");
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            session.saveOrUpdate(state);
        } catch (Exception ex) {
            System.out.print("Exception in updateData in division " + ex.getMessage());
        } finally {
            txn.commit();
            session.close();
        }
        System.out.println("----------------Method end to update data in division in  DivisionDaoImpl----------------");
        return true;
    }

    /*fetchData
     * Method used to fetch division  by Id
     * @param division
     */
    @Override
    public States fetchData(Integer state_id) {
        System.out.println("----------------Method call to fetch division by id in  DivisionDaoImpl----------------");
        Session session = null;

        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM States WHERE state_id =:state_id");
            query.setParameter("state_id", state_id);

            state = (States) query.uniqueResult();
        } catch (Exception ex) {
            System.out.print("Exception in fetchData in division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch  division by id in  DivisionDaoImpl----------------");
        return state;
    }

    @Override
    public boolean removeData(Integer id) {

//        Session session = sessionFactory.openSession();
//        Query query = session.createQuery("DELETE FROM Division WHERE "
//                + "division_id =:division_id");
//        query.setParameter("division_id", division_id);
//        query.executeUpdate();
//        session.close();
        return true;
    }

//    @Override
//    public String checkDuplicateValue(States state) {
//        System.out.println("-----------------Method called to checkDuplicateValue States in Dao----------------------------");
//        String message1 = "";
//        List<States> stateList = this.fetchAll();
//        Iterator<States> iterator = stateList.listIterator();
//        while (iterator.hasNext()) {
//            System.out.println("while checkDuplicateValue");
//            States states = iterator.next();
//            if (state.getState_name().trim().equalsIgnoreCase(states.getState_name().trim())) {
//                System.out.println("if first called");
//                message1 = "Duplicate State Name";
//                System.out.println(message1);
//            } else if (state.getState_name().isEmpty() || state.getState_name() == null) {
//                System.out.println("if second called");
//                message1 = "Enter State Name";
//            }
//        }
//        System.out.println("-----------------Method End to checkDuplicateValue States in Dao----------------------------");
//        return message1;
//    }

    @Override
    public List fetchStates(int country_id) {
        List<States> stateList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM States WHERE country_id =:country_id");
            query.setParameter("country_id", country_id);
            stateList = query.list();
            System.out.println(stateList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll Countries " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll countries in Dao----------------------------");
        return stateList;
    }
    
      @Override
    public List getDuplicateState(States state) {
       Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String statesName = state.getState_name();
        return session.createCriteria(States.class).add(Restrictions.eq("state_name", statesName)).list();
  }
     @Override
    public States fetchById(int state_id) {
        States states = new States();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM States where state_id =:state_id");
            query.setParameter("state_id", state_id);
            states = (States) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return states;
    }

}
