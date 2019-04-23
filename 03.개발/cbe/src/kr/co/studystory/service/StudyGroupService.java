package kr.co.studystory.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyGroupDAO;
import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;

@Component
public class StudyGroupService {
	
	@Autowired
	private StudyGroupDAO sg_dao;
	
	//새 스터디 개설하기
	//스터디명 중복확인은 ajax로 구현
	public boolean checkDupStudyName(String sName) {
		boolean flag=false;
		
		return flag;
	}
	
	public boolean addNewStudy(NewStudyVO ns_vo) {
		boolean flag=false;
		
		if(sg_dao.insertNewStudy(ns_vo)) {
			flag=true;
		}
		return flag;
	}//addNewStudy
	
	//내 스터디 수정하기
	public PrevStudyInfo getPrevStudy(String sNum) {
		
		StudyGroupDAO sg_dao=StudyGroupDAO.getInstance();
		PrevStudyInfo psi=sg_dao.selectPrevStudyInfo(sNum);
		return psi;
	}//getPrevStudy
	
	public boolean modifyStudy(ModifiedStudyVO ms_vo) {
		boolean flag=false;
		
		StudyGroupDAO sg_dao=StudyGroupDAO.getInstance();
		
		if(sg_dao.updateStudy(ms_vo)) {
			flag=true;
		}
		
		return flag;
	}
	
	
}































