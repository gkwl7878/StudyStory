package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.domain.StudyCommentDomain;
import kr.co.studystory.domain.StudyInfoDomain;
import kr.co.studystory.service.StudyInfoService;

/**
 * 스터디 상세정보, 스터디 참여신청, 게시판 페이지로 이동하는 Controller 클래스.
 * 
 * @author 재현
 *
 */
@Controller
public class StudyInfoController {

	@RequestMapping(value = "study_info/study_info.do", method = GET)
	public String studyInfoPage(String s_num, HttpSession session, Model model) {

		StudyInfoService sis = new StudyInfoService();

		StudyInfoDomain sInfo = sis.getStudyInfo("s_000042"); // 스터디 상세 정보 가져오기.
		List<StudyCommentDomain> sCommentList = sis.getStudyComment("s_000042"); // 스터디 상세정보의 댓글 List 가져오기.

		model.addAttribute("s_Info", sInfo); // 스터디 상세정보 model에 담기.
		model.addAttribute("sCommentList", sCommentList); // 댓글 list 모델에 담기.

		return "study_info/detailStudy";
	}// studyInfoPage()

	public String addComment() {

		return "";
	}// addComment()

	public String joinPage() {

		return "";
	}// joinPage()

	public String joinProcess() {

		return "";
	}// joinProcess()

}
