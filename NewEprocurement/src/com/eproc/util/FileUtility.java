/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import java.util.Date;
import java.util.Random;

/**
 *
 * @author Gaurav Dubey
 */
public class FileUtility {
    
     public static String generateRandomNo() {
        Date date = new Date();
        System.out.println("date is:"+date);
        int mili = date.getSeconds();
        
        
        String str = "0123456789";
        StringBuilder sb = new StringBuilder();
         System.out.println("-------Generate Random number method is run-------------");
        for (int i = 0; i < 4; i++) {
         sb.append(new Random().nextInt(str.length()));
         }
        
        System.out.println("random no : " + sb.toString() + mili);
        System.out.println("-------------Generate Random number method is closed---------");
        return sb.toString();
    }
     
     /**
      * Method used to remove extension 
      * @param fileName
      * @return fileName
      */    
      public static String removeExtension(String fileName) {
          System.out.println("----------Remove extension method is run-------------");
        if (fileName.indexOf(".") > 0) {
            return fileName.substring(0, fileName.lastIndexOf("."));
        } else {
            return fileName;
        }
    } 
      /**
       * @author Palak Tiwari
       * @return random number concatenate with milliseconds
       */
     public static String generateRandomNoMili() {
        Date date = new Date();
        System.out.println("date is:"+date);
        int mili = date.getSeconds();
        String randomNo=null;
        
        String str = "0123456789";
        StringBuilder sb = new StringBuilder();
         System.out.println("-------Generate Random number method is run-------------");
        for (int i = 0; i < 4; i++) {
         sb.append(new Random().nextInt(str.length()));
         }
        randomNo=sb.toString() + mili;
        
        System.out.println("random no : " +randomNo );
        System.out.println("-------------Generate Random number method is closed---------");
        return randomNo;
    }  
}
