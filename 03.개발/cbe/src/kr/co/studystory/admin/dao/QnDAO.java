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
import kr.co.studystory.admin.domain.DetailNotice;
import kr.co.studystory.admin.domain.DetailQuestion;
import kr.co.studystory.admin.domain.Notice;
import kr.co.studystory.admin.domain.Question;
import kr.co.studystory.admin.vo.AnswerVO;
import kr.co.studystory.admin.vo.NewNoticeVO;
import kr.co.studystory.admin.vo.NoticeBoardVO;
import kr.co.studystory.admin.vo.NoticeModifyVO;
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
	
	public boolean deleteQuestion(String qNum) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		boolean deleteFlag=ss.delete("delQuestion",qNum)==1;
		if(deleteFlag) {
			ss.commit();
		}
		return deleteFlag;
	}
	
	public List<Notice> selectNotice(NoticeBoardVO nb_vo){
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<Notice> list =ss.selectList("noticeList",nb_vo);
		ss.close();
		return list;
	}
	
	public DetailNotice  selectDetailNotice(String nNum) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		DetailNotice dq= ss.selectOne("noticeDetail",nNum);
		ss.close();
		return dq;
	}
	
	public boolean updateNotice(NoticeModifyVO nm_vo) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		boolean updateNotice=ss.update("updateNotice",nm_vo)==1;
		if(updateNotice) {
			ss.commit();
		}
		return updateNotice;
	}
	
	public boolean deleteNotice(String nNum) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		boolean deleteNotice=ss.delete("deleteNotice", nNum)==1;
		if(deleteNotice) {
			ss.commit();
		}
		return deleteNotice;
	}
	
	public List<String> selectAllUser() {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		List<String> list= ss.selectList("selectAllUser");
		return list;
	}
	
	public void insertNotice(NewNoticeVO nn_vo) {
		SqlSession ss= StudyAndUserDAO.getInstance().getSessionFactory().openSession();
		ss.insert("insertNotice",nn_vo);
		ss.commit();
	}
	
}
