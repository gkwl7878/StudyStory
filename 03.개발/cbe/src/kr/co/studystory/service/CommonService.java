package kr.co.studystory.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONObject;

import kr.co.studystory.dao.CommonDAO;
import kr.co.studystory.vo.NewUserVO;

public class CommonService {
	
	private CommonDAO c_dao;
	
	public CommonService() {
		c_dao = CommonDAO.getInstance();
	}
	
	/**
	 * 아이디 중복확인
	 * by 영근 190418
	 */
	public JSONObject checkDupId(String id) {
		JSONObject json = new JSONObject();
		json.put("isDup", c_dao.selectDupId(id));
		return json;
	}
	
	/**
	 * 이메일 중복확인
	 * by 영근 190418
	 */
	public JSONObject checkDupEmail(String email) {
		JSONObject json = new JSONObject();
		json.put("isDup", c_dao.selectDupEmail(email));
		return json;
	}
	
	/**
	 * 회원가입
	 * by 영근 190418
	 */
	public boolean signUp(NewUserVO nuvo) {
		boolean signedUp = false;
		
		String plainPass = nuvo.getPass();
		nuvo.setPass(shaEncoding(plainPass));
		signedUp = c_dao.insertSignUp(nuvo);
		
		return signedUp;
	}
	
	/**
	 * 비밀번호 암호화 처리
	 * by 영근 190418
	 */
	public static String shaEncoding(String plainText) {
		String cipherText = "";
		Base64 base64 = new Base64();
		
		if (plainText != null || !"".equals(plainText)) {
			try {
				// 1. 알고리즘을 사용할 수 있는 개체를 얻는다.
				MessageDigest md = MessageDigest.getInstance("SHA-1");
				// 2. 평문(Plain Text)를 암호문(Cipher Text)로 변환 
				md.update(plainText.getBytes());
				// 3. 변환된 암호문 (Cipher Text) 얻기
				cipherText = new String(base64.encode(md.digest()));
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		return cipherText;
	}

}
