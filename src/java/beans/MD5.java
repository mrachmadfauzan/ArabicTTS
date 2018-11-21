/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author mr-fao
 */
import java.security.*;
import java.math.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MD5 {

    private String textMD5;

    public String create(String text) {
        MessageDigest m;
        try {
            m = MessageDigest.getInstance("MD5");
            m.update(text.getBytes(), 0, text.length());
            textMD5 = new BigInteger(1, m.digest()).toString(16);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
        }

        return textMD5;
    }
}
