package kr.co.studystory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyGroupDAO3;
import kr.co.studystory.domain.StudyIMade;
import kr.co.studystory.vo.ConditionVO;

@Component
public class StudyGroupService3 {
	
	@Autowired
	private StudyGroupDAO3 sg_dao3;

	/**
	 * 내가 만든 스터디정보를 반환하는 메서드
	 * by 영근
	 */
	public List<StudyIMade> getStudyIMade(ConditionVO cvo) {
		return sg_dao3.selectStudyImade(cvo);
	}
	
	
	
}
