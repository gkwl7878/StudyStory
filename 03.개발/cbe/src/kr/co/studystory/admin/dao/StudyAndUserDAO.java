package kr.co.studystory.admin.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.domain.DetailNewStudyInfo;
import kr.co.studystory.admin.domain.NewStudyInfo;
import kr.co.studystory.admin.vo.AcceptVO;
import kr.co.studystory.admin.vo.NsBoardVO;

@Component
public class StudyAndUserDAO {
	private static StudyAndUserDAO sau_dao;
	private SqlSessionFactory ssf=null;
	
	public static StudyAndUserDAO getInstance() {
		if(sau_dao==null) {
			sau_dao=new StudyAndUserDAO();
		}//end if
		return sau_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSessionFactory() {
		if(ssf==null) {
			
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
	
	public List<NewStudyInfo> selectNewStudy(NsBoardVO nb_vo){
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<NewStudyInfo> list =ss.selectList("newStudyList",nb_vo);
		ss.close();
		return list;
	}
	
	public DetailNewStudyInfo selectDetailNewStudy(String sNum) {
		DetailNewStudyInfo dnsi=null;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		dnsi= ss.selectOne("nsDetail",sNum);
		ss.close();
		return dnsi;
	}
	
	public boolean updeteAccept(AcceptVO a_vo) {
		boolean acceptFlag= false;
		int cnt=0;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		cnt =ss.update("updateNsAccept",a_vo);
		if(cnt>0) {
			acceptFlag=true;
			ss.commit();
		}
		ss.close();
		return acceptFlag;
	}
	
	public static void main(String[] args) {
		StudyAndUserDAO sau_dao= new StudyAndUserDAO();
		AcceptVO a_vo= new AcceptVO();
		a_vo.setsNum("s_000021");
		System.out.println(sau_dao.updeteAccept(a_vo));
	}
	
}
