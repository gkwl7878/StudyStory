package kr.co.studystory.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.CommonDAO;
import kr.co.studystory.domain.LoginResult;
import kr.co.studystory.domain.PrevProfile;
import kr.co.studystory.domain.PrevUserInfo;
import kr.co.studystory.vo.ChangePassVO;
import kr.co.studystory.vo.FindIdVO;
import kr.co.studystory.vo.FindPassVO;
import kr.co.studystory.vo.LeaveVO;
import kr.co.studystory.vo.LoginVO;
import kr.co.studystory.vo.ModifiedPassVO;
import kr.co.studystory.vo.ModifiedUserInfoVO;
import kr.co.studystory.vo.NewUserVO;
import kr.co.studystory.vo.ProfileVO;

@Component
public class CommonService {
	
	@Autowired
	private CommonDAO c_dao;
	
	public LoginResult login(LoginVO lvo) {
		LoginResult lr = c_dao.selectLogin(lvo);
		if(!c_dao.selectDeactivation(lvo.getId())) {
			lr.setLogged(false);
			lr.setMsg("탈퇴한 유저입니다");
		}
		return lr;
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
	
	/**
	 * 회원가입 후 nick얻기
	 * by 영근 190421
	 */
	public String getNick(String id) {
		String nick = "";
		nick = c_dao.selectNick(id);
		return nick;
	}
	
	/**
	 * 아이디 찾기
	 * by 영근 190421
	 */
	public String findId(FindIdVO fivo) {
		String id = "";
		id = c_dao.selectId(fivo);
		return id;
	}
	
	/**
	 * 비밀번호 찾기(검증)
	 * by 영근 190421
	 */
	public boolean findPass(FindPassVO fpvo) {
		boolean flag = false;
		flag = c_dao.selectAnswer(fpvo);
		return flag;
	}
	
	/**
	 * 새로운 비밀번호 설정
	 * by 영근 190421
	 */
	public boolean setNewPass(ChangePassVO cpvo) {
		boolean flag = false;
		flag = c_dao.updatePass(cpvo);
		return flag;
	}
	
	/**
	 * 프로필 수정 전
	 * 이전 프로필 가져오기
	 * by 영근 190421
	 */
	public PrevProfile getProfile(String id) {
		PrevProfile pv = null;
		pv = c_dao.selectProfile(id);
		return pv;
	}
	
	/**
	 * 변경 닉네임 중복체크,
	 * true면 중복
	 * by 영근 190423
	 */
	public boolean checkDupNick(String nick) {
		boolean flag = false;
		
		if (c_dao.selectDupNick(nick)) {
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * 새로운 이미지 업로드 메서드
	 * by 영근 190423
	 */
	public void uploadNewImg(HttpServletRequest request) {
		
	}
	
	/**
	 * 새로운 입력정보로 프로필정보 변경
	 * by 영근 190423
	 */
	public boolean setProfile(ProfileVO pv) {
		boolean flag = false;
		
		if (c_dao.updateProfile(pv)) {
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * 회원정보 수정 전 기존 회원정보 조회
	 * by 영근 190422 
	 */
	public PrevUserInfo selectMyInfo(String id) {
		PrevUserInfo pui = null;
		pui = c_dao.selectPrevUserInfo(id);
		return pui;
	}
	
	/**
	 * 회원정보 수정
	 * by 영근 190422
	 */
	public boolean changeUserInfo(ModifiedUserInfoVO muivo) {
		boolean flag = false;
		if(c_dao.updateUserInfo(muivo)) {
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 비밀번호 변경
	 * by 영근 190422
	 */
	public boolean changePass(ModifiedPassVO mpvo) {
		boolean flag = false;
		if (c_dao.updateNewPass(mpvo)) {
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 회원 탈퇴 처리
	 * by 영근 190422
	 */
	public boolean setDeactivation(LeaveVO lvo) {
		boolean flag = false;
		
		if (c_dao.updateDeactivation(lvo)) {
			c_dao.deleteStudyMember(lvo.getId());
			flag = true;
		}
		
		return flag;
	}
}
