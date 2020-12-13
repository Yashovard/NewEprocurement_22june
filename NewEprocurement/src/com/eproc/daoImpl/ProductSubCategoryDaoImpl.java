package com.eproc.daoImpl;

import com.eproc.dao.ProductSubCategoryDao;
import com.eproc.domain.ProductSubCategory;

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
 * This class implements ProductSubCategoryDAO & DepartmentMaster Interface to manage
   ProductSubCategoryDao master at department level Contractor use ProductSubCategory at the time of Registration
 *@author Vaishali Gupta
 * 
 * 
 */
@Repository
public class ProductSubCategoryDaoImpl implements ProductSubCategoryDao<ProductSubCategory> {
    @Autowired
    SessionFactory sessionFactory;
    ProductSubCategory productSubCategory;

    /*
     * add ProductSubCategory 
     * Method used to add Product Sub Category 
     * @param productSubCategory
     * @return true
     */
    @Override
    public boolean insertData(ProductSubCategory productSubCategory) {
        System.out.println("-----------------Method called to save Product Sub Category in Dao----------------------------");
        Session session = null;
    

        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(productSubCategory);
           
            txn.commit();

        } catch (Exception ex) {
            System.out.print("Exception in Save productSubCategory" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save Product Sub Category in Dao----------------------------");
        return true;
    }

    /*
     * remove ProductSubCategory 
     * Method used to remove Product Sub Category 
     * @param id
     * @return true
     */
    @Override
    public boolean removeData(Integer productSubCategoryId) {
        System.out.println("-----------------Method called to remove Product category in Dao----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("DELETE FROM ProductSubCategory WHERE "
                    + "productSubCategoryId =:productSubCategoryId");
            query.setParameter("productSubCategoryId", productSubCategoryId);
            query.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in removeData By Id of ProductSubCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to remove Product Subcategory in Dao----------------------------");
        return true;
    }

    /*
     * update ProductSubCategory 
     * Method used to update Product SubCategory 
     * @param productSubCategory
     * @return true
     */
    @Override
    public boolean updateData(ProductSubCategory productSubCategory) {
        System.out.println("-----------------Method called to Update Product Sub category in Dao----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(productSubCategory);
            txn.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in updateData By Id of productSubCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method end to Update Product Sub category in Dao----------------------------");
        return true;
    }

    /*
     * fetchAll ProductSubCategory 
     * Method used to fetchAll Product Sub Category 
     * @param 
     * @return productCategoryList
     */
    @Override
    public List fetchAll() {
        System.out.println("-----------------Method called to fetchAll Product Sub category in Dao----------------------------");
        List<ProductSubCategory> productSubCategoryList = new ArrayList<ProductSubCategory>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            productSubCategoryList = session.createQuery("FROM ProductSubCategory").list();
            System.out.println("Size of productSubCategoryList is " + productSubCategoryList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll productSubCategoryList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll Product Sub category in Dao----------------------------");
        return productSubCategoryList;
    }

    /*
     * checkDuplicateValue ProductSubCategory 
     * Method used to checkDuplicateValue Product Sub Category 
     * @param productCategory
     * @return message
     */
    @Override
    public String checkDuplicateValue(ProductSubCategory productSubCategory) {
        System.out.println("-----------------Method called to checkDuplicateValue Product Sub category in Dao----------------------------");
        String message = "";
        List<ProductSubCategory> ProductSubCategoryList = this.fetchAll();
        Iterator<ProductSubCategory> iterator = ProductSubCategoryList.listIterator();
        while (iterator.hasNext()) {
            ProductSubCategory SubCategory = iterator.next();
            if (productSubCategory.getProductSubCategoryName().trim().equalsIgnoreCase(SubCategory.getProductSubCategoryName().trim()) 
                    &&productSubCategory.getProductCategoryId()==SubCategory.getProductCategoryId()) {
                message = "Duplicate productSubCategory";
              

            } else if (productSubCategory.getProductSubCategoryName().isEmpty()|| productSubCategory.getProductSubCategoryName() == null) {

                message = "Enter productSubCategory";

            }
        }
        System.out.println("-----------------Method End to checkDuplicateValue Product Sub category in Dao----------------------------");
        return message;

    }

    /*
     * fetch ProductSubCategory 
     * Method used to fetch Product Sub Category 
     * @param productSubCategoryId
     * @return productSubcategory
     */
    @Override
    public ProductSubCategory fetchData(Integer productSubCategoryId) {

        System.out.println("-----------------Method Called to fetchdata Product Sub category in Dao----------------------------");

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM ProductSubCategory WHERE productSubCategoryId =:productSubCategoryId");
            query.setParameter("productSubCategoryId", productSubCategoryId);
            productSubCategory = (ProductSubCategory) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of ProductSubcategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata Product Sub category in Dao----------------------------");
        return productSubCategory;
    }

   

}
