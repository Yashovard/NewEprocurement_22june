/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorDetailsDocsDao;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.ContractorOtherDetailsDocs;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Palak Tiwari
 * ContractorDetailsDocsDaoImpl class
 */

@Repository
public class ContractorDetailsDocsDaoImpl implements ContractorDetailsDocsDao {

    @Autowired
    SessionFactory sessionFactory;
    ContractorOtherDetailsDocs contractorDetailsDocs;

    @Override
    public boolean insertData(Object contractorDetailsDocs) {
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();

            System.out.println("session is opened");
            session.saveOrUpdate(contractorDetailsDocs);
            System.out.println("Save contractor details");
          
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsDocsDaoImpl and Method:insertData");
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
    public Object fetchData(Integer id) {
        ContractorOtherDetailsDocs contractorDocs = new ContractorOtherDetailsDocs();

        Session session = null;
        try {

            session = sessionFactory.openSession();
            System.out.println("fetch data from id" + id);

            Query query = session.createQuery("FROM ContractorOtherDetailsDocs WHERE fileId=:id ");
            query.setParameter("id", id);
            contractorDocs = (ContractorOtherDetailsDocs) query.uniqueResult();
            System.out.println("converted name" + contractorDocs.getDocConvertedName());
        } catch (Exception e) {
            e.printStackTrace();
               System.out.println("Class:ContractorDetailsDocsDaoImpl and Method:fetchData(id)");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
        return contractorDocs;
    }

    @Override
    public boolean updateData(Object e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updatedoc(int id, String fileName, String fileConvertedName, Integer fileid) {
        Session session = null;
        Transaction txn=null;
        
        try {
            System.out.println("The Fileconverted name is:" + fileConvertedName);
            System.out.println("The Contractor id is : " + id);
            String querys = "UPDATE ContractorOtherDetailsDocs cd SET cd.docName=:docName,cd.docConvertedName=:docConvertedName WHERE cd.contOtherId=:contOtherId AND cd.fileId=:fileId";
            System.out.println("query:  " + querys);
            session = sessionFactory.openSession();
            System.out.println("session is opened for update doc");
             txn = session.beginTransaction();
            Query query = session.createQuery(querys);
            query.setParameter("docName", fileName);
            query.setParameter("docConvertedName", fileConvertedName);
            query.setParameter("contOtherId", id);
            query.setParameter("fileId", fileid);
            query.executeUpdate();
          
            System.out.println("Save contractor details docs");

        } catch (Exception e) {
            txn.rollback();
            e.printStackTrace();
           System.out.println("Class:ContractorDetailsDocsDaoImpl and Method:updatedoc");
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
    public boolean deletedoc(int id, String fileConvertedName, Integer fileId) {

        Session session = null;
        Boolean status = false;
     System.out.println("session is open for delete");

        try {
               
            System.out.println("@@@@@@@@@@@@@@@@");
            String filePath = "C:\\Users\\Windows7\\Desktop\\project18\\NewEprocurement\\build\\web\\resources\\docs";
            System.out.println("file path is : " + filePath);
            session = sessionFactory.openSession();
            System.out.println("query");
            Query query = session.createQuery("FROM ContractorOtherDetailsDocs WHERE fileId=:fileId AND contOtherId=:contOtherId");
            query.setParameter("contOtherId", id);
            query.setParameter("fileId", fileId);
            ContractorOtherDetailsDocs contractordoc = (ContractorOtherDetailsDocs) query.uniqueResult();
            System.out.println("@@@@@@@@@@@@@@@@condition");
            if (contractordoc != null) {
             //String docFile = contractordoc.getCont1AttachFileName();
                String fileName = filePath + "/" + fileConvertedName;
                System.out.println("@@@@@@@@@@filenaem" + fileConvertedName);
                File file = new File(fileName);
                if (file.exists()) {
                    status = file.delete();
                    System.out.println("File Deletion status is : " + status);
                }
                System.out.println("file deletion status is:" + status);

//            if (status || !status) {
//               Query query1 = session.createQuery("DELETE FROM ContractorOtherDetailsDocs  WHERE fileId=:fileId AND contOtherId=:contOtherId");
//               query1.setParameter("fileId",fileId);
                 
//               int i = query1.executeUpdate();
//               if (i > 0) {
//                  status = true;
//                  System.out.println("file successfully deleted");
//               } else {
//                  status = false;
//                  System.out.println("In deletion process some error occur");
//               }
//            }
            }

        } catch (Exception e) {
            status = false;
            System.out.println("Class:ContractorDetailsDocsDaoImpl and Method:deletedoc");
            e.printStackTrace();
        } finally {
            if (session != null) {
                System.out.println("delete file session is closed");
                session.close();
            }
        }
        return status;
    }

}
