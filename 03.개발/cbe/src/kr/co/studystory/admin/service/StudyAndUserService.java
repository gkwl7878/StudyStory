package kr.co.studystory.admin.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.studystory.admin.dao.AdCommonDAO;
import kr.co.studystory.admin.dao.StudyAndUserDAO;
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
	
	/**
	 * 새스터디 상세조회
	 * @param sNum
	 * @return
	 */
	public DetailNewStudyInfo detailNewStudy(String sNum) {
		DetailNewStudyInfo dnsi=sau_dao.selectDetailNewStudy(sNum);
		return dnsi;
	}
	
	/**
	 * 새스터디 수락
	 * @param a_vo
	 * @return
	 */
	public boolean acceptStudy(AcceptVO a_vo) {
		boolean acceptFlag= false;
		boolean mInsertFlag= false;
		acceptFlag =sau_dao.updeteAccept(a_vo);
		mInsertFlag= sau_dao.insertFirstMember(a_vo);
		return acceptFlag;
	}
	
	/**
	 * 새스터디 거절
	 * @param r_vo
	 * @return
	 */
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
		removeUser = sau_dao.updateRemoveUser(id);
		return removeUser;
	}
	
	/**
	 * 스터디 리스트 조회
	 * @param sb_vo
	 * @return
	 */
	public List<StudyInfo> searchStudyInfo(StudyBoardVO sb_vo){
		List<StudyInfo> list =new ArrayList<StudyInfo>();
		list= sau_dao.selectStudyInfo(sb_vo);
		return list;
	}
	
	/**
	 * 스터디 상세정보 조회
	 * @param sNum
	 * @return
	 */
	public DetailStudy searchDetailStudy(String sNum) {
		DetailStudy ds=sau_dao.selectDetailStudyInfo(sNum);
		return ds;
	}
	
	/**
	 * 상세스터디 수정
	 * @param ds_vo
	 * @return
	 */
	public boolean modifyStudy(DetailStudyVO ds_vo) {
		boolean modifyStudy= sau_dao.updateDetailStudyInfo(ds_vo);
		return modifyStudy;
	}
	
	/**
	 * 전에 갖고있는 이미지 삭제를 위한 조회
	 * @param sNum
	 * @return
	 */
	public String searchPreImg(String sNum) {
		String preImg= sau_dao.selectPreImg(sNum);
		return preImg;
	}
	
	/**
	 * 새 이미지명 받아오기
	 * @param request
	 * @throws IOException 
	 */
	public	 void updateNewIng(HttpServletRequest request, String file) throws IOException {

	}
	
	/**
	 * 삭제할 멤버 조회
	 * @param sNum
	 * @return
	 */
	public List<String> getMember(String sNum){
		List<String> list= sau_dao.selectStudyMember(sNum);
		return list;
	}
	
	/**
	 * 스터디 삭제
	 * @param sNum
	 * @return
	 */
	public boolean removeStudy(String sNum) {
		boolean removeFlag= sau_dao.deleteStudy(sNum);
		return removeFlag;
	}
	
	public List<String> searchDeleteSnum(String id) {
		List<String> preSnum= sau_dao.selectDeleteSnum(id);
		return preSnum;
	}
	
	
	public static void main(String[] args) {
//		 StudyAndUserService saus= new StudyAndUserService();
//		 AcceptVO a_vo= new AcceptVO();
//		 a_vo.setsNum("s_000021");
//		 saus.acceptStudy(a_vo);
		
	}
}
