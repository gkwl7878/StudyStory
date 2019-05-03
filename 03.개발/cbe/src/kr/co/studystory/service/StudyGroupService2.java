package kr.co.studystory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyGroupDAO2;
import kr.co.studystory.domain.MemberWithImg;

/**
 * 스터디 참여자 보기 - 정미 
 * @author owner
 */
@Component
public class StudyGroupService2 {
	@Autowired
	private StudyGroupDAO2 sg_dao;
	
	public List<MemberWithImg> getMemberWithImg(String sNum){
		List<MemberWithImg> list=null;
		list=sg_dao.selectMemberWithImg(sNum);
		
		return list;
	}//getMemberWithImg

}
