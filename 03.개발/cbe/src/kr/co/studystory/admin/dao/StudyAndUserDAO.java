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
import kr.co.studystory.admin.domain.DetailUser;
import kr.co.studystory.admin.domain.NewStudyInfo;
import kr.co.studystory.admin.domain.UserInfo;
import kr.co.studystory.admin.vo.AcceptVO;
import kr.co.studystory.admin.vo.NsBoardVO;
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
	
	public DetailUser selectDatailUserInfo(String id) {
		DetailUser du=null;
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		du= ss.selectOne("userDetail",id);
		ss.close();
		return du;
	}
	
	public static void main(String[] args) {
/*		StudyAndUserDAO sau_dao= new StudyAndUserDAO();
		UserBoardVO ub_vo= new UserBoardVO();
		ub_vo.setBegin(1);
		ub_vo.setCurrPage(1);
		ub_vo.setEnd(10);
		ub_vo.setSearchCondition("닉네임");
		ub_vo.setSearchWord("user");
		sau_dao.selectUserInfo(ub_vo);*/
	}
	
}
