package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.domain.AppliedStudy;
import kr.co.studystory.domain.MyStudy;
import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.vo.ConditionVO;
import kr.co.studystory.vo.LeaveAlarmVO;
import kr.co.studystory.vo.LeaveStudyVO;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;

@Component
public class StudyGroupDAO {
	private static StudyGroupDAO sg_dao;
	private SqlSessionFactory ssf=null;
	
	private StudyGroupDAO() {

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

	/**
	 * 스터디명 중복체크
	 */
	public boolean selectDupStudyName(String study_name) {
		boolean flag=false;
		
		SqlSession ss=StudyGroupDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt = ss.selectOne("selectDupStudyName", study_name);
		ss.close();
		
		if(cnt==1) {
			flag=true;
		}
		
		return flag;
	}//selectDupStudyName
	
	public boolean insertNewStudy(NewStudyVO ns_vo) {
		boolean flag=false;
		
		SqlSession ss=StudyGroupDAO.getInstance().getSqlSessionFactory().openSession();
		int cnt=ss.insert("insertStudy", ns_vo);
		if(cnt==1) {
			flag=true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}//insertNewStudy
	
	//내 스터디 수정하기 
	public PrevStudyInfo selectPrevStudyInfo(String sNum) {
		PrevStudyInfo psi=null;
		
		SqlSession ss=StudyGroupDAO.getInstance().getSqlSessionFactory().openSession();
		psi=ss.selectOne("selectPrevStudyInfo", sNum);
		ss.close();
		
		return psi;
	}//selectPrevStudyInfo
	
	public boolean updateStudy(ModifiedStudyVO ms_vo) {
		boolean flag=false;
		
		SqlSession ss=getSqlSessionFactory().openSession();
		
		int cnt=ss.update("updateStudy",ms_vo);
		if(cnt==1) {
			flag=true;
			ss.commit();
		}
		ss.close();
		return flag;
	}
	
	//스터디 탈퇴
	public String selectLeaderId(String id) {
		return "";
	}
	
	public boolean insertLeaveAlarm(LeaveAlarmVO la_vo) {
		boolean flag=false;
		
		SqlSession ss=StudyGroupDAO.getInstance().getSqlSessionFactory().openSession();
		
		int cnt=ss.update("insertLeaveAlarm",la_vo);
		if(cnt==1) {
			flag=true;
			ss.commit();
		}
		ss.close();
		return flag;
		
	}//insertLeaveAlarm
	
	public boolean deleteMember(LeaveStudyVO ls_vo) {
		boolean flag=false;
		
		SqlSession ss=StudyGroupDAO.getInstance().getSqlSessionFactory().openSession();
		
		int cnt=ss.update("deleteStudy",ls_vo);
		if(cnt==1) {
			flag=true;
			ss.commit();
		}
		ss.close();
		return flag;
	}
}//class

















