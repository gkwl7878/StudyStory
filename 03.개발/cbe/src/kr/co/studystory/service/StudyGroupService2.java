package kr.co.studystory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyGroupDAO2;
import kr.co.studystory.domain.JoinBbs;
import kr.co.studystory.domain.MemberWithImg;
import kr.co.studystory.vo.ApplicantBbsVO;

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
	
	public List<JoinBbs> getJoinerList(ApplicantBbsVO abvo){
		List<JoinBbs> list= null;
		list=sg_dao.selectJoinerList(abvo);
		
		return list;
	}//getJoinerList

}
