package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	
	/*public static void main(String[] args) {
		NewUserVO nuvo = new NewUserVO("ooo123123", "영근오", "호롤롤로", "12345", "지구어딘가", "지구어딘가2", "010-2222-3333", "oooooo@ooooo.com", "1", "노래해");
		System.out.println(CommonDAO.getInstance().insertSignUp(nuvo));
	}*/
}
