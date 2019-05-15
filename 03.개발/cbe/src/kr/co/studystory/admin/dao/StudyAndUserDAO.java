package kr.co.studystory.admin.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.domain.DetailNewStudyInfo;
import kr.co.studystory.admin.domain.DetailStudy;
import kr.co.studystory.admin.domain.DetailUser;
import kr.co.studystory.admin.domain.NewStudyInfo;
import kr.co.studystory.admin.domain.StudyInfo;
import kr.co.studystory.admin.domain.UserInfo;
import kr.co.studystory.admin.vo.AcceptVO;
import kr.co.studystory.admin.vo.DetailStudyVO;
import kr.co.studystory.admin.vo.DetailUserVO;
import kr.co.studystory.admin.vo.NsBoardVO;
import kr.co.studystory.admin.vo.StudyBoardVO;
import kr.co.studystory.admin.vo.UserBoardVO;

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
	
	/**
	 * NewStudy 리스트 조회
	 * @param nb_vo
	 * @return
	 */
	public List<NewStudyInfo> selectNewStudy(NsBoardVO nb_vo){
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<NewStudyInfo> list =ss.selectList("newStudyList",nb_vo);
		ss.close();
		return list;
	}
	
	/**
	 * NewStudy Detail 조회
	 * @param sNum
	 * @return
	 */
	public DetailNewStudyInfo selectDetailNewStudy(String sNum) {
		DetailNewStudyInfo dnsi=null;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		dnsi= ss.selectOne("nsDetail",sNum);
		ss.close();
		return dnsi;
	}
	
	/**
	 * New Study AcceptFlag 변환
	 * @param a_vo
	 * @return
	 */
	public boolean updeteAccept(AcceptVO a_vo) {
		boolean updateAcceptFlag= false;
		int cnt=0;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		cnt =ss.update("updateNsAccept",a_vo);
		if(cnt>0) {
			updateAcceptFlag=true;
			ss.commit();
		}
		ss.close();
		return updateAcceptFlag;
	}
	
	/**
	 * NewStudy의 멤버 넣기
	 * @param a_vo
	 * @return
	 */
	public boolean insertFirstMember(AcceptVO a_vo) {
		boolean membInsertFlag = false; 
		int cnt=0;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		cnt= ss.insert("insertNsMember", a_vo);
		if(cnt>0) {
			membInsertFlag=true;
			ss.commit();
		}
		ss.close();
		return membInsertFlag;
	}
	
	/**
	 * NewStudy DeleteFlag 변환
	 * @param sNum
	 * @return
	 */
	public boolean updateDeleteFlag(String sNum) {
		boolean updateDeleteFlag = false; 
		int cnt=0;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		cnt= ss.update("deleteNewStudy", sNum);
		if(cnt>0) {
			updateDeleteFlag=true;
			ss.commit();
		}
		ss.close();
		return updateDeleteFlag;
	}
	
	/**
	 * 유저 리스트 조회
	 * @param nb_vo
	 * @return
	 */
	public List<UserInfo> selectUserInfo(UserBoardVO ub_vo){
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<UserInfo> list =ss.selectList("userInfoList",ub_vo);
		ss.close();
		return list;
	}
	
	/**
	 * 유저 상세정보 조회
	 * @param id
	 * @return
	 */
	public DetailUser selectDatailUserInfo(String id) {
		DetailUser du=null;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		du= ss.selectOne("userDetail",id);
		ss.close();
		return du;
	}
	
	/**
	 * User 상세정보 수정
	 * @param du_vo
	 * @return
	 */
	public boolean updateModifyUser(DetailUserVO du_vo) {
		boolean updateModifyUser= false;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		updateModifyUser =ss.update("updateModUser",du_vo)==1;
		if(updateModifyUser) {
			ss.commit();
		}
		return updateModifyUser;
	}
	
	/**
	 * 삭제 시 decativation 'Y'로 변경
	 * @param id
	 * @return
	 */
	public boolean updateRemoveUser(String id) {
		boolean updateRemoveUser= false;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		
		// join, member에 몇명이 있는지 모르기 때문에 조회
		int joinNum = ss.selectOne("selectJoinNum", id);
		int memNum = ss.selectOne("selectMemNum",id);
		
		// 조회한 레코드가 모두 지워지고, deactivation flag를 true로 업데이트 처리 후 commit 수행
		if (deleteJoinRecord(id, ss, joinNum) && deleteMemberRecord(id, ss, memNum)
				&& ss.update("updateDelUser",id) == 1) {
			ss.commit();
			updateRemoveUser=true;
		}
		ss.close();
		
		return updateRemoveUser;
	}
	
	/**
	 * join레코드에서 유저 삭제, join에 존재하는 수가 다 삭제되면 true
	 * @param id
	 * @return
	 */
	public boolean deleteJoinRecord(String id, SqlSession ss, int joinNum) {
		boolean flag = false;
		
		if (joinNum == ss.delete("delJoinRecord",id)) {
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * member 레코드에서 유저 삭제, member에 존재하는 수가 다 삭제되면 true
	 * @param id
	 * @return
	 */
	public boolean deleteMemberRecord(String id, SqlSession ss, int memNum) {
		boolean flag = false;
		
		if (memNum == ss.delete("delMemRecord",id)) {
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * 유저 리스트 조회
	 * @param sb_vo
	 * @return
	 */
	public List<StudyInfo> selectStudyInfo(StudyBoardVO sb_vo){
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<StudyInfo> list =ss.selectList("studyInfoList",sb_vo);
		ss.close();
		return list;
	}
	
	/**
	 * 상세 스터디 정보 조회
	 * @param sNum
	 * @return
	 */
	public DetailStudy selectDetailStudyInfo(String sNum) {
		DetailStudy ds=null;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		ds= ss.selectOne("studyDetail",sNum);
		ss.close();
		return ds;
	}
	
	/**
	 * 스터디 수정
	 * @param ds_vo
	 * @return
	 */
	public boolean updateDetailStudyInfo(DetailStudyVO ds_vo) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		boolean updateDetailStudyInfo= ss.update("updateStudy", ds_vo)==1;
		if(updateDetailStudyInfo) {
			ss.commit();
		}
		return updateDetailStudyInfo;
	}
	
	/**
	 * 전에 갖고 있는 이미지 삭제를 위한 조회
	 * @param sNum
	 * @return
	 */
	public String selectPreImg(String sNum) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		String preImg= ss.selectOne("selectPreImg",sNum);
		return preImg;
	}
	
	/**
	 * 스터디 삭제 전 알림을 보낼 멤버 조회
	 * @param sNum
	 * @return
	 */
	public List<String> selectStudyMember(String sNum) {
		List<String> list= new ArrayList<String>();
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		list= ss.selectList("selectStudyMember",sNum);
		return list;
	}
	
	/**
	 * 스터디 삭제
	 * @param sNum
	 * @return
	 */
	public boolean deleteStudy(String sNum) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		boolean deleteStudy= ss.update("deleteStudy", sNum)==1;
		if(deleteStudy) {
			ss.commit();
		}
		return deleteStudy;
	}
	
	/**
	 * 회원삭제시 해당 아이디라 리더일 때 만든 스터디 삭제
	 * @param sNum
	 * @return
	 */
	public List<String> selectDeleteSnum(String id) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<String> preSnum= ss.selectList("selectDeleteSnum",id);
		return preSnum;
	}
}
