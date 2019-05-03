package kr.co.studystory.dao;

import java.io.IOException;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.domain.DetailStudyNotice;
import kr.co.studystory.domain.Homework;
import kr.co.studystory.domain.NickAndId;
import kr.co.studystory.domain.SnComment;
import kr.co.studystory.domain.StudyNameAndRecruit;
import kr.co.studystory.domain.StudyNotice;
import kr.co.studystory.vo.NewHomeworkVO;
import kr.co.studystory.vo.NewStudyNoticeVO;
import kr.co.studystory.vo.FinishHwVO;
import kr.co.studystory.vo.NewCommentVO;
import kr.co.studystory.vo.RecruitVO;
import kr.co.studystory.vo.SnAlarmVO;

////스터디 노티스 dao 정미
@Component
public class StudyNoticeDAO {
	
	private static StudyNoticeDAO sn_dao;
	private SqlSessionFactory ssf=null;
	
	private StudyNoticeDAO() {
	}//StudyNoticeDAO
	
	public static StudyNoticeDAO getInstance() {
		if(sn_dao==null) {
			sn_dao=new StudyNoticeDAO();
		}//end if
		return sn_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSessionFactory() {
		if(ssf==null) {
		Reader reader=null;
		
		try {
			reader=Resources.getResourceAsReader("kr/co/studystory/dao/mybatis_config.xml");
			SqlSessionFactoryBuilder ssfb= new SqlSessionFactoryBuilder();
			ssf=ssfb.build(reader);
			if(reader !=null) {reader.close();}
		} catch (IOException ie) {
			ie.printStackTrace();
		}//end catch
		
			
		}//end if
		return ssf;
	}//getSessionFactory
	
	/**
	 * sn_num으로 스터디명을 조회하기
	 * by 영근
	 */
	public String selectStudyNameBySnNum(String sn_num) {
		
		SqlSession ss=getSessionFactory().openSession();
		String studyName = ss.selectOne("selectStudyNameBySnNum", sn_num);
		ss.close();
		
		return studyName;
	}
	
	public boolean addComment(NewCommentVO ncvo) {
		boolean flag = false;
		
		SqlSession ss=getSessionFactory().openSession();
		int cnt = ss.insert("insertSnComment", ncvo);
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		
		return flag;
	}
	
	//스터디 공지사항 페이지(참여자)
	public List<StudyNotice> selectSnList(String studyNum){
		List<StudyNotice> list=null;
		SqlSession ss=getSessionFactory().openSession();
		list=ss.selectList("studyNoticeList",studyNum);
		ss.close();
		return list;
	}//selectSnList
	
	//////스터디 공지 상세페이지
	public DetailStudyNotice selectDetailSn(String snNum) {
		DetailStudyNotice dsn=null;
		SqlSession ss=getSessionFactory().openSession();
		dsn=ss.selectOne("studyDetailNoticeList", snNum);
		ss.close();
		return dsn;
		
	}//selectDetailSn
	
	//homework 조회
	public List<Homework> selectHomework(String sn_num){
		List<Homework> list=null;
		SqlSession ss= getSessionFactory().openSession();
		list=ss.selectList("HomeworkList",sn_num);
		ss.close();
		return list;
	}//getHomework
	
	//공지 댓글 
	public List<SnComment> selectComment(String sn_num){
		List<SnComment> list= null;
		SqlSession ss= getSessionFactory().openSession();
		list= ss.selectList("SnCommentList",sn_num);
		ss.close();
		return list;
	}//selectComment
	
	/**
	 * 숙제 업데이트
	 * by 영근
	 */
	public boolean updateHomework(FinishHwVO fvo) {
		boolean flag= false;
		
		SqlSession ss= getSessionFactory().openSession();
		int cnt = ss.update("updateHomework",fvo);
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}//updateHomework
	
	/**
	 * 리더, 모집상태 변경
	 * by 영근
	 */
	public boolean updateRecruit(RecruitVO rvo) {
		boolean flag = false;
		
		SqlSession ss= getSessionFactory().openSession();
		int cnt = ss.update("updateRecruit", rvo);
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 해당 스터디의 전체 맴버를 조회하는 메서드
	 * by 영근
	 */
	public List<NickAndId> selectMember(String sNum) {
		List<NickAndId> list = null;
		
		SqlSession ss= getSessionFactory().openSession();
		list = ss.selectList("selectAllMember",sNum);
		ss.close();
		
		return list;
	}
	
	/**
	 * nick으로 id 조회하는 메서드
	 * by 영근
	 */
	public String selectIdByNick(String nick) {
		
		SqlSession ss= getSessionFactory().openSession();
		String id = ss.selectOne("selectIdByNick", nick);
		ss.close();
		
		return id;
	}
	
	/**
	 * 스터디 공지 등록 시 과제 등록하기
	 * by 영근
	 */
	public boolean insertNewHw(NewHomeworkVO nhwvo) {
		boolean flag = false;
		
		SqlSession ss= getSessionFactory().openSession();
		int cnt = ss.insert("insertNewHw",nhwvo);
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 스터디 공지를 작성하는 메서드
	 * by 영근
	 */
	public boolean insertNewSn(NewStudyNoticeVO nsnvo) {
		boolean flag = false;
		
		SqlSession ss= getSessionFactory().openSession();
		int cnt = ss.insert("insertNewSn", nsnvo);
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 가장 최근 스터디공지가 등록되었을 때
	 * sn_num을 반환하는 메서드
	 * by 영근
	 */
	public String selectLatestSnNum(String s_num) {
		String sn_num = "";
		
		SqlSession ss= getSessionFactory().openSession();
		sn_num = ss.selectOne("selectLatestSnNum", s_num);
		ss.close();
		
		return sn_num;
	}
	
	/**
	 * 알람을 추가하는 메서드
	 * by 영근
	 */
	public boolean insertNewSnAlarm(SnAlarmVO savo) {
		boolean flag = false;
		
		SqlSession ss= getSessionFactory().openSession();
		int cnt = ss.insert("insertNewSnAlarm",savo);
		if (cnt == 1) {
			flag = true;
			ss.commit();
		}
		ss.close();
		
		return flag;
	}
	
	/**
	 * 리더의 스터디 공지 리스트페이지에서 보여줄 제목과 모집상태를 반환하는 메서드
	 * by 영근
	 */
	public StudyNameAndRecruit selectStudyNameAndRecruit(String s_num) {
		StudyNameAndRecruit snar = null;
		
		SqlSession ss= getSessionFactory().openSession();
		snar = ss.selectOne("selectStudyNameAndRecruit", s_num);
		ss.close();
		
		return snar;
	}
	
	
	
	
	public static void main(String[] args) {//테스트
		StudyNoticeDAO sn_dao= new StudyNoticeDAO();
		//sn_dao.selectSnList("s_000041");//카티션 곱 
		//sn_dao.selectDetailSn("sn_000042");// 
		//sn_dao.selectHomework("sn_000041"); //과제
		//sn_dao.selectComment("sn_000084");// 댓글
		
	}
	
}//class
