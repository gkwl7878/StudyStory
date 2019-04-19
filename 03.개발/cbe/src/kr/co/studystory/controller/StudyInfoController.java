package kr.co.studystory.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 스터디 상세정보, 스터디 참여신청, 게시판 페이지로 이동하는 Controller 클래스.
 * 
 * @author 재현
 *
 */
@Controller
public class StudyInfoController {

	@RequestMapping(value="")
	public String studyInfoPage(String str, HttpSession session, Model model) {
		
		return "";
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
