package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.domain.ThumbnailDomain;

/**
 * study_info에 관한 DAO.
 * 
 * @author 재현
 *
 */
public class StudyInfoDAO {

	private static StudyInfoDAO si_dao;
	private SqlSessionFactory ssf = null;

	private StudyInfoDAO() {
	}// 생성자.

	////////////////// Singleton

	public static StudyInfoDAO getInstance() {

		if (si_dao == null) {
			si_dao = new StudyInfoDAO();
		} // end if

		return si_dao;
	}// getInstance

	/**
	 * Singleton으로 구현한 SqlSessionFactory 반환 메서드.
	 * 
	 * @return SqlSessionFactory
	 */
	public synchronized SqlSessionFactory getSessionFatory() {

		if (ssf == null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();
			Reader reader = null;
			try {
				// 1.설정용 xml 로딩.
				reader = Resources.getResourceAsReader("kr/co/studystory/dao/mybatis_config.xml");
				// 2. MyBatis Framework 생성.
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				// 3. DB와 연동된 객체 받기.
				ssf = ssfb.build(reader);
				// 4. Reader 연결끊기
				if (reader != null) {
					reader.close();
				} // end if
			} catch (IOException ie) {
				ie.printStackTrace();
			} // end catch
		} // end if

		return ssf;
	}// getSessionFatory

	////////////////// Singleton

	/**
	 * 메인 페이지의 썸네일 리스트 조회 하는 메서드.
	 * 
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> selectThumbnailList() {
		List<ThumbnailDomain> list = null;
		SqlSession ss = getSessionFatory().openSession();
		list = ss.selectList("selectThumbnailList");
		ss.close();
		return list;
	}// selectHotStudies()

	public boolean insertLikeStudy() {
		SqlSession ss = getSessionFatory().openSession();
		ss.close();
		return false;
	}// insertLikeStudy

	public boolean deleteLikeStudy() {
		SqlSession ss = getSessionFatory().openSession();
		ss.close();
		return false;
	}// insertLikeStudy

	/**
	 * 스터디의 상세 정보를 조회하는 메서드. - 수정 필요할 수도 있음...
	 * 
	 * @param id
	 * @return StudyInfoDomain
	 */
	public StudyInfoDomain selectStudyInfo(String s_num) {
		StudyInfoDomain s_info = null;
		SqlSession ss = getSessionFatory().openSession();
		s_info = ss.selectOne("selectDetailStudy", s_num);
		ss.close();
		return s_info;
	}// selectStudyInfo

	/**
	 * 상세 스터디의 댓들 List를 조회하는 메서드.
	 * 
	 * @return List<StudyCommentDomain>
	 */
	public List<StudyCommentDomain> selectSCommentList(String s_num) {
		List<StudyCommentDomain> list = null;
		SqlSession ss = getSessionFatory().openSession();
		list = ss.selectList("selectStudyCommentList", s_num);
		ss.close();
		return list;
	}// selectSCommentList

	////////////////// 단위 테스트
	public static void main(String[] args) {
		List<ThumbnailDomain> list = null;
		list = StudyInfoDAO.getInstance().selectThumbnailList();
		System.out.println(list);
	}// main

}// class
