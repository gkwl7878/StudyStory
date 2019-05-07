package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.studystory.domain.LeaderOfJoinDomain;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.service.StudyInfoService;
import kr.co.studystory.vo.DetailMenuVO;
import kr.co.studystory.vo.JoinFormVO;
import kr.co.studystory.vo.ReplyVO;

/**
 * 스터디 상세정보, 스터디 참여신청, 게시판 페이지로 이동하는 Controller 클래스.
 * 
 * @author 재현
 *
 */
@Controller
public class StudyInfoController {

	@Autowired
	private StudyInfoService sis;

	/**
	 * 스터디 상세 정보 페이지로 부터의 요청 처리.
	 * 보완수정 by 영근 190502
	 * @param sNum
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/detail/detail_study.do", method = GET)
	public String studyInfoPage(String sNum, HttpSession session, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		// 내 아이디로 이미 가입했는지, 가입수락대기중인지, 내가 만든 스터디인지 조회
		// 조회 결과에 따라 오른쪽 상단 화면을 다르게 보여줘야 함
		
		DetailMenuVO dmvo = new DetailMenuVO((String)session.getAttribute("id"), sNum);
		if (sis.amILeader(dmvo)) { // 만든 유저인지
			model.addAttribute("leaderFlag", true);
		} else if (sis.amIMember(dmvo)) { // 가입한 멤버인지
			model.addAttribute("memberFlag", true);
		} else if (sis.didIrequest(dmvo)) { // 스터디 신청했는지
			model.addAttribute("joinerFlag", true);
		}
		
		StudyInfoDomain sInfo = sis.getStudyInfo(sNum); // 스터디 상세 정보 가져오기.
		List<StudyCommentDomain> sCommentList = sis.getStudyComment(sNum); // 스터디 상세정보의 댓글 List 가져오기.
		
		model.addAttribute("s_Info", sInfo); // 스터디 상세정보 model에 담기.
		model.addAttribute("sCommentList", sCommentList); // 댓글 list 모델에 담기.
		
		return "study_info/detail_study";
	}// studyInfoPage()

	/*********************************** 진행중 ****/

	/**
	 * 스터디 상세 정보 페이지의 댓글로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@ResponseBody // DispatcherServlet을 거치지 않고 바로 응답.
	@RequestMapping(value = "/detail/add_reply.do", method = GET)
	public String studyInfoReply(ReplyVO r_vo, HttpSession session) {
		JSONObject json = null;

		// 세션으로 댓글을 입력하는 사용자의 아이디 얻기.
		String user_id = (String) session.getAttribute("id");
		// VO에 set하기.
		r_vo.setId(user_id);

		// 값 확인 하기.
		System.out.println("/////////////////////////////////" + r_vo.getId() + "/" + r_vo.getReply() + "/" + r_vo.getsNum());

		json = sis.addReply(r_vo);
		return json.toJSONString();
	}// addComment()

	/*********************************** 진행중 ****/

	/**
	 * 스터디 가입 요청 페이지으로 부터의 요청 처리.
	 * 보완수정 by 영근 190502
	 * @return
	 */
	@RequestMapping(value = "/study_info/study_req_join.do", method = GET)
	public String joinPage(String sNum, Model model, HttpSession session) {
		LeaderOfJoinDomain loj = sis.getLeaderOfJoin(sNum);

		// session.getAttribute는 속성의 값을 가져오는 것이다. - sessionScope을 사용하는 것이 아니다.
		String my_nick = (String) session.getAttribute("nick");

		// model에 값 저장.
		model.addAttribute("leader", loj);
		// session을 사용하는 것이 아니기 때문에 ${ sessionScope.my_nick }으로 사용 할 수 없다.
		model.addAttribute("my_nick", my_nick);

		return "study_info/study_join_req";
	}// joinPage()

	/**
	 * 스터디 참여 페이지의 Form으로 부터의 요청 처리.
	 * 보완수정 by 영근 190502
	 * @return
	 */
	@RequestMapping(value = "/study_info/join_process.do", method = POST)
	public String joinProcess(JoinFormVO jf_vo, Model model) {

		if(sis.addJoinStudy(jf_vo)) {
			model.addAttribute("joinReqSuccess", true);
		} else {
			model.addAttribute("joinReqFail",true);
		}

		return "forward:../study_info/main.do";
	}// joinProcess()

}// class
