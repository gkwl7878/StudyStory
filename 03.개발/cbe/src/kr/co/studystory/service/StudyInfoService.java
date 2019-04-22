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

	///////////////////////////////// 메서드 시작.

	///////////////////////////////// 메인 페이지.

	/**
	 * 메인 페이지의 썸네일 리스트 얻기.
	 * 
	 * @return
	 */
	public List<ThumbnailDomain> getThumbnailList() {
		List<ThumbnailDomain> list = null;
		list = si_dao.selectThumbnailList();
		return list;
	}// getThumbnailList

	///////////////////////////////// 메인 페이지.

	///////////////////////////////// 스터디 상세 페이지.

	public StudyInfoDomain getStudyInfo(String s_num) {
		StudyInfoDomain s_info = null;
		s_info = si_dao.selectStudyInfo(s_num);
		return s_info;
	}// getStudyInfo

	public List<StudyCommentDomain> getStudyComment(String s_num) {
		List<StudyCommentDomain> list = null;
		list = si_dao.selectSCommentList(s_num);
		return list;
	}// getStudyComment

	///////////////////////////////// 스터디 상세 페이지.

	// 단위 테스트 main.
	public static void main(String[] args) {
		StudyInfoService sInfoService = new StudyInfoService();
		StudyInfoDomain sInfo = sInfoService.getStudyInfo("");
		System.out.println(sInfo);
	}// main

}// class
