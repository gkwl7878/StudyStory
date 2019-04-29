package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.studystory.domain.LeaderOfJoinDomain;
import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.service.StudyInfoService;
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

	/**
	 * 스터디 상세 정보 페이지로 부터의 요청 처리.
	 * 
	 * @param sNum
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/detail/detail_study.do", method = GET)
	public String studyInfoPage(String sNum, HttpSession session, Model model) {
		StudyInfoService sis = new StudyInfoService();
		StudyInfoDomain sInfo = sis.getStudyInfo(sNum); // 스터디 상세 정보 가져오기.
		List<StudyCommentDomain> sCommentList = sis.getStudyComment(sNum); // 스터디 상세정보의 댓글 List 가져오기.
		model.addAttribute("s_Info", sInfo); // 스터디 상세정보 model에 담기.
		model.addAttribute("sCommentList", sCommentList); // 댓글 list 모델에 담기.
		return "study_info/detailStudy";
	}// studyInfoPage()

	/**
	 * 스터디 상세 정보 페이지의 댓글로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@ResponseBody // DispatcherServlet을 거치지 않고 바로 응답.
	@RequestMapping(value = "/detail/add_reply.do", method=GET)
	public String studyInfoReply(ReplyVO r_vo, HttpSession session) {
		JSONObject json = null;
		StudyInfoService sis = new StudyInfoService();
		
		// 세션으로 댓글을 입력하는 사용자의 아이디 얻기.
		String user_id = (String) session.getAttribute("id");
		// VO에 set하기.
		r_vo.setId(user_id);
		
		// 값 확인 하기.
		System.out.println("/////////////////////////////////" + r_vo.getId() + "/" + r_vo.getReply() + "/" + r_vo.getsNum());
		
		json = sis.addReply(r_vo);
		return json.toJSONString();
	}// addComment()

	/**
	 * 스터디 가입 요청 페이지으로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/study_info/study_req_join.do", method = GET)
	public String joinPage(String sNum, Model model, HttpSession session) {
		StudyInfoService sis = new StudyInfoService();
		LeaderOfJoinDomain loj = sis.getLeaderOfJoin(sNum);

		// session.getAttribute는 속성의 값을 가져오는 것이다. - sessionScope을 사용하는 것이 아니다.
		String my_nick = (String) session.getAttribute("nick");

		// model에 값 저장.
		model.addAttribute("leader", loj);
		// session을 사용하는 것이 아니기 때문에 ${ sessionScope.my_nick }으로 사용 할 수 없다.
		model.addAttribute("my_nick", my_nick);

		return "study_info/study_join_req";
	}// joinPage()

	//////////////////////////////////////////////////////////////////// 이하 진행중.

	/**
	 * 스터디 참여 페이지의 Form으로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/study_info/join_process.do", method = POST)
	public String joinProcess(JoinFormVO jf_vo, HttpSession session) {

		System.out.println("/////////////////////////" + jf_vo.getIntroduce_ta() + " / " + jf_vo.getApply_ta());

		return "study_info/main"; // redirect로 이동해야 한다.
	}// joinProcess()

}// class
