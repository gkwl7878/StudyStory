package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.domain.StudyNotice;

////스터디 노티스 dao 정미
@Component
public class StudyNoticeDAO {

	private static StudyNoticeDAO sn_dao;
	private SqlSessionFactory ssf=null;
	
	public StudyNoticeDAO() {
	}//StudyNoticeDAO
	
	public static StudyNoticeDAO getInstance() {
		if(sn_dao==null) {
			sn_dao=new StudyNoticeDAO();
		}//end if
		return sn_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSessionFactory() {
		if(ssf==null) {
		Reader reader=null;
		
		try {
			reader=Resources.getResourceAsReader("kr/co/studystory/dao/mybatis_config.xml");
			SqlSessionFactoryBuilder ssfb= new SqlSessionFactoryBuilder();
			ssf=ssfb.build(reader);
			if(reader !=null) {reader.close();}
		} catch (IOException ie) {
			ie.printStackTrace();
		}//end catch
		
			
		}//end if
		return ssf;
	}//getSessionFactory
	
	//스터디 공지사항 페이지(참여자)
	public List<StudyNotice> selectSnList(String studyNum){
		List<StudyNotice> list=null;
		SqlSession ss=getSessionFactory().openSession();
		list=ss.selectList("studyNoticeList",studyNum);
		ss.close();
		return list;
	}//selectSnList
	
	
	public static void main(String[] args) {//테스트
		StudyNoticeDAO sn_dao= new StudyNoticeDAO();
		sn_dao.selectSnList("s_000041");//카티션 곱 
	}
	
}//class
