package kr.co.studystory.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ShaUtil {
    
    public static String shaEncoding(String plainText) {
          String cipherText = "";
          
          if (plainText != null || !"".equals(plainText)) {
                try {
                      // 1. 알고리즘을 사용할 수 있는 개체를 얻는다.
                      MessageDigest md =  MessageDigest.getInstance("SHA-256");
                      
                      // 2. 평문(Plain Text)를 암호문(Cipher Text)로  변환
                      md.update(plainText.getBytes());
                      
                      // 3. 변환된 암호문 (Cipher Text) 얻기
                      cipherText = new String(md.digest());
                      
                } catch (NoSuchAlgorithmException e) {
                      e.printStackTrace();
                }
          }
          
          return cipherText;
    }
    
    public static void main(String[] args) {
		System.out.println(shaEncoding("tjdwn12Q"));
    	
	}
}