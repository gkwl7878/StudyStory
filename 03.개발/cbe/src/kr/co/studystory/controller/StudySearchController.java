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

import kr.co.studystory.domain.ThumbnailDomain;
import kr.co.studystory.service.StudyInfoService;
import kr.co.studystory.vo.SearchSelectVO;

/**
 * 
 * 메인 페이지, 검색 결과, 내가 좋아하는 스터디 페이지로 이동하는 Controller 클래스.
 * 
 * @author 재현
 *
 */
@Controller
public class StudySearchController {

	@Autowired
	private StudyInfoService sis;

	/**
	 * 메인 페이지으로 부터의 요청 처리.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/study_info/main.do", method = { GET, POST })
	public String mainPage(Model model, HttpSession session) {

		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		// 썸네일 리스트 생성.
		List<ThumbnailDomain> list = sis.getThumbnailList();
		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);

		return "study_info/main";
	}// mainPage

	/**
	 * 스터디 찾기으로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/search/search.do", method = GET)
	public String conditionSearchPage(Model model) {

		// 썸네일 리스트 생성.
		List<ThumbnailDomain> list = sis.getThumbnailList();
		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);

		return "study_info/search";
	}// conditionSearchPage

	/**
	 * 내 관심 스터디으로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@RequestMapping(value = "study_info/show_interest_study.do", method = GET)
	public String studyLikedPage(Model model, HttpSession session) {
		String my_id = (String) session.getAttribute("id");
		// 썸네일 리스트 생성.
		List<ThumbnailDomain> list = sis.getMyInterestStudy(my_id);
		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);
		return "study_info/show_interest_study";
	}// studyLikedPage

	public String likeOrDislikeProcess() {

		return "";
	}// likeOrDislikeProcess

	/**
	 * 스터디 찾기 페이지에서 정렬으로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/search/search_order_process.do", method = GET)
	public String searchOrderProccess(String order) {
		JSONObject json = null;
		json = sis.getOrderedList(order);
		return json.toJSONString();
	}// searchOrderProccess

	/**
	 * 검색 페이지에서 조건 검색에 따른 요청 처리.
	 * 
	 * @param ss_vo
	 * @return
	 */
	@RequestMapping(value = "/search/search_process.do", method = GET)
	public String searchBtnProcess(SearchSelectVO ss_vo, Model model) {
		List<ThumbnailDomain> list = sis.getConditionalThumbList(ss_vo);
		model.addAttribute("thumbnail_list", list);
		return "study_info/search";
	}// searchBtnProcess

	/////////////////////////////////////////// 이하 진행 해야 할 부분.

	public String WordSearchedPage() {
		return "";
	}// WordSearchedPage

}// class
