package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.studystory.studyInfo.domain.ThumbnailDomain;

public class StudyInfoDAO {

	private static StudyInfoDAO si_dao;
	private SqlSessionFactory ssf = null;

	/**
	 * 싱글톤으로 클래스 생성자 설정.
	 */
	private StudyInfoDAO() {
	}// 생성자.

	public static StudyInfoDAO getInstance() {
		if (si_dao == null) {
			si_dao = new StudyInfoDAO();
		} // end if
		return si_dao;
	}// getInstance

	/**
	 * SqlSessionFactoryBuilder로 부터 ssf객체 받기.
	 * 
	 * @return SqlSessionFactory ssf
	 */
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

				if (reader != null) {
					reader.close();
				} // end if

			} catch (IOException ie) {
				ie.printStackTrace();
			} // end catch

		} // end if

		return ssf;
	}// getSessionFatory

	/////////////////////// 메인 페이지 ///////////////////////

	/**
	 * 재현 : DB에서 Thumbnail목록 조회하는 메서드.
	 * 
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> selectHotStudies() {
		List<ThumbnailDomain> list = null;

		return list;
	}// selectHotStudies()

	/////////////////////// 메인 페이지 ///////////////////////

}// class
