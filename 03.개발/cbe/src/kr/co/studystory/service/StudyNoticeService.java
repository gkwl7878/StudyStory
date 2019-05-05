package kr.co.studystory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyNoticeDAO;
import kr.co.studystory.domain.DetailStudyNotice;
import kr.co.studystory.domain.Homework;
import kr.co.studystory.domain.NickAndId;
import kr.co.studystory.domain.SnComment;
import kr.co.studystory.domain.StudyNameAndRecruit;
import kr.co.studystory.domain.StudyNotice;
import kr.co.studystory.vo.FinishHwVO;
import kr.co.studystory.vo.NewCommentVO;
import kr.co.studystory.vo.NewHomeworkVO;
import kr.co.studystory.vo.NewStudyNoticeVO;
import kr.co.studystory.vo.RecruitVO;
import kr.co.studystory.vo.SnAlarmVO;
@Component
public class StudyNoticeService {
	@Autowired
	private StudyNoticeDAO sn_dao;
	
	
	/**
	 * snNum으로 스터디명 조회하기
	 */
	public String getStudyNameBySnNum(String sn_num) {
		return sn_dao.selectStudyNameBySnNum(sn_num);
	}
	
	//스터디 공지사항 페이지
	public List<StudyNotice> getSnList(String studyNum){
		List<StudyNotice> list=null;
		list=sn_dao.selectSnList(studyNum);
		
		for(StudyNotice sn : list) {
			sn.setCommentNum(sn_dao.selectCommentNum(sn.getSnNum()));
		}
		
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
	public boolean checkHomework(FinishHwVO fvo) {
		boolean flag= false;
		
		flag=sn_dao.updateHomework(fvo);
		
		return flag;
	}//checkHomework
	
	/**
	 * 정미 -댓글 달기
	 * @param nc_vo
	 * @return
	 */
	public boolean addComment(NewCommentVO nc_vo) {
		boolean flag =false;
		
		if (sn_dao.addComment(nc_vo)) {
			flag = true;
		}
		
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
	
	/**
	 * 새 스터디 공지를 추가하는 메서드
	 * by 영근
	 */
	public boolean addNewSn(NewStudyNoticeVO nsnvo) {
		boolean flag = false;
		
		if(sn_dao.insertNewSn(nsnvo)) {
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * 가장 최근에 등록된 공지번호를 가져오는 메서드
	 * by 영근
	 */
	public String getLatestSnNum(String s_num) {
		return sn_dao.selectLatestSnNum(s_num);
	}
	
	/**
	 * nick으로 id를 조회하는 메서드
	 * by 영근
	 */
	public String getIdByNick(String nick) {
		return sn_dao.selectIdByNick(nick);
	}
	
	/**
	 * 새 과제를 추가하는 메서드
	 * by 영근
	 */
	public boolean addNewHw(NewHomeworkVO nhwvo) {
		boolean flag = false;
		
		if(sn_dao.insertNewHw(nhwvo)) {
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * 리더의 스터디 공지 리스트페이지에서 보여줄 제목과 모집상태를 반환하는 메서드
	 * by 영근
	 */
	public StudyNameAndRecruit getStudyNameAndRecruit(String s_num) {
		return sn_dao.selectStudyNameAndRecruit(s_num);
	}
	
	/**
	 * 알람을 추가하는 메서드
	 */
	public boolean sendAlarm(SnAlarmVO savo) {
		boolean flag = false;
		
		if(sn_dao.insertNewSnAlarm(savo)) {
			flag = true;
		}
		
		return flag;
	}
	
	
}//class
