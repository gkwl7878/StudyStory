package kr.co.studystory.service;

import java.util.List;

import kr.co.studystory.dao.StudyInfoDAO;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;

public class StudyInfoService {

	private StudyInfoDAO si_dao;

	public StudyInfoService() {
		si_dao = StudyInfoDAO.getInstance();
	}// 생성자.

	///////////////////////////////// 메서드 시작.

	public StudyInfoDomain getStudyInfo(String s_num) {
		StudyInfoDomain s_info = null;
		s_info = si_dao.selectStudyInfo(s_num); // id는 나중에 처리하기.
		return s_info;
	}// getStudyInfo

	public List<StudyCommentDomain> getStudyComment(String s_num) {
		List<StudyCommentDomain> list = null;
		list = si_dao.selectSCommentList(s_num);
		return list;
	}// getStudyComment

	// 단위 테스트 main.
	public static void main(String[] args) {
		StudyInfoService sInfoService = new StudyInfoService();
		StudyInfoDomain sInfo = sInfoService.getStudyInfo("");
		System.out.println(sInfo);
	}// main

}// class
