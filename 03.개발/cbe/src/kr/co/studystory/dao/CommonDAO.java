package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

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
public class CommonDAO {
	
	private static CommonDAO c_dao;
	
	public static CommonDAO getInstance() {
		if (c_dao == null) {
			//org.apache.ibatis.logging.LogFactory.useLog4JLogging(); // 로깅 사용
			c_dao = new CommonDAO();
		}
		
		return c_dao;
	}
	
	public synchronized SqlSessionFactory getSqlSessionFactory() {
		SqlSessionFactory ssf = null;
		
		try {
			Reader r = Resources.getResourceAsReader("kr/co/studystory/dao/mybatis_config.xml");
			SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
			ssf = ssfb.build(r);
			if (r != null) {
				r.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ssf;
	}
	
	/**
	 * 로그인
	 * by 영근 190422
	 */
	public LoginResult selectLogin(LoginVO lvo) {
		LoginResult lr = new LoginResult();
		
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.selectOne("login",lvo);
		ss.close();
		if (cnt == 1) {
			lr.setLogged(true);
			lr.setMsg(null);
		} else {
			lr.setLogged(false);
			lr.setMsg("로그인에 실패했습니다. 입력 정보를 다시 확인해주세요");
		}
		
		return lr;
	}
	
	/**
	 * 탈퇴유저인지 조회
	 * false면 탈퇴유저
	 * true면 활동중인 유저
	 * by 영근 190422
	 */
	public boolean selectDeactivation(String id) {
		boolean flag = false; 
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		String selectResult = ss.selectOne("checkDeactivation",id);
		ss.close();
		if (selectResult == null) { // null이면 활동중인 유저 = true
			flag = true;
		}
		return flag;
	}
	
	
	/**
	 * 아이디 중복체크
	 * by 영근 190418
	 */
	public boolean selectDupId(String id) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.selectOne("checkDupId",id);
		ss.close();
		
		if (cnt == 1) { // 아이디가 존재하면 true
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * 이메일 중복체크
	 * by 영근 190418
	 */
	public boolean selectDupEmail(String email) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.selectOne("checkDupEmail",email);
		ss.close();
		
		if (cnt == 1) { // 이메일이 존재하면 true
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * 회원가입
	 * by 영근 190418
	 */
	public boolean insertSignUp(NewUserVO nuvo) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.insert("insertNewUser",nuvo);
		
		if (cnt == 1) { // 회원가입이 수행되면 true
			flag = true; 
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 회원 가입 후 nick얻기
	 * by 영근 190421
	 */
	public String selectNick(String id) {
		String nick = "";
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		nick = ss.selectOne("selectNick", id);
		ss.close();
		
		return nick;
	}
	
	/**
	 * 아이디 찾기
	 * by 영근 190421
	 */
	public String selectId(FindIdVO fivo) {
		String id = "";
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		id = ss.selectOne("selectId", fivo);
		ss.close();
		
		return id;
	}
	
	/**
	 * 비밀번호찾기 검증
	 * by 영근 190422
	 */
	public boolean selectAnswer(FindPassVO fpvo) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.selectOne("selectPass", fpvo);
		ss.close();
		if (cnt == 1) {
			flag = true;
		}
		
		return flag; 
	}
	
	/**
	 * 새 비밀번호 설정
	 * by 영근 190422 
	 */
	public boolean updatePass(ChangePassVO cpvo) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.update("updatePass", cpvo);
		if (cnt == 1) {
			ss.commit();
			flag = true;
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 회원정보 수정 전 기존정보 조회
	 * by 영근 190422
	 */
	public PrevUserInfo selectPrevUserInfo(String id) {
		PrevUserInfo pui = null;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		pui = ss.selectOne("selectPrevUserInfo", id);
		ss.close();
		
		return pui;
	}
	
	/**
	 * 회원정보 수정
	 * by 영근 190422
	 */
	public boolean updateUserInfo(ModifiedUserInfoVO muivo) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.update("updateUserInfo",muivo);
		
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();

		return flag;
	}
	
	/**
	 * 비밀번호 변경
	 * by 영근 190422
	 */
	public boolean updateNewPass(ModifiedPassVO mpvo) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.update("updateNewPass", mpvo);
		
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 회원탈퇴 처리
	 * by 영근 190422
	 */
	public boolean updateDeactivation(LeaveVO lvo) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.update("updateDeactive", lvo);
		
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 회원탈퇴 시 가입한 스터디, 신청한 스터디, 좋아하는 스터디 테이블에서 유저정보 삭제
	 * by 영근 190422
	 */
	public void deleteStudyMember(String id) {
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		ss.delete("deleteMember", id);
		ss.delete("deleteJoin", id);
		ss.delete("deleteFav", id);
		
		ss.commit();
		ss.close();
	}
	
	/**
	 * 이전 프로필 조회
	 * by 영근 190423
	 */
	public PrevProfile selectProfile(String id) {
		PrevProfile pp = null;
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		pp = ss.selectOne("selectPrevProfile", id);
		ss.close();
		
		return pp;
	}
	
	/**
	 * 프로필 닉네임 수정 시 중복닉 조회
	 * true면 중복
	 * by 영근 190423
	 */
	public boolean selectDupNick(String nick) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.selectOne("selectDupNick",nick);
		if (cnt == 1) {
			flag = true; // true면 중복
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 유저 프로필 변경
	 * by 영근 190423
	 */
	public boolean updateProfile(ProfileVO pv) {
		boolean flag = false;
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.update("updateProfile", pv);
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/*public static void main(String[] args) {
		
		ProfileVO pv = new ProfileVO();
		pv.setId("young333");
		pv.setNick("오룡룡");
		pv.setIntroduce("반갑습니다 낯선이여");
		pv.setImg("무슨.jpg");
		
		System.out.println(CommonDAO.getInstance().updateProfile(pv));
		
	}*/
}
