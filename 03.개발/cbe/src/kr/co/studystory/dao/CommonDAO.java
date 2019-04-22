package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.studystory.domain.LoginResult;
import kr.co.studystory.vo.ChangePassVO;
import kr.co.studystory.vo.FindIdVO;
import kr.co.studystory.vo.FindPassVO;
import kr.co.studystory.vo.LoginVO;
import kr.co.studystory.vo.NewUserVO;

public class CommonDAO {
	
	private static CommonDAO c_dao;
	
	public static CommonDAO getInstance() {
		if (c_dao == null) {
			//org.apache.ibatis.logging.LogFactory.useLog4JLogging(); // 로깅 사용
			c_dao = new CommonDAO();
		}
		
		return c_dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory() {
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
		
		System.out.println("======DAO lvo :"+ lvo.getId()+"/"+lvo.getPass());
		
		SqlSession ss = CommonDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.selectOne("login",lvo);
		ss.close();
		System.out.println("=============== cnt :: " + cnt);
		if (cnt == 1) {
			lr.setLogged(true);
			lr.setMsg(null);
		} else {
			lr.setLogged(false);
			lr.setMsg("로그인에 실패했습니다");
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
		
		System.out.println("========= deactive flag : "+flag);
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
	
	public static void main(String[] args) {
		
		System.out.println(CommonDAO.getInstance().selectDeactivation("kim111"));
	}
}
