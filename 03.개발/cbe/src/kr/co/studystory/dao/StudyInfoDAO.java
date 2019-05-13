package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.domain.LeaderOfJoinDomain;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.domain.ThumbnailDomain;
import kr.co.studystory.domain.WriterInfoDomain;
import kr.co.studystory.vo.DetailMenuVO;
import kr.co.studystory.vo.FavFlagVO;
import kr.co.studystory.vo.FavSNumFlagVO;
import kr.co.studystory.vo.FavStudyOrderVO;
import kr.co.studystory.vo.JoinAlarmVO;
import kr.co.studystory.vo.JoinFormVO;
import kr.co.studystory.vo.MainFavListVO;
import kr.co.studystory.vo.ReplyVO;
import kr.co.studystory.vo.SearchListVO;

/**
 * study_info에 관한 DAO.
 * 
 * @author 재현
 *
 */
@Component
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

	//////////////////////////////////// Singleton

	/**
	 * 스터디의 상세 정보를 조회하는 메서드.
	 * 
	 * @param id
	 * @return StudyInfoDomain
	 */
	public StudyInfoDomain selectStudyInfo(String s_num) {
		StudyInfoDomain s_info = null;
		SqlSession ss = getSessionFatory().openSession();
		s_info = ss.selectOne("selectDetailStudy", s_num);
		s_info.setFavNum(ss.selectOne("selectFavNum", s_num));
		s_info.setMemberNum(ss.selectOne("selectMemberNum", s_num));
		ss.close();
		return s_info;
	}// selectStudyInfo

	/**
	 * 가입된 멤버인지 확인하는 메서드 by 영근
	 */
	public boolean selectAmIMember(DetailMenuVO dmvo) {
		boolean flag = false;
		SqlSession ss = getSessionFatory().openSession();
		int cnt = ss.selectOne("selectAmIMember", dmvo);
		if (cnt == 1) {
			flag = true;
		} // end if
		return flag;
	}// selectAmIMember

	/**
	 * 가입신청 했는지 확인하는 메서드 by 영근
	 */
	public boolean selectAmIPended(DetailMenuVO dmvo) {
		boolean flag = false;

		SqlSession ss = getSessionFatory().openSession();
		int cnt = ss.selectOne("selectAmIPended", dmvo);

		if (cnt == 1) {
			flag = true;
		}

		return flag;
	}// selectAmIPended

	/**
	 * 스터디 리더인지 (만들었는지) 확인하는지 메서드 by 영근
	 */
	public boolean selectDidIMade(DetailMenuVO dmvo) {
		boolean flag = false;

		SqlSession ss = getSessionFatory().openSession();
		int cnt = ss.selectOne("selectDidIMade", dmvo);

		if (cnt == 1) {
			flag = true;
		}

		return flag;
	}// selectDidIMade

	/**
	 * 상세 스터디의 댓글 List를 조회하는 메서드.
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

	/**
	 * 댓글의 갯수 구하기.
	 * @param s_num
	 * @return
	 */
	public int selectScommentCnt(String s_num) {
		int cnt = 0;
		SqlSession ss = getSessionFatory().openSession();
		cnt = ss.selectOne("selectScommentCnt", s_num);
		return cnt;
	}// selectScommentCnt
	
	/**
	 * 상세 스터디의 댓글을 insert하고 정상 동작시 입력한 유저의 이미지 파일명 반환 메서드.
	 * 
	 * @return int count
	 */
	public WriterInfoDomain insertComment(ReplyVO r_vo) {
		WriterInfoDomain wid = null;
		int cnt = 0;
		SqlSession ss = getSessionFatory().openSession();
		cnt = ss.insert("insertComment", r_vo);
		// 1개 행이 정상적으로 입력 되었을 때.
		if (cnt == 1) {
			wid = ss.selectOne("selectWriterInfo", r_vo);
			ss.commit();
		} // end if
		ss.close();
		return wid;
	}// insertComment

	/**
	 * 스터디 참여하기의 리더 정보 조회.
	 * 
	 * @return LeaderOfJoinDomain
	 */
	public LeaderOfJoinDomain selectLeaderOfJoin(String s_num) {
		LeaderOfJoinDomain loj = null;
		SqlSession ss = getSessionFatory().openSession();
		loj = ss.selectOne("selectLeaderOfJoin", s_num);
		ss.close();
		return loj;
	}// selectLeaderOfJoin

	/**
	 * 스터디 참여하기 insert
	 * 
	 * @return
	 */
	public boolean insertJoinForm(JoinFormVO jf_vo) {
		boolean flag = false;
		SqlSession ss = getSessionFatory().openSession();
		JoinAlarmVO ja_vo = new JoinAlarmVO("스터디", "스터디 신청완료", "\"" + jf_vo.getStudyName() + "\"에 가입 신청이 완료되었습니다.\n가입 신청이 수락되면 알림으로 알려드리겠습니다.", jf_vo.getJoinerId());
		String joinerNick = ss.selectOne("selectJoinerNick", jf_vo.getJoinerId());
		JoinAlarmVO ja_vo2 = new JoinAlarmVO("스터디", "스터디 가입요청", "\"" + joinerNick + "\"님께서 " + jf_vo.getStudyName() + "에 가입 신청을 하셨습니다.", jf_vo.getLeaderNick());
		int cnt = ss.insert("insertJoinFormVO", jf_vo);
		cnt += ss.insert("insertJoinerAlarm", ja_vo);
		cnt += ss.insert("insertLeaderAlarm", ja_vo2);
		if (cnt == 3) {
			ss.commit();
			flag = true;
		} // end if
		ss.close();
		return flag;
	}// insertJoin

	/************************************************ 메인 / 썸네일 / 검색. **/

	/**
	 * 메인 페이지의 썸네일 리스트 조회 하는 메서드.
	 * 
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> selectFavThList(MainFavListVO mfl_vo) {
		List<ThumbnailDomain> list = null;
		SqlSession ss = getSessionFatory().openSession();
		list = ss.selectList("selectFavThList", mfl_vo);
		ss.close();
		return list;
	}// selectHotStudies()

	/**
	 * 내가 좋아요한 썸네일 번호 조회.
	 * 
	 * @param my_id
	 * @return
	 */
	public boolean selectMyFavSNum(FavSNumFlagVO fsf_vo) {
		boolean flag = false;
		int cnt = 0;
		SqlSession ss = getSessionFatory().openSession();
		cnt = ss.selectOne("selectMyFavSNumCNT", fsf_vo);
		System.out.println("///////////////////////// dao : " + cnt);
		if (cnt == 1) {
			flag = true;
		} // end if
		ss.close();
		return flag;
	}// selectMyFavSNum

	/**
	 * 관심 스터디 썸네일의 갯수 조회.
	 * 
	 * @return
	 */
	public int selectFavStudyCnt(FavStudyOrderVO fso_vo) {
		int cnt = 0;
		SqlSession ss = getSessionFatory().openSession();
		cnt = ss.selectOne("selectFavStudyCnt", fso_vo);
		ss.close();
		return cnt;
	}// selectTotalThumbCnt

	/**
	 * 내 관심 스터디 썸네일 조회.
	 * 
	 * @param my_id
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> selectMyFavStudy(FavStudyOrderVO fso_vo) {
		List<ThumbnailDomain> list = null;
		SqlSession ss = getSessionFatory().openSession();
		list = ss.selectList("selectFavStudy", fso_vo);
		ss.close();
		return list;
	}// selectMyFavStudy

	/////////////////////////////////////// 하트 구현
	
	/**
	 * 관심 스터디로 인서트.
	 * 
	 * @param afs_vo
	 * @return
	 */
	public int insertFavStudy(FavFlagVO ff_vo) {
		int resultCnt = 0;
		SqlSession ss = getSessionFatory().openSession();
		System.out.println("///////////////////// 다오" + ff_vo.getsNum() + " / " + ff_vo.getColor() + " / " + ff_vo.getMy_id());

		resultCnt = ss.insert("insertFavStudy", ff_vo);
		// 정상적으로 추가가 되었을 경우 커밋하기.
		if (resultCnt == 1) {
			ss.commit();
		} // end if
		ss.close();
		return resultCnt;
	}// insertFavStudy

	/**
	 * 내 관심 스터디 제거.
	 * 
	 * @param sNum
	 */
	public int deleteFavStudy(FavFlagVO ff_vo) {
		int resultCnt = 0;
		SqlSession ss = getSessionFatory().openSession();
		System.out.println("///////////////////// 다오" + ff_vo.getsNum() + " / " + ff_vo.getColor() + " / " + ff_vo.getMy_id());

		resultCnt = ss.delete("deleteFavStudy", ff_vo);
		if (resultCnt == 1) {
			ss.commit();
		} // end if
		ss.close();
		return resultCnt;
	}// deleteFavStudy
	
	/////////////////////////////////////// 하트 구현


	/////////////////////////// 스터디 찾기

	/**
	 * 검색되는 썸네일의 갯수 조회.
	 * 
	 * @return
	 */
	public int selectSearchListCnt(SearchListVO sl_vo) {
		int cnt = 0;
		SqlSession ss = getSessionFatory().openSession();
		cnt = ss.selectOne("selectSearchListCnt", sl_vo);
		ss.close();
		return cnt;
	}// selectTotalThumbCnt

	/**
	 * 검색되는 썸네일 조회.
	 * 
	 * @param sl_vo
	 * @return
	 */
	public List<ThumbnailDomain> selectSearchList(SearchListVO sl_vo) {
		List<ThumbnailDomain> list = null;
		SqlSession ss = getSessionFatory().openSession();
		list = ss.selectList("selectSearchList", sl_vo);
		ss.close();
		return list;
	}// selectSearchList

	/////////////////////////// 스터디 찾기

}// class
