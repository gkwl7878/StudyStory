package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.domain.ThumbnailDomain;
import kr.co.studystory.service.StudyInfoService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

/**
 * 
 * 메인 페이지, 검색 결과, 내가 좋아하는 스터디 페이지로 이동하는 Controller 클래스.
 * 
 * @author 재현
 *
 */
@Controller
public class StudySearchController {

	@RequestMapping(value = "/main/main.do", method = GET)
	public String mainPage(Model model) {

		StudyInfoService sis = new StudyInfoService();
		// 썸네일 리스트 생성.
		List<ThumbnailDomain> list = sis.getThumbnailList();
		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);

		return "study_info/main";
	}// mainPage

	/**
	 * 조건 검색.
	 * @return
	 */
	@RequestMapping(value = "search/search.do", method = GET)
	public String conditionSearchPage() {
		
		return "study_info/search";
	}// conditionSearchPage

	public String likeOrDislikeProcess() {

		return "";
	}// likeOrDislikeProcess

	public String WordSearchedPage() {

		return "";
	}// WordSearchedPage


	public String studyLikedPage() {

		return "";
	}// studyLikedPage

}// class
