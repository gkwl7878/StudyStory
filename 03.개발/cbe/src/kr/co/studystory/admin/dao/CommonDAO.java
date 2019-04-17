package kr.co.studystory.admin.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.studystory.admin.vo.LoginVO;


public class CommonDAO {
	private static CommonDAO c_dao;
	private SqlSessionFactory ssf=null;
	
	private CommonDAO() {
	}//CommonDAO
	
	public static CommonDAO getInstance() {
		if(c_dao==null) {
			c_dao=new CommonDAO();
		}//end if
		return c_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSessionFactory() {
		if(ssf==null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();
			
			Reader reader = null;
			try {
				//1.설정용 xml 로딩
				reader = Resources.getResourceAsReader("kr/co/studystory/admin/dao/mybatis_config.xml");
				//2. MyBatis Framework생성
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				//3. DB와 연동된 객체 받기
				ssf=ssfb.build(reader);
				if(reader!=null) {
					reader.close();
				}
				
			} catch (IOException ie) {
				ie.printStackTrace();
			}//end catch
		}
		return ssf;
	}//getSessionFactory
	
	public boolean selectLogin(LoginVO l_vo) {
		boolean login_flag =false;
		int validCnt=0;
		SqlSession ss= CommonDAO.getInstance().getSessionFactory().openSession();
		validCnt= ss.selectOne("loginValid",l_vo);
		if(validCnt>0) {
			login_flag=true;
		}
		return login_flag;
	}
	
	public static void main(String[] args) {
		CommonDAO c_dao = new CommonDAO();
		LoginVO l_vo= new LoginVO("admin", "1q2w3");
		System.out.println("dao=="+c_dao.selectLogin(l_vo));
	}
	
	
	
}
