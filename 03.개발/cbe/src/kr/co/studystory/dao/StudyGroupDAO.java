package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.dao.StudyAndUserDAO;
import kr.co.studystory.domain.AppliedStudy;
import kr.co.studystory.domain.MyStudy;
import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.vo.CloseAlarmVO;
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

	
	//스터디 개설하기
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
	
/*	//전에갖고있는이미지 삭제
	public String selectPreImg(String sNum) {
		String preImg="";
		
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		preImg= ss.selectOne("selectPreImage",sNum);
		return preImg;
	}*/
	
	//스터디 탈퇴
	public String selectLeaderId(String s_num) {
		String id="";
		
		SqlSession ss=sg_dao.getSqlSessionFactory().openSession();
		id= ss.selectOne("selectLeaderId",s_num);
		
		return id;
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
	
	public boolean deleteMember(String id) {
		boolean flag=false;
		
		SqlSession ss=StudyGroupDAO.getInstance().getSqlSessionFactory().openSession();
		
		int cnt=ss.delete("deleteStudyMember",id);
		if(cnt==1) {
			flag=true;
			ss.commit();
		}
		ss.close();
		return flag;
	}//deleteMember
	
	
	//스터디 활동 종료
	
	public List<String> selectMemberId(String s_num) {
		List<String> list=null;
		
		SqlSession ss=sg_dao.getSqlSessionFactory().openSession();
		list=ss.selectList("selectMemberId", s_num);
		ss.close();
		
		return list;
	}//selectMemberId
	
	public boolean insertCloseAlarm(CloseAlarmVO ca_vo) {
		boolean flag=false;
		SqlSession ss=sg_dao.getSqlSessionFactory().openSession();
		
		int cnt=ss.insert("insertCloseAlarm", ca_vo);
		if(cnt==1) {
			flag=true;
			ss.commit();
		}
		ss.close();
		return flag;
	}//insertCloseAlarm
	
	public boolean updateDeactivation(String s_num) {
		boolean flag=false;
		SqlSession ss=sg_dao.getSqlSessionFactory().openSession();
		
		int cnt=ss.update("updateDeactivation", s_num);
		if(cnt==1) {
			flag=true;
			ss.commit();
		}
		ss.close();
		return flag;
	}//updateDeactivation
	
}//class

















