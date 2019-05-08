package kr.co.studystory.service;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyInfoDAO;
import kr.co.studystory.domain.LeaderOfJoinDomain;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.domain.ThumbnailDomain;
import kr.co.studystory.vo.AddFavStudyVO;
import kr.co.studystory.vo.DetailMenuVO;
import kr.co.studystory.vo.FavSNumFlagVO;
import kr.co.studystory.vo.FavStudyOrderVO;
import kr.co.studystory.vo.JoinFormVO;
import kr.co.studystory.vo.RemoveFavStudyVO;
import kr.co.studystory.vo.ReplyVO;
import kr.co.studystory.vo.SearchListVO;

@Component
public class StudyInfoService {

	@Autowired
	private StudyInfoDAO si_dao;

	/******************* Info 페이지들 서비스. *******************/

	/**
	 * 스터디 상세정보 얻기.
	 * 
	 * @param s_num
	 * @return StudyInfoDomain
	 */
	public StudyInfoDomain getStudyInfo(String s_num) {
		StudyInfoDomain s_info = null;
		s_info = si_dao.selectStudyInfo(s_num);
		return s_info;
	}// getStudyInfo

	/**
	 * 상세 페이지에서 가입한 유저인지 확인하는 메서드
	 */
	public boolean amIMember(DetailMenuVO dmvo) {
		return si_dao.selectAmIMember(dmvo);
	}

	/**
	 * 상세 페이지에서 가입신청한 유저인지 확인하는 메서드
	 */
	public boolean didIrequest(DetailMenuVO dmvo) {
		return si_dao.selectAmIPended(dmvo);
	}

	/**
	 * 상세 페이지에서 스터디를 만든 유저인지 확인하는 메서드
	 */
	public boolean amILeader(DetailMenuVO dmvo) {
		return si_dao.selectDidIMade(dmvo);
	}

	/**
	 * 스터디 상세 페이지의 댓글을 입력하기.
	 * 
	 * @param reply
	 */
	@SuppressWarnings("unchecked")
	public JSONObject addReply(ReplyVO r_vo) {
		JSONObject json = new JSONObject();
		String writerImg = "";
		String id = "";
		writerImg = si_dao.insertComment(r_vo);
		if (!"".equals(writerImg)) {
			System.out.println("/////////////// 서비스 : " + writerImg);
			json.put("result", true);
			json.put("img", writerImg);
			id = r_vo.getId().substring(0, 2) + "***";
			json.put("id", id);
		} // end if
		return json;
	}// addReply

	/**
	 * 스터디 댓글 리스트 얻기.
	 * 
	 * @param s_num
	 * @return List<StudyCommentDomain>
	 */
	public List<StudyCommentDomain> getStudyComment(String s_num) {
		List<StudyCommentDomain> list = null;
		list = si_dao.selectSCommentList(s_num);

		// 댓글을 입력한 사용자의 아이디 숨기기.
		String changedId = "";
		for (StudyCommentDomain scd : list) {
			changedId = scd.getId().substring(0, 2) + "***";
			scd.setId(changedId);
		} // end for

		return list;
	}// getStudyComment

	/**
	 * 스터디 참여의 리더의 기본 정보 얻기.
	 * 
	 * @param s_num
	 * @return LeaderOfJoinDomain
	 */
	public LeaderOfJoinDomain getLeaderOfJoin(String s_num) {
		LeaderOfJoinDomain loj = null;
		loj = si_dao.selectLeaderOfJoin(s_num);
		return loj;
	}// getLeaderOfJoin

	/**
	 * 참여자 신청서 추가하기
	 * 
	 * @return
	 */
	public boolean addJoinStudy(JoinFormVO jf_vo) {
		boolean flag = false;

		if (si_dao.insertJoinForm(jf_vo)) {
			flag = true;
		} // end if

		return flag;
	}// addJoinForm

	/******************* Search 페이지들 서비스. *******************/

	/**
	 * 내 관심 스터디 리스트 얻기.
	 * 
	 * @param my_id
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> getMyFavStudy(FavStudyOrderVO fso_vo) {
		List<ThumbnailDomain> list = null;

		list = si_dao.selectMyFavStudy(fso_vo);

		String changedNick = "";
		String changedStudyName = "";

		// 보여줄 글자 길이 조정.
		for (ThumbnailDomain td : list) {

			// 썸네일의 스터디 이름이 14자 이상일 경우 "..." 처리.
			if (td.getStudy_name().length() > 14) {
				changedStudyName = td.getStudy_name().substring(0, 14) + "...";
				td.setStudy_name(changedStudyName);
			} // end if

			// 썸네일의 nick의 길이가 3을 넘어가면 "..." 처리.
			if (td.getNick().length() > 3) {
				changedNick = td.getNick().substring(0, 3) + "...";
				td.setNick(changedNick);
			} // end if

		} // end for

		return list;
	}// getMyInterestStudy

	/**
	 * 좋아요 눌렀을 때.
	 * 
	 * @param afs_vo
	 * @return
	 */
	public boolean addLikeProcess(AddFavStudyVO afs_vo) {
		boolean addFlag = false;
		// 추가 되었다면 true.
		if (si_dao.insertFavStudy(afs_vo) == 1) {
			addFlag = true;
		} // end if
		return addFlag;
	}// addLikeProcess

