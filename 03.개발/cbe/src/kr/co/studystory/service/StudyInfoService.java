package kr.co.studystory.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.studystory.dao.StudyInfoDAO;
import kr.co.studystory.domain.LeaderOfJoinDomain;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.domain.ThumbnailDomain;
import kr.co.studystory.vo.JoinAlarmVO;
import kr.co.studystory.vo.JoinFormVO;
import kr.co.studystory.vo.ReplyVO;
import kr.co.studystory.vo.SearchSelectVO;

public class StudyInfoService {

	private StudyInfoDAO si_dao;

	public StudyInfoService() {
		si_dao = StudyInfoDAO.getInstance();
	}// 생성자.

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
	 * 스터디 상세 페이지의 댓글을 입력하기.
	 * 
	 * @param reply
	 */
	@SuppressWarnings("unchecked")
	public JSONObject addReply(ReplyVO r_vo) {
		JSONObject json = new JSONObject();
		int cnt = si_dao.insertComment(r_vo);
		json.put("result", cnt == 1);
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
	public String addJoinForm(JoinFormVO jf_vo, JoinAlarmVO ja_vo) {
		String msg = "";
		if (si_dao.insertJoinForm(jf_vo, ja_vo) == 2) {
			msg = "참여 신청이 정상적으로 이루어 졌습니다.";
		} // end if
		return msg;
	}// addJoinForm

	/**
	 * 내 관심 스터디 리스트 얻기.
	 * 
	 * @param my_id
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> getMyInterestStudy(String my_id) {
		List<ThumbnailDomain> list = null;
		list = si_dao.selectMyFavStudy(my_id);
		// 썸네일의 nick의 길이가 3을 넘어가면 "..." 처리.
		String changedNick = "";
		for (ThumbnailDomain td : list) {
			if (td.getNick().length() > 3) {
				changedNick = td.getNick().substring(0, 3) + "...";
				td.setNick(changedNick);
			} // end if
		} // end for
		return list;
	}// getMyInterestStudy

	/******************* Search 페이지들 서비스. *******************/

	/**
	 * 썸네일 리스트 얻기.
	 * 
	 * @return List<ThumbnailDomain>
	 */
	public List<ThumbnailDomain> getThumbnailList() {
		List<ThumbnailDomain> list = null;
		list = si_dao.selectThumbnailList();
		// 썸네일의 nick의 길이가 3을 넘어가면 "..." 처리.
		ThumbnailDomain thumb_domain = null;
		String nick = "";
		for (int i = 0; i < list.size(); i++) {
			thumb_domain = list.get(i);
			nick = thumb_domain.getNick();
			if (nick.length() > 3) {
				nick = nick.substring(0, 3) + "...";
				thumb_domain.setNick(nick);
			} // end if
		} // end for
		return list;
	}// getThumbnailList

	/**
	 * 정 렬의 종류에 따라 세롭게 정렬된 썸네일을 얻는 메서드.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getOrderedList(String order) {

		JSONObject oneJsonObj = null; // 썸네일Domain의 각 값을 저장할 JSON객체.
		JSONArray jsonArr = null; // JSON객체를 담을 JSON배열.
		JSONObject typeJson = null; // JSON배열을 저장하고 리턴할 JSON객체.

		// 최신순으로 정렬.
		if ("최신순".equals(order)) {

			// DB에서 최신순으로 조회하기.
			List<ThumbnailDomain> list = si_dao.selectThumbLatest();

			// JSONObject에 담을 썸네일 선언.
			ThumbnailDomain thumb = null;

			// JSONObject를 담을 JSONArray
			jsonArr = new JSONArray();

			// list의 값을 JSONObject로 변환후 JSONArray에 담기.
			for (int i = 0; i < list.size(); i++) {
				oneJsonObj = new JSONObject();

				thumb = list.get(i);

				oneJsonObj.put("sNum", thumb.getsNum());
				oneJsonObj.put("studyName", thumb.getStudyName());
				oneJsonObj.put("loc", thumb.getLoc());
				oneJsonObj.put("category", thumb.getCategory());
				oneJsonObj.put("img", thumb.getImg());
				oneJsonObj.put("recruitment", thumb.getRecruitment());
				oneJsonObj.put("inputDate", thumb.getInputDate());
				oneJsonObj.put("nick", thumb.getNick());
				oneJsonObj.put("userImg", thumb.getUserImg());
				oneJsonObj.put("favFlag", thumb.isFavFlag());

				jsonArr.add(oneJsonObj);
			} // end for

			// 리턴할 JSON객체 생성.
			typeJson = new JSONObject();

			// JSON배열 담기.
			typeJson.put("latest_order", jsonArr);

			// 단위 테스트.
			System.out.println("/////////////////////// 서비스 json배열의 크기 : " + jsonArr.size());

		} // end if

		return typeJson;
	}// getLatestThumbList

	/**
	 * 검색 조건 VO를 받아 해당 썸네일 List를 얻는 메서드.
	 * 
	 * @param ss_vo
	 * @return
	 */
	public List<ThumbnailDomain> getConditionalThumbList(SearchSelectVO ss_vo) {
		List<ThumbnailDomain> list = null;

		list = si_dao.selectConditionalThumbList(ss_vo);
		
		return list;
	}// getConditionalThumbList

}// class
