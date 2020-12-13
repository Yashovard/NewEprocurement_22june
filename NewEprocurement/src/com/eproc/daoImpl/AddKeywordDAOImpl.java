
package com.eproc.daoImpl;

import com.eproc.dao.AddKeywordDAO;
import com.eproc.domain.AddKeywords;
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
 *
 * @author Naina Jain
 */
@Repository
public class AddKeywordDAOImpl implements AddKeywordDAO {

    @Autowired
    SessionFactory sessionFactory;
    AddKeywords addKeywords;

    @Override
    public boolean insertData(AddKeywords addkeywords) {
        System.out.println("**************KeywordDAOImpl's saveKeywords method run**************");
        System.out.println(addkeywords.getTenderKeyWordsName() + "  KeywordDAOImpl");
      Session session=null;
        try{
        session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(addkeywords);
        tx.commit();
        } catch (Exception ex) {
            System.out.println("Class: AddKeywordDaoImpl \n Method:insertdata");
            System.out.print("Exception in insertData of Addkeywords " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("................End insertData method of Addkeyword..............");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        System.out.println("**************KeywordDAOImpl's deleteKeywordsById method run**************");
        Session session=null;
        try{
       session = sessionFactory.openSession();
        AddKeywords addkeyword = (AddKeywords) session.load(AddKeywords.class, id);
        session.delete(addkeyword);
        Transaction tx = session.beginTransaction();
        tx.commit();
        }catch( Exception ex){
            System.out.println("Class: AddKeywordDaoImpl \n Method:removedata");
            System.out.println("Exception in removeData method of Addkeyword"+ex.getMessage());
        }
        finally{
            if(session != null){
                session.close();
            }
        }
        
        System.out.println("*******************END****************************************");
        return true;
    }

    @Override
    public AddKeywords fetchData(Integer id) {
        System.out.println("**************KeywordDAOImpl's fetchKeywordsById method run**************");
        Session session=null;
        AddKeywords addkeyword = new AddKeywords();
        try{
         session = sessionFactory.openSession();
        Query query = session.createQuery("from AddKeywords where tenderKeyWordsId=:id");
        query.setParameter("id", id);
        addkeyword = (AddKeywords) query.uniqueResult();
        }catch (Exception ex) {
            System.out.println("Class: AddKeywordDaoImpl \n Method:fetchdata");
            System.out.print("Exception in fetchData method of Addkeywords " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchData method of Addkeywords****************************************");
        return addkeyword;

    }

    @Override
    public boolean updateData(AddKeywords addkeywords) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("**************KeywordDAOImpl's fetchAllKeywords method run**************");
        Session session=null;
        List<AddKeywords> addKeywordList = new ArrayList<AddKeywords>();
        try{
       session = sessionFactory.openSession();
        addKeywordList = session.createQuery("from AddKeywords").list();
        
        }catch (Exception ex) {
            System.out.println("Class: AddKeywordDaoImpl \n Method:fetchdata");
            System.out.print("Exception in fetchAll method of Addkeywords " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchAll method of Addkeywords****************************************");
        return addKeywordList;
        }

     @Override
    public String getDuplicateAddKeyword(AddKeywords addkeywords) {
       Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String msg = "Not Duplicate Value";
        int tender_category_id = addkeywords.getTender_category_id();
        int areaofwork_id = addkeywords.getAreaofwork_id();
        String tenderKeyWordsName = addkeywords.getTenderKeyWordsName();
         System.out.println("tenderKeyWordsName::"+tenderKeyWordsName);
            String SQL_QUERY = "from AddKeywords where tender_category_id =:tender_category_id and areaofwork_id =:areaofwork_id";
            Query query = session.createQuery(SQL_QUERY);
            query.setParameter("tender_category_id", tender_category_id);
            query.setParameter("areaofwork_id", areaofwork_id);
           List<AddKeywords> keywordListduplicate = query.list();
           Iterator<AddKeywords> iterator = keywordListduplicate.iterator();
        while (iterator.hasNext()) {
            AddKeywords ak = iterator.next();
            if (tenderKeyWordsName.equalsIgnoreCase(ak.getTenderKeyWordsName())) {
                 msg = "Keyword Already Exist";
            }
        }
        return msg;
    }


}
