/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Naina Jain
 */

@Repository
public class CommonUtil {

    @Autowired
    SessionFactory sessionFactory;
    
    //TO CHECK LOGIN USER IS VALID OR NOT
    public String checkLogin(String EmailId) {
        Session session = null;
        String flag = null;
        List list = null;
        String SQL_QUERY = "";
        try {
            session = sessionFactory.openSession();
            SQL_QUERY = "from Department where EmailId =:EmailId";
            Query query = session.createQuery(SQL_QUERY);
            query.setParameter("EmailId", EmailId);
            list = query.list();
            if ((list != null) && (list.size() > 0)) {
                flag = "DepartmentUser";
            } else {
                SQL_QUERY = "from Contractor where EmailId =:EmailId";
                Query query1 = session.createQuery(SQL_QUERY);
                query1.setParameter("EmailId", EmailId);
                list = query1.list();
                if ((list != null) && (list.size() > 0)) {
                    flag = "Contractor";
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return flag;
    }
    
    // TO ENCCRYPT PASSWORD
    public String encrypt(String strClearText, String strKey) {
        String strData = "";
        try {
            SecretKeySpec skeyspec = new SecretKeySpec(strKey.getBytes(), "Blowfish");
            Cipher cipher = Cipher.getInstance("Blowfish");
            cipher.init(Cipher.ENCRYPT_MODE, skeyspec);
            byte[] encrypted = cipher.doFinal(strClearText.getBytes());
            strData = new String(encrypted);
        } catch (Exception e) {
            e.getMessage();
        }
        return strData;
    }
// TO DECRYPT PASSWORD

    public String decrypt(String strEncrypted, String strKey) {
        String strData = "";
        try {
            SecretKeySpec skeyspec = new SecretKeySpec(strKey.getBytes(), "Blowfish");
            Cipher cipher = Cipher.getInstance("Blowfish");
            cipher.init(Cipher.DECRYPT_MODE, skeyspec);
            byte[] decrypted = cipher.doFinal(strEncrypted.getBytes());
            strData = new String(decrypted);
        } catch (Exception e) {
            e.getMessage();
        }
        return strData;
    }

     public static String generatePassword() {
//        String chars = "abcdefghijklmnopqrstuvwxyz"
//                     + "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//                     + "0123456789!@%$%&^?|~'\"#+="
//                     + "\\*/.,:;[]()-_<>";
               String chars = "0123456789";

        final int PW_LENGTH = 4;
        Random rnd = new SecureRandom();
        StringBuilder oTP = new StringBuilder();
        for (int i = 0; i < PW_LENGTH; i++)
            oTP.append(chars.charAt(rnd.nextInt(chars.length())));
        //System.out.println("genrated password is"+oTP.toString());
        return oTP.toString();
    }

}
