package kr.co.studystory.service;

import java.util.List;

import kr.co.studystory.dao.StudyNoticeDAO;
import kr.co.studystory.domain.StudyNotice;

public class StudyNoticeService {
	private StudyNoticeDAO sn_dao;
	
	public StudyNoticeService() {
		sn_dao=StudyNoticeDAO.getInstance();
	}//sn_dao
	
	//스터디 공지사항 페이지
	private List<StudyNotice> getSnList(String studyNum){
		List<StudyNotice> list=null;
		list=sn_dao.selectSnList(studyNum);
		
		return list;
	}//getSnList

}
