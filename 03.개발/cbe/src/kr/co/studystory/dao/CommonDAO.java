package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.studystory.vo.ChangePassVO;
import kr.co.studystory.vo.FindIdVO;
import kr.co.studystory.vo.FindPassVO;
import kr.co.studystory.vo.NewUserVO;

public class CommonDAO {
	
	private static CommonDAO c_dao;
	
	public static CommonDAO getInstance() {
		if (c_dao == null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging(); // 로깅 사용
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
	
	/*public static void main(String[] args) {
		ChangePassVO cpvo = new ChangePassVO();
		cpvo.setId("kim111");
		cpvo.setPass("2zKUjmj8DdNQ3G5OVUNeJsnOKrI=");
		
		System.out.println(CommonDAO.getInstance().updatePass(cpvo));
	}*/
}
