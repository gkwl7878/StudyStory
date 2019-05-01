package kr.co.studystory.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.dao.AdCommonDAO;
import kr.co.studystory.admin.dao.StudyAndUserDAO;
import kr.co.studystory.admin.domain.DetailNewStudyInfo;
import kr.co.studystory.admin.domain.DetailUser;
import kr.co.studystory.admin.domain.NewStudyInfo;
import kr.co.studystory.admin.domain.StudyInfo;
import kr.co.studystory.admin.domain.UserInfo;
import kr.co.studystory.admin.vo.AcceptVO;
import kr.co.studystory.admin.vo.DetailUserVO;
import kr.co.studystory.admin.vo.NsBoardVO;
import kr.co.studystory.admin.vo.RefuseVO;
import kr.co.studystory.admin.vo.StudyBoardVO;
import kr.co.studystory.admin.vo.UserBoardVO;

@Component
public class StudyAndUserService {
	@Autowired
	private StudyAndUserDAO sau_dao;
	
	@Autowired
	private AdCommonDAO ac_dao;
	
	
	/**
	 * NewStudy의 List 읽어오기
	 * @param nb_vo
	 * @return
	 */
	public List<NewStudyInfo> searchNewStudy(NsBoardVO nb_vo) {
		List<NewStudyInfo> list =new ArrayList<NewStudyInfo>();
		NewStudyInfo nsi=null;
		String studyName="";
		list= sau_dao.selectNewStudy(nb_vo);
		for(int i=0; i<list.size();i++) {
			nsi=list.get(i);
			studyName = nsi.getStudyName();
			if(studyName.length()>25) {
				studyName= studyName.substring(0, 24)+"...";
				nsi.setStudyName(studyName);
			}//end if
		}//end for
		
		return list;
	}
	
	public DetailNewStudyInfo detailNewStudy(String sNum) {
		DetailNewStudyInfo dnsi=sau_dao.selectDetailNewStudy(sNum);
		return dnsi;
	}
	
	public boolean acceptStudy(AcceptVO a_vo) {
		boolean acceptFlag= false;
		boolean mInsertFlag= false;
		acceptFlag =sau_dao.updeteAccept(a_vo);
		mInsertFlag= sau_dao.insertFirstMember(a_vo);
		return acceptFlag;
	}
	
	public boolean refuseStudy(RefuseVO r_vo) {
		boolean deleteFlag= false;
		deleteFlag =sau_dao.updateDeleteFlag(r_vo.getsNum());
		return deleteFlag;
	}
	
	/**
	 * User의 List 조회
	 * @param ub_vo
	 * @return
	 */
	public List<UserInfo> searchUserInfo(UserBoardVO ub_vo) {
		List<UserInfo> list =new ArrayList<UserInfo>();
		list= sau_dao.selectUserInfo(ub_vo);
		
		return list;
	}
	
	/**
	 * User 상세정보 조회
	 * @param id
	 * @return
	 */
	public DetailUser searchDetailUser(String id) {
		DetailUser du=sau_dao.selectDatailUserInfo(id);
		return du;
	}
	
	/**
	 * User 정보 수정
	 * @param du_vo
	 * @return
	 */
	public boolean modifyUser(DetailUserVO du_vo) {
		boolean modifyUser=sau_dao.updateModifyUser(du_vo);
		return modifyUser;
	}
	
	/**
	 * User삭제
	 * @param id
	 * @return
	 */
	public boolean removeUser(String id) {
		boolean removeUser=false;
		boolean updateRemoveUser=sau_dao.updateRemoveUser(id);
		
		if(updateRemoveUser) {
			boolean deleteJoinRecord=sau_dao.deleteJoinRecord(id);
			boolean deleteMemberRecord = sau_dao.deleteMemberRecord(id);
			removeUser = true;
		}
		System.out.println(removeUser);
		return removeUser;
	}
	
	/**
	 * study 리스트 조회
	 * @param sb_vo
	 * @return
	 */
	public List<StudyInfo> searchStudyInfo(StudyBoardVO sb_vo){
		List<StudyInfo> list =new ArrayList<StudyInfo>();
		list= sau_dao.selectStudyInfo(sb_vo);
		return list;
	}
	
	
	
	
	public static void main(String[] args) {
//		 StudyAndUserService saus= new StudyAndUserService();
//		 AcceptVO a_vo= new AcceptVO();
//		 a_vo.setsNum("s_000021");
//		 saus.acceptStudy(a_vo);
		
	}
}
