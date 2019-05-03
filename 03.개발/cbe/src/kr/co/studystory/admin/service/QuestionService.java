package kr.co.studystory.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.dao.AdCommonDAO;
import kr.co.studystory.admin.dao.QnDAO;
import kr.co.studystory.admin.domain.Answer;
import kr.co.studystory.admin.domain.DetailQuestion;
import kr.co.studystory.admin.domain.Question;
import kr.co.studystory.admin.vo.AnswerVO;
import kr.co.studystory.admin.vo.QuestionBoardVO;

@Component
public class QuestionService {
	@Autowired
	private QnDAO qn_dao;
	
	@Autowired
	private AdCommonDAO ac_dao;
	
	public List<Question> searchQuestion(QuestionBoardVO qb_vo) {
		List<Question> list =new ArrayList<Question>();
		Question qestion=null;
		String subject="";
		list= qn_dao.selectQuestion(qb_vo);
		for(int i=0; i<list.size();i++) {
			qestion=list.get(i);
			subject = qestion.getSubject();
			if(subject.length()>25) {
				subject= subject.substring(0, 24)+"...";
				qestion.setSubject(subject);
			}//end if
		}//end for
		
		return list;
	}
	
	public DetailQuestion searchQuestion(String qNum) {
		DetailQuestion dq= qn_dao.selectDetailQuestion(qNum);
		return dq;
	}
	
	public Answer searchAnswer(String qNum) {
		Answer answer=qn_dao.selectDetailAnswer(qNum);
		return answer;
	}
	
	public boolean modifyAnswerFlag(AnswerVO a_vo) {
		boolean answerFlag= qn_dao.updateAnswerFlag(a_vo);
		return answerFlag;
	}
}
