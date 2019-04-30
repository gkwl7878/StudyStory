package kr.co.studystory.service;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyNoticeDAO;
import kr.co.studystory.domain.DetailStudyNotice;
import kr.co.studystory.domain.Homework;
import kr.co.studystory.domain.NickAndId;
import kr.co.studystory.domain.SnComment;
import kr.co.studystory.domain.StudyNotice;
import kr.co.studystory.vo.NewCommentVO;
import kr.co.studystory.vo.RecruitVO;
@Component
public class StudyNoticeService {
	@Autowired
	private StudyNoticeDAO sn_dao;
	
	
	//스터디 공지사항 페이지
	public List<StudyNotice> getSnList(String studyNum){
		List<StudyNotice> list=null;
		list=sn_dao.selectSnList(studyNum);
		
		//StudyNotice sn_do=null;                --제목 줄이기 좀 나중에
		//String 
		return list;
	}//getSnList

	public DetailStudyNotice getDetailSn(String num) {
		DetailStudyNotice dsn= sn_dao.selectDetailSn(num);
		
		return dsn;
	}//getDetailSn
	
	public List<Homework> getHomework(String sn_num){
		List<Homework> list= null;
		list=sn_dao.selectHomework(sn_num);
		
		
		return list;
	}//getHomework
	
	public List<SnComment> getComment(String sn_num){
		List<SnComment> list=null;
		list=sn_dao.selectComment(sn_num);
		
		return list; 
	}//getComment
	
	/**
	 * 정미 숙제 확인
	 * @param sn_num
	 * @return
	 */
	public boolean checkHomework(String sn_num) {
		boolean flag= false;
		
		flag=sn_dao.updateHomework(sn_num);
		
		return flag;
	}//checkHomework
	
	/**
	 * 정미 -댓글 달기
	 * @param nc_vo
	 * @return
	 */
	public boolean insertComment(NewCommentVO nc_vo) {
		boolean flag =false;
		
		//flag= sn_dao.insertComment(nc_vo);
		return flag;
	}//insertComment
	/**
	 * 모집상태 변경
	 * by 영근
	 */
	public boolean changeRecruit(RecruitVO rvo) {
		boolean flag = false;
		flag = sn_dao.updateRecruit(rvo);
		return flag;
	}
	
	/**
	 * 스터디 참가자의 아이디, 닉네임을 반환하는 메서드
	 * by 영근
	 */
	public List<NickAndId> getMember(String sNum) {
		return sn_dao.selectMember(sNum);
	}
	
}//class
