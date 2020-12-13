package com.eproc.daoImpl;

import com.eproc.dao.ProductCategoryDao;
import com.eproc.domain.ProductCategory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * This class implements ProductCategoryDAO & DepartmentMaster Interface to
 * manage ProductCategoryDao master at department level Contractor use
 * ProductCategory at the time of Registration
 *
 * @author Vaishali Gupta
 * @since 12 June 2018
 * @version 2.0.0
 */
@Repository
public class ProductCategoryDaoImpl implements ProductCategoryDao<ProductCategory> {

    @Autowired
    SessionFactory sessionFactory;
    ProductCategory productcategory;

    /*
     * add ProductCategory 
     * Method used to add Product Category 
     * @param productCategory
     * @return true
     */
    @Override
    public boolean insertData(ProductCategory productCategory) {
        System.out.println("-----------------Method called to save Product category in Dao----------------------------");
        Session session = null;
       

        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(productCategory);
           txn.commit();

        } catch (Exception ex) {
            System.out.println("Class::ProductCategoryDaoImpl, method::insertData");
            System.out.print("Exception in Save productCategory" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save Product category in Dao----------------------------");
        return true;
    }

    /*
     * remove ProductCategory 
     * Method used to remove Product Category 
     * @param id
     * @return true
     */
    @Override
    public boolean removeData(Integer productCategoryId) {
        System.out.println("-----------------Method called to remove Product category in Dao----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("DELETE FROM ProductCategory WHERE "
                    + "productCategoryId =:productCategoryId");
            query.setParameter("productCategoryId", productCategoryId);
            query.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in removeData By Id of ProductCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to remove Product category in Dao----------------------------");
        return true;
    }

    /*
     * update ProductCategory 
     * Method used to update Product Category 
     * @param productCategory
     * @return true
     */
    @Override
    public boolean updateData(ProductCategory productCategory) {
        System.out.println("-----------------Method called to Update Product category in Dao----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(productCategory);
            txn.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in updateData By Id of productCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method end to Update Product category in Dao----------------------------");
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
        System.out.println("-----------------Method called to fetchAll Product category in Dao----------------------------");
        List<ProductCategory> productCategoryList = new ArrayList<ProductCategory>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            productCategoryList = session.createQuery("FROM ProductCategory").list();
            System.out.println("Size of productCategoryList is " + productCategoryList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll productCategoryList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll Product category in Dao----------------------------");
        return productCategoryList;
    }

    /*
     * checkDuplicateValue ProductCategory 
     * Method used to checkDuplicateValue Product Category 
     * @param productCategory
     * @return message
     */
    @Override
    public String checkDuplicateValue(ProductCategory productCategory) {
        System.out.println("-----------------Method called to checkDuplicateValue Product category in Dao----------------------------");
        String message = "";
        List<ProductCategory> ProductCategoryList = this.fetchAll();
        Iterator<ProductCategory> iterator = ProductCategoryList.listIterator();
        while (iterator.hasNext()) {
            ProductCategory Category = iterator.next();
            if (productCategory.getProductCategoryName().trim().equalsIgnoreCase(Category.getProductCategoryName().trim())) {
                message = "Duplicate productCategory Name";
                System.out.println(message);

            } else if (productCategory.getProductCategoryName().isEmpty() || productCategory.getProductCategoryName() == null) {

                message = "Enter productCategory Name";

            }
        }
        System.out.println("-----------------Method End to checkDuplicateValue Product category in Dao----------------------------");
        return message;

    }

    /*
     * fetch ProductCategory 
     * Method used to fetch Product Category 
     * @param productCategoryId
     * @return productcategory
     */
    @Override
    public ProductCategory fetchData(Integer productCategoryId) {

        System.out.println("-----------------Method Called to fetchdata Product category in Dao----------------------------");

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM ProductCategory WHERE productCategoryId =:productCategoryId");
            query.setParameter("productCategoryId", productCategoryId);
            productcategory = (ProductCategory) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of Productcategory : " + ex.getMessage());
        } finally {
            
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata Product category in Dao----------------------------");
        return productcategory;
    }

}
