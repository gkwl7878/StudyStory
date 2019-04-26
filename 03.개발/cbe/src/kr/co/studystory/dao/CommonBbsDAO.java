package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.domain.Alarm;
import kr.co.studystory.domain.DetailAlarm;
import kr.co.studystory.domain.DetailNotice;
import kr.co.studystory.domain.DetailQuestion;
import kr.co.studystory.domain.MyQuestion;
import kr.co.studystory.domain.NewAlarm;
import kr.co.studystory.domain.Notice;
import kr.co.studystory.vo.AlarmBbsVO;
import kr.co.studystory.vo.NoticeBbsVO;
import kr.co.studystory.vo.QuestionBbsVO;
import kr.co.studystory.vo.QuestionVO;

@Component
public class CommonBbsDAO {
	
	private static CommonBbsDAO c_dao;
	
	public static CommonBbsDAO getInstance() {
		if (c_dao == null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging(); // 로깅 사용
			c_dao = new CommonBbsDAO();
		}
		
		return c_dao;
	}
	
	public synchronized SqlSessionFactory getSqlSessionFactory() {
		SqlSessionFactory ssf = null;
		
		try {
			Reader r = Resources.getResourceAsReader("kr/co/studystory/dao/mybatis_config.xml");
			SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
			ssf = ssfb.build(r);
			if (r != null) {
				r.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ssf;
	}
	
	/**
	 * 새 알람(네비에 있는) 눌렀을 때 안읽은 알람을 조회하는 메서드
	 * by 영근 190425
	 */
	public List<NewAlarm> selectNewAlarms(String id) {
		List<NewAlarm> list = null;
		
		SqlSession ss = CommonBbsDAO.getInstance().getSqlSessionFactory().openSession();
		list = ss.selectList("selectNewAlarms", id);
		
		return list;
	}
	
	
	/**
	 * id에 해당하는 전체 알람수를 반환하는 메서드
	 * by 영근 
	 */
	public int selectAlarmTotal(String id) {
		int alarmTotal = 0;
		
		SqlSession ss = CommonBbsDAO.getInstance().getSqlSessionFactory().openSession();
		alarmTotal = ss.selectOne("selectAlarmTotal", id);
		ss.close();
		
		return alarmTotal;
	}
	
	/**
	 * 알람 더보기 게시판 게시글 반환하는 메서드
	 * by 영근
	 */
	public List<Alarm> selectAlarms(AlarmBbsVO abv) {
		List<Alarm> list = null;
		
		SqlSession ss = CommonBbsDAO.getInstance().getSqlSessionFactory().openSession();
		list = ss.selectList("selectAlarmBbs", abv);
		ss.close();
		
		return list;
	}
	
	/**
	 * 알람 읽음처리 메서드
	 * by 영근
	 */
	public boolean updateReadFlag(String a_num) {
		boolean flag = false;
		
		
		return flag;
	}
	
	/**
	 * 알람 상세글을 조회하는 메서드
	 * by 영근
	 */
	public DetailAlarm selectDetailAlarm(String a_num) {
		DetailAlarm da = null;
		
		
		return da;
	}
	
	/**
	 * 전체 공지사항을 반환하는 메서드
	 * by 영근
	 */
	public int selectNoticeTotal() {
		int noticeTotal = 0;

		
		return noticeTotal;
	}
	
	/**
	 * 공지사항 게시글을 조회하는 메서드
	 * by 영근
	 */
	public List<Notice> selectNotice(NoticeBbsVO nbv) {
		List<Notice> list = null;
		
		return list;
	}
	
	/**
	 * 공지사항 조회수를 올리는 메서드
	 * by 영근
	 */
	public void updateViewCnt(String n_num) {
		
	}
	
	/**
	 * 상세 공지사항을 조회하는 메서드
	 * by 영근
	 */
	public DetailNotice selectDetailNotice(String n_num) {
		DetailNotice dn = null;
		
		return dn;
	}
	
	/**
	 * 문의사항을 등록하는 메서드
	 * by 영근
	 */
	public void insertQuestion(QuestionVO qvo) {
		
	}
	
	/**
	 * 내가 남긴 문의글을 조회하는 메서드
	 */
	public List<MyQuestion> selectMyQuestion(QuestionBbsVO qbv) {
		List<MyQuestion> list = null;
		
		return list; 
	}
	
	/**
	 * 상세 문의글을 조회하는 메서드
	 */
	public DetailQuestion selectDetailQuestion(String q_num) {
		DetailQuestion dq = null;
		
		return dq;
	}
	
	
	public static void main(String[] args) {
		System.out.println(CommonBbsDAO.getInstance().selectNewAlarms("kim111"));
	}
	
}
