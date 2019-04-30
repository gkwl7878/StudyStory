package kr.co.studystory.service;

import java.util.List;

import org.json.simple.JSONObject;

import kr.co.studystory.dao.StudyInfoDAO;
import kr.co.studystory.domain.LeaderOfJoinDomain;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.domain.ThumbnailDomain;
import kr.co.studystory.vo.JoinAlarmVO;
import kr.co.studystory.vo.JoinFormVO;
import kr.co.studystory.vo.ReplyVO;

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

	public JSONObject getLatestThumbList() {
		JSONObject json = null;
		return json;
	}// getLatestThumbList

}// class
