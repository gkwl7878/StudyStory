package kr.co.studystory.service;

import java.util.List;

import kr.co.studystory.dao.StudyInfoDAO;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.domain.ThumbnailDomain;

public class StudyInfoService {

	private StudyInfoDAO si_dao;

	public StudyInfoService() {
		si_dao = StudyInfoDAO.getInstance();
	}// 생성자.

	/**
	 * 썸네일 리스트 얻기.
	 * 
	 * @return
	 */
	public List<ThumbnailDomain> getThumbnailList() {
		List<ThumbnailDomain> list = null;
		list = si_dao.selectThumbnailList();

		// 썸네일의 nick의 길이가 3을 넘어가면 "..." 처리.
		ThumbnailDomain thumb_domain = null;
		String nick = "";
		for (int i = 0; i < list.size(); i++) {
			thumb_domain = list.get(i);
			nick = thumb_domain.getNick();
			if (nick.length() > 3) {
				nick = nick.substring(0, 3) + "...";
				thumb_domain.setNick(nick);
			} // end if
		} // end for

		return list;
	}// getThumbnailList

	/**
	 * 스터디 상세정보 얻기.
	 * 
	 * @param s_num
	 * @return
	 */
	public StudyInfoDomain getStudyInfo(String s_num) {
		StudyInfoDomain s_info = null;
		s_info = si_dao.selectStudyInfo(s_num);
		return s_info;
	}// getStudyInfo

	/**
	 * 스터디 댓글 리스트 얻기.
	 * 
	 * @param s_num
	 * @return
	 */
	public List<StudyCommentDomain> getStudyComment(String s_num) {
		List<StudyCommentDomain> list = null;
		list = si_dao.selectSCommentList(s_num);
		return list;
	}// getStudyComment

	/************ 이하 메인 메서드 : 단위 테스트 ************/
	// 단위 테스트 main.
	public static void main(String[] args) {
		StudyInfoService sInfoService = new StudyInfoService();
		StudyInfoDomain sInfo = sInfoService.getStudyInfo("");
		System.out.println(sInfo);
	}// main

}// class