	/**
	 * 좋아요 제거시.
	 * 
	 * @param sNum
	 * @return
	 */
	public boolean removeLikeProcess(RemoveFavStudyVO rfa_vo) {
		boolean removeFlag = false;

		// 제거에 성공했다면 true.
		if (si_dao.deleteFavStudy(rfa_vo) == 1) {
			removeFlag = true;
		} // end if

		return removeFlag;
	}// removeLikeProcess

	/**
	 * 썸네일 리스트 얻기.
	 * 
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> getThumbnailList(FavSNumFlagVO fsf_vo) {
		List<ThumbnailDomain> list = null;
		list = si_dao.selectThumbnailList();

		String changedNick = "";
		String changedStudyName = "";

		for (ThumbnailDomain td : list) {

			fsf_vo.setMyFavSNum(td.getS_num());

			System.out.println("//////////////////////////////// 서비스 : " + fsf_vo.getMyFavSNum());

			if (si_dao.selectMyFavSNum(fsf_vo)) {
				td.setFavFlag(true);
			} // end if

			// 썸네일의 스터디 이름이 14자 이상일 경우 "..." 처리.
			if (td.getStudy_name().length() > 14) {
				changedStudyName = td.getStudy_name().substring(0, 14) + "...";
				td.setStudy_name(changedStudyName);
			} // end if

			// 썸네일의 nick의 길이가 3을 넘어가면 "..." 처리.
			if (td.getNick().length() > 3) {
				changedNick = td.getNick().substring(0, 3) + "...";
				td.setNick(changedNick);
			} // end if

		} // end for

		return list;
	}// getThumbnailList

	//////////////////////////////////////// 스터디 찾기

	/**
	 * 총 게시물의 수를 얻는 메서드.
	 * 
	 * @return
	 */
	public int getSearchListCnt(SearchListVO sl_vo) {
		int cnt = 0;
		cnt = si_dao.selectSearchListCnt(sl_vo);
		return cnt;
	}// totalCount()

	/**
	 * 검색한 썸네일 리스트 얻기.
	 * 
	 * @param sl_vo
	 * @return
	 */
	public List<ThumbnailDomain> getSearchList(SearchListVO sl_vo, FavSNumFlagVO fsf_vo) {
		List<ThumbnailDomain> list = null;
		list = si_dao.selectSearchList(sl_vo);

		String changedNick = "";
		String changedStudyName = "";

		// 보여줄 글자 길이 조정.
		for (ThumbnailDomain td : list) {

			fsf_vo.setMyFavSNum(td.getS_num());

			if (si_dao.selectMyFavSNum(fsf_vo)) {
				td.setFavFlag(true);
			} // end if

			// 썸네일의 스터디 이름이 14자 이상일 경우 "..." 처리.
			if (td.getStudy_name().length() > 14) {
				changedStudyName = td.getStudy_name().substring(0, 14) + "...";
				td.setStudy_name(changedStudyName);
			} // end if

			// 썸네일의 nick의 길이가 3을 넘어가면 "..." 처리.
			if (td.getNick().length() > 3) {
				changedNick = td.getNick().substring(0, 3) + "...";
				td.setNick(changedNick);
			} // end if

		} // end for

		return list;
	}// getSearchList

	/**
	 * 한 페이지에 보여질 게시물의 수 얻는 메서드
	 * 
	 * @return
	 */
	public int pageScale() {
		int pageScale = 6;
		return pageScale;
	}// pageScale

	/**
	 * 게시판 한 화면에 보여질 게시물의 수 얻는 메서드
	 * 
	 * @param
	 * @return
	 */
	public int totalPage(int totalCount) {
		// 페이지 당 게시물이 하나 라도 있으면 페이지가 생성 되어야 함.
		// 전체 게시물에서 페이지당 보여줄 게시물의 수를 나눈뒤 올리을 해주기.
		int totalPage = (int) Math.ceil((totalCount / (double) pageScale()));
		return totalPage;
	}// totalPage

	/**
	 * 시작페이지 처음 번호 구하는 메서드.
	 * 
	 * @param currentPage
	 * @return
	 */
	public int startNum(int currentPage) {
		int startNum = 1;
		// 페이지 당 시작 번호는 1, 7, 13 ... 으로 되어야 한다.
		// 시작번호 = 6 ( 현재페이지의 게시물의 수 ) - 6 (한 화면에 보여질 게시물의수) + 1
		startNum = (currentPage * pageScale()) - pageScale() + 1;
		return startNum;
	}// startNum

	/**
	 * 선택한 인덱스 리스트에서 조회할 끝번호
	 * 
	 * @param startNum
	 * @return
	 */
	public int endNum(int startNum) {
		// 페이지당 끝 번호는 6, 12, 18 ... 으로 되어야 한다.
		// 현재 페이지의 게시물의 끝 번호 구하기.
		int endNum = startNum + pageScale() - 1;
		return endNum;
	} // endNum

	//////////////////////////////////////// 스터디 찾기

}// class
