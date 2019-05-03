package kr.co.studystory.admin.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.domain.Answer;
import kr.co.studystory.admin.domain.DetailQuestion;
import kr.co.studystory.admin.domain.Question;
import kr.co.studystory.admin.vo.AnswerVO;
import kr.co.studystory.admin.vo.QuestionBoardVO;

@Component
public class QnDAO {
	private static QnDAO qn_dao;
	private SqlSessionFactory ssf=null;
	
	public static QnDAO getInstance() {
		if(qn_dao==null) {
			qn_dao=new QnDAO();
		}//end if
		return qn_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSessionFactory() {
		if(ssf==null) {
			
			Reader reader = null;
			try {
				//1.설정용 xml 로딩
				reader = Resources.getResourceAsReader("kr/co/studystory/admin/dao/mybatis_config.xml");
				//2. MyBatis Framework생성
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				//3. DB와 연동된 객체 받기
				ssf=ssfb.build(reader);
				if(reader!=null) {
					reader.close();
				}
				
			} catch (IOException ie) {
				ie.printStackTrace();
			}//end catch
		}
		return ssf;
	}//getSessionFactory
	
	public List<Question> selectQuestion(QuestionBoardVO qb_vo){
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<Question> list =ss.selectList("questionList",qb_vo);
		ss.close();
		return list;
	}
	
	public DetailQuestion selectDetailQuestion(String qNum) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		DetailQuestion dq= ss.selectOne("questionDetail",qNum);
		ss.close();
		return dq;
	}
	
	public Answer selectDetailAnswer(String qNum) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		Answer answer = ss.selectOne("answerDetail", qNum);
		return answer;
	}
	
	public boolean updateAnswerFlag(AnswerVO a_vo) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		boolean updateAnsFlag= ss.update("updateAns",a_vo)==1;
		if(updateAnsFlag) {
			ss.commit();
		}
		return updateAnsFlag;
	}
	
	public static void main(String[] args) {
		QnDAO qn_dao= new QnDAO();
//		QuestionBoardVO qb_vo= new QuestionBoardVO();
//		qb_vo.setBegin(1);
//		qb_vo.setCurrPage(1);
//		qb_vo.setEnd(10);
//		qb_vo.setSearchCondition("스터디");
//		System.out.println(qn_dao.selectQuestion(qb_vo));
		System.out.println(qn_dao.selectDetailQuestion("q_000041"));
		
	}
}
