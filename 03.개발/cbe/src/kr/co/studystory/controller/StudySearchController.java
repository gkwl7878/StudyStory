package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
/**
 * 
 * 메인 페이지, 검색 결과, 내가 좋아하는 스터디 페이지로 이동하는 Controller 클래스.
 * 
 * @author 재현
 *
 */
@Controller
public class StudySearchController {

	@RequestMapping(value="/study_info/main.do", method= { GET, POST })
	public String mainPage(Model model) {

		return "study_info/main";
	}// mainPage

	public String likeOrDislikeProcess() {

		return "";
	}// likeOrDislikeProcess

	public String WordSearchedPage() {

		return "";
	}// WordSearchedPage

	public String conditionSearchPage() {

		return "";
	}// conditionSearchPage

	public String studyLikedPage() {

		return "";
	}// studyLikedPage

}// class
