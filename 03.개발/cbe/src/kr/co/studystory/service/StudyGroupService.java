package kr.co.studystory.service;

import kr.co.studystory.dao.StudyGroupDAO;
import kr.co.studystory.vo.NewStudyVO;

public class StudyGroupService {

	public boolean addNewStudy(NewStudyVO ns_vo) {
		boolean flag=false;
		
		StudyGroupDAO sg_dao=StudyGroupDAO.getInstance();
		
		sg_dao.insertNewStudy(ns_vo);
		
		return flag;
	}
}
