package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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

	public static StudyInfoDAO getInstance() {
		if (si_dao == null) {
			si_dao = new StudyInfoDAO();
		} // end if
		return si_dao;
	}// getInstance

	public synchronized SqlSessionFactory getSessionFatory() {

		if (ssf == null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();

			Reader reader = null;
			try {
				// 1.설정용 xml 로딩.
				reader = Resources.getResourceAsReader("kr/co/sist/dao/mybatis_config.xml");

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

	///////// 메인 페이지 /////////

	/**
	 * DB에서 Thumbnail목록 조회하는 메서드.
	 * 
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> selectHotStudies() {
		List<ThumbnailDomain> list = null;

		return list;
	}// selectHotStudies()

	/**
	 * "좋아요" DB에 insert 메서드.
	 * 
	 * @return boolean
	 */
	public boolean insertLikeStudy() {
		return false;
	}// insertLikeStudy

	/**
	 * "좋아요" 해제 했을 때 DB에 update 메서드.
	 * 
	 * @return boolean
	 */
	public boolean deleteLikeStudy() {
		return false;
	}// insertLikeStudy

	///////// 메인 페이지 /////////

	///////// 상세 스터디 페이지 /////////

	/**
	 * DB에서 스터디 상세 정보 조회.
	 * 
	 * @param id
	 * @return StudyInfo
	 */
	public StudyInfoDomain selectStudyInfo(String id) {
		StudyInfoDomain s_info = null;
		SqlSession ss = getSessionFatory().openSession();
		s_info = ss.selectOne("", "");
		return s_info;
	}// selectStudyInfo

	///////// 상세 스터디 페이지 /////////

}// class
