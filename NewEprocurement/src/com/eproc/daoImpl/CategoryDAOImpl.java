
package com.eproc.daoImpl;

import com.eproc.dao.CategoryDAO;
import com.eproc.domain.TenderCategory;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Naina Jain
 */
@Repository
public class CategoryDAOImpl implements CategoryDAO {

    @Autowired
    SessionFactory sessionFactory;
    TenderCategory addcategory;

    @Override
    public boolean insertData(TenderCategory addcategory) {
        System.out.println("**************KeywordDAOImpl's SaveCategory method run**************");
        System.out.println(addcategory.getTender_category_name() + "  KeywordDAOImpl");
        Session session=null;
        try{
       session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(addcategory);
          tx.commit();
         } catch (Exception ex) {
        System.out.println("Class: CategoryDaoImpl \n Method:insertdata");
            System.out.println("Exception in insertData of TenderCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END insertData of TenderCategory****************************************");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        System.out.println("**************KeywordDAOImpl's deleteCategoryById method run**************");
         Session session=null;
         try{
        session = sessionFactory.openSession();
        TenderCategory addcategory = (TenderCategory) session.load(TenderCategory.class, id);
        session.delete(addcategory);
        Transaction tx = session.beginTransaction();
        tx.commit();
         } catch (Exception ex) {
            System.out.println("Class: CategoryDaoImpl \n Method:removedata");
            System.out.println("Exception in removeData By Id of TenderCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END removeData of TenderCategory****************************************");
        return true;
    }

    @Override
    public TenderCategory fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(TenderCategory e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("**************KeywordDAOImpl's fetchAllCategory method run**************");
         Session session=null;
        List<TenderCategory> categoryList = new ArrayList<TenderCategory>();
        try{
        session = sessionFactory.openSession();
        categoryList = session.createQuery("from TenderCategory").list();
        System.out.println("categoryList:  "+categoryList.size());
        } catch (Exception ex) {
            System.out.println("class:CatagoryDaoImpl \n Method:fetchAll");
            System.out.print("Exception in fetchAll list of TenderCategory " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("*******************END fetchAll method of TenderCategory****************************************");
        return categoryList;
    }


    @Override
    public List getDuplicateCategory(TenderCategory addcategory) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String catName = addcategory.getTender_category_name();
        return session.createCriteria(TenderCategory.class).add(Restrictions.eq("tender_category_name", catName)).list();
    }
}
