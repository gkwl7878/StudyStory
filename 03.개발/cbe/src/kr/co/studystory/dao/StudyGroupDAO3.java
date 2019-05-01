package kr.co.studystory.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.studystory.domain.StudyIMade;
import kr.co.studystory.vo.ConditionVO;

@Component
public class StudyGroupDAO3 {
	public StudyGroupDAO sg_dao;
	
	public StudyGroupDAO3() {
		sg_dao = StudyGroupDAO.getInstance();
	}
	
	/**
	 * 내가만든 스터디
	 * by 영근
	 */
	public List<StudyIMade> selectStudyImade(ConditionVO cvo) {
		List<StudyIMade> list = null;

		SqlSession ss = sg_dao.getSqlSessionFactory().openSession();
		list = ss.selectList("selectStudyIMade", cvo);
		ss.close();
		
		return list;
	}
	
	/*public static void main(String[] args) {
		
		ConditionVO cdvo = new ConditionVO();
		cdvo.setId("young3");
		cdvo.setCategory("취업");
		cdvo.setLoc("홍대");
		
		StudyGroupDAO2 sgd = new StudyGroupDAO2();
		System.out.println(sgd.selectStudyImade(cdvo));
		
	}*/
	
}//class

















