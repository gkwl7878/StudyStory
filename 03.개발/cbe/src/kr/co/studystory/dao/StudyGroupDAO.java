package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.studystory.vo.NewStudyVO;


public class StudyGroupDAO {
	private static StudyGroupDAO sg_dao;
	private SqlSessionFactory ssf=null;
	
	public StudyGroupDAO() {

	}
	
	public static StudyGroupDAO getInstance() {
		if(sg_dao==null) {
			sg_dao=new StudyGroupDAO();
		}//end if
		return sg_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSqlSessionFactory() {
		if(ssf==null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();
			
			Reader reader=null;
			
			try {
				reader=Resources.getResourceAsReader("kr/co/studystory/dao/mybatis_config.xml");
				SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
				ssf=ssfb.build(reader);
				if(reader!=null) {reader.close();}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}//end if
		return ssf;
	}//getSqlSessionFactory

	public void insertNewStudy(NewStudyVO ns_vo) {
		SqlSession ss=getSqlSessionFactory().openSession();
		int cnt=ss.insert("insertStudy", ns_vo);
		ss.commit();
		System.out.println("추가 작업"+cnt);
	}//insertNewStudy
	
}//class
