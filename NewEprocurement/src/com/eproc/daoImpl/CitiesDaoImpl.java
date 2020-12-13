package com.eproc.daoImpl;

import com.eproc.dao.CitiesDao;
import com.eproc.domain.Cities;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CitiesDaoImpl implements CitiesDao<Cities> {

    @Autowired
    SessionFactory sessionFactory;
    Cities cities;

    @Override
    public boolean insertData(Cities Cities) {
        System.out.println("----------------Method call to insertData in  CitiesDaoImpl----------------");
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            session.saveOrUpdate(Cities);

        } catch (Exception ex) {
            System.out.print("Exception in insertData division " + ex.getMessage());
        } finally {
            txn.commit();
            session.close();
        }
        System.out.println("----------------Method end to insert division in  CitiesDaoImpl----------------");
        return false;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cities fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(Cities Cities) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("----------------Method call to fetchAll division in  DivisionDaoImpl----------------");
        Session session = null;
        List<Cities> citiesList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            citiesList = session.createQuery("FROM Cities").list();

        } catch (Exception ex) {
            System.out.print("Exception in fetchall in statesList " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAll division in  DivisionDaoImpl----------------");
        return citiesList;
    }

    @Override
    public List fetchCitiesByState(int state_id) {
        System.out.println("----------------Method call to fetch division by id in  DivisionDaoImpl----------------");
        Session session = null;
        List<Cities> stateList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Cities WHERE state_id =:state_id");
             query.setParameter("state_id", state_id);
           stateList = query.list();
            System.out.println("###################"+stateList);
        } catch (Exception ex) {
            System.out.print("Exception in fetchData in division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch  division by id in  DivisionDaoImpl----------------");
        return stateList;
    }

    @Override
    public List fetchCity(int state_id) {
        List<Cities> cityList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Cities WHERE state_id =:state_id");
            query.setParameter("state_id", state_id);
            cityList = query.list();
            System.out.println(cityList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll Countries " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll countries in Dao----------------------------");
        return cityList;
    }
   
     @Override
    public Cities fetchByIdEdit(int city_id) {
        Cities cities = new Cities();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM Cities where city_id =:city_id");
            query.setParameter("city_id", city_id);
            cities = (Cities) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return cities;
    }
    
    @Override
    public List getDuplicateCities(Cities cities) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String citisName = cities.getCity_name();
        return session.createCriteria(Cities.class).add(Restrictions.eq("city_name", citisName)).list();
    }
    

}
