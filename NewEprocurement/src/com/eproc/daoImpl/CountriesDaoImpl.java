package com.eproc.daoImpl;

import com.eproc.dao.CountriesDao;
import com.eproc.domain.Countries;
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
public class CountriesDaoImpl implements CountriesDao<Countries>{
    
    @Autowired
    SessionFactory sessionFactory;
    Countries countries;
   

     /*
     * add countries 
     * Method used to add countries
     * @param countries
     * @return true
     */
    @Override
    public boolean insertData(Countries countries) {
        System.out.println("-----------------Method called to save countries in Dao----------------------------");
        Session session = null;
       try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
           session.saveOrUpdate(countries);
           txn.commit();
                } catch (Exception ex) {
            System.out.print("Exception in Save countries" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save countries in Dao----------------------------");
        return true;
    }


    /*
     * remove countries
     * Method used to remove countries 
     * @param id
     * @return true
     */
    @Override
    public boolean removeData(Integer Id) {
        System.out.println("-----------------Method called to remove countries  in Dao----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("DELETE FROM Countries WHERE "
                    + "country_id =:Id");
            query.setParameter("country_id", Id);
            query.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in removeData By Id of countries : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to remove countries  in Dao----------------------------");
        return true;
    }

    /*
     * update ProductCategory 
     * Method used to update Product Category 
     * @param productCategory
     * @return true
     */
    @Override
   public boolean updateData(Countries countries) {
        System.out.println("-----------------Method called to Update countries in Dao----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(countries);
            txn.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in updateData By Id of countries : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method end to Update countries in Dao----------------------------");
        return true;
    }

    /*
     * fetchAll ProductCategory 
     * Method used to fetchAll Product Category 
     * @param 
     * @return productCategoryList
     */
    @Override
    public List fetchAll() {
        System.out.println("-----------------Method called to fetchAll countries in Dao----------------------------");
        List<Countries> countryList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            countryList = session.createQuery("FROM Countries").list();
            System.out.println(countryList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll Countries " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll countries in Dao----------------------------");
        return countryList;
    }
    /*
     * checkDuplicateValue ProductCategory 
     * Method used to checkDuplicateValue Product Category 
     * @param productCategory
     * @return message
     */
    @Override
    public String checkDuplicateValue(Countries countries) {
        System.out.println("-----------------Method called to checkDuplicateValue countries in Dao----------------------------");
        String message = "";
        List<Countries> CountryList = this.fetchAll();
        Iterator<Countries> iterator = CountryList.listIterator();
        while (iterator.hasNext()) {
            Countries Category = iterator.next();
            if (countries.getCountry_name().trim().equalsIgnoreCase(Category.getCountry_name().trim())) {
                message = "Duplicate Country Name";
                System.out.println(message);

            } else if (countries.getCountry_name().isEmpty() || countries.getCountry_name() == null) {

                message = "Enter Country Name";

            }
        }
        System.out.println("-----------------Method End to checkDuplicateValue countries in Dao----------------------------");
        return message;

    }

    @Override
    public Countries fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Countries fetchbyCountry(Integer country_id) {
    Countries countries = new Countries();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM Countries where country_id =:country_id");
            query.setParameter("country_id", country_id);
            countries = (Countries) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return countries;
    }
    }
   
    

  

    

   

