/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 *
 * @author OSMO12
 */
@Service
public class AesEncrDec {

    private SecretKey secretKey;
    private String cipherText;
    private List encrList = new ArrayList();

    public List getEncrList() {
        return encrList;
    }

    public void setEncrList(List encrList) {
        this.encrList = encrList;
    }

    @SuppressWarnings({"unchecked", "unchecked"})
    public String encrypt(String pass) {
        String EnPassword = null;
        String plainData = pass, decryptedText;
        try {
            decryptedText = null;
            pass = null;
            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
            keyGen.init(128);
            secretKey = keyGen.generateKey();
            List encrData = new ArrayList();
            final Cipher aesCipher = Cipher.getInstance("AES");
            aesCipher.init(Cipher.ENCRYPT_MODE, secretKey);
            byte[] byteDataToEncrypt = plainData.getBytes();
            byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt);
            cipherText = new BASE64Encoder().encode(byteCipherText);
            aesCipher.init(Cipher.DECRYPT_MODE, secretKey, aesCipher.getParameters());
            byte[] byteDecryptedText = aesCipher.doFinal(byteCipherText);
            decryptedText = new String(byteDecryptedText);
            encrData.add(cipherText);
            encrData.add(secretKey);
            setEncrList(encrData);
            System.out.println("\n Plain Data : " + plainData + " \n Cipher Data : " + cipherText + " \n Decrypted Data : " + decryptedText);
        } catch (Exception e) {
            System.out.println("\n Exception in AesEncrDec.java  ");
        }
        return Collections.unmodifiableList(encrList).toString();
    }

    public String decrypt(String pass, SecretKey key) {
        String EnPassword = null;
        String plainData = pass, cipherText = null, decryptedText = null;

        try {
            final Cipher aesCipher = Cipher.getInstance("AES");
            byte[] abc = new BASE64Decoder().decodeBuffer(pass);
            aesCipher.init(Cipher.DECRYPT_MODE, key, aesCipher.getParameters());

            byte[] byteDecryptedText = aesCipher.doFinal(abc);

            decryptedText = new String(byteDecryptedText);
            System.out.println("\n AesEncrDec ........called ");
        } catch (Exception e) {
            System.out.println("\n exception at password decrypt method ....... ");
        }
        return decryptedText;
    }
}
