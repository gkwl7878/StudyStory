package kr.co.studystory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyGroupDAO3;
import kr.co.studystory.domain.AppliedStudy;
import kr.co.studystory.domain.MyStudy;
import kr.co.studystory.domain.StudyIMade;
import kr.co.studystory.vo.ConditionVO;

@Component
public class StudyGroupService3 {
	
	@Autowired
	private StudyGroupDAO3 sg_dao3;
	
	/**
	 * 내 스터디, 내가 만든 스터디, 관심 스터디에서 사용할
	 * 프로필 이미지를 반환하는 메서드
	 * by 영근
	 */
	public String getMyProfileImg(String id) {
		return sg_dao3.selectMyProfileImg(id);
	}

	/**
	 * 내가 만든 스터디정보를 반환하는 메서드
	 * by 영근
	 */
	public List<StudyIMade> getStudyIMade(ConditionVO cvo) {
		return sg_dao3.selectStudyImade(cvo);
	}
	
	/**
	 * 진행중인 스터디 정보를 반환하는 메서드
	 * by 혜원
	 */
	public List<MyStudy> getMyStudy(ConditionVO c_vo) {
		return sg_dao3.selectMyStudies(c_vo);
	}//getMyStudy
	
	/**
	 * 신청한 스터디 정보를 반환하는 메서드
	 * by 혜원
	 */
	public List<AppliedStudy> getMyApplied(ConditionVO c_vo) {
		return sg_dao3.selectAppliedStudy(c_vo);
	}//getMyApplied
}
