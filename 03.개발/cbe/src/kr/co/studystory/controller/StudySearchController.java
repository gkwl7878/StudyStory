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
import kr.co.studystory.vo.AddFavStudyVO;
import kr.co.studystory.vo.FavSNumFlagVO;
import kr.co.studystory.vo.FavStudyOrderVO;
import kr.co.studystory.vo.RemoveFavStudyVO;
import kr.co.studystory.vo.SearchListVO;

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
	public String mainPage(FavSNumFlagVO fsf_vo, Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		} // end if

		// id가 null인 경우.
		if (fsf_vo.getId() == null) {
			fsf_vo.setId(id);
		}// end if

		// 썸네일 리스트 생성.
		List<ThumbnailDomain> list = sis.getThumbnailList(fsf_vo);
		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);

		return "study_info/main";
	}// mainPage

	/**
	 * 내 관심 스터디으로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interest/show_interest_study.do", method = GET)
	public String studyLikedPage(FavStudyOrderVO fso_vo, Model model, HttpSession session) {

		if (fso_vo.getFav_order_select() == null) {
			fso_vo.setFav_order_select("none");
		} // end if

		if (fso_vo.getFav_loc_select() == null) {
			fso_vo.setFav_loc_select("none");
		} // end if

		if (fso_vo.getFav_kind_select() == null) {
			fso_vo.setFav_kind_select("none");
		} // end if

		String my_id = (String) session.getAttribute("id"); // 내 아이디 얻기.
		fso_vo.setMy_id(my_id);

		// 썸네일 리스트 생성.
		List<ThumbnailDomain> list = sis.getMyFavStudy(fso_vo);
		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);

		return "study_info/show_interest_study";
	}// studyLikedPage

	/**
	 * 좋아요로 체크하기.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/likeProcess/likeProcess.do", method = GET)
	public String likeProcess(AddFavStudyVO afs_vo, HttpSession session) {
		JSONObject json = new JSONObject();
		boolean resultFlag = false;

		String id = (String) session.getAttribute("id");// 접속자의 아이디 얻기.
		afs_vo.setMy_id(id);

		resultFlag = sis.addLikeProcess(afs_vo);
		json.put("resultFlag", resultFlag);
		return json.toJSONString();
	}// likeProcess

	/**
	 * 좋아요 버튼을 해제로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/dislikeProcess/dislikeProcess.do", method = GET)
	public String dislikeProcess(RemoveFavStudyVO rfa_vo, HttpSession session) {
		JSONObject json = new JSONObject();
		boolean resultFlag = false;

		String id = (String) session.getAttribute("id");// 접속자의 아이디 얻기.
		rfa_vo.setId(id);

		resultFlag = sis.removeLikeProcess(rfa_vo);
		json.put("resultFlag", resultFlag);
		return json.toJSONString();
	}// likeOrDislikeProcess

	/**
	 * 스터디 찾기로 부터의 요청 처리.
	 * 
	 * @param sl_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search/search.do", method = GET)
	public String searchStudy(SearchListVO sl_vo, FavSNumFlagVO fsf_vo, Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		fsf_vo.setId(id);
		
		System.out.println("////////////////////////컨트롤 : " + " 정렬/ " + sl_vo.getOrder_select() + " 지역/ " + sl_vo.getLoc_select() + " 종류/ " + sl_vo.getKind_select() + " 입력/ " + sl_vo.getSearch_inputBox());

		// 최초 호출시 초기화된 현재 페이지를 1페이지로 설정.
		if (sl_vo.getCurrentPage() == 0) {
			sl_vo.setCurrentPage(1);
		} // end if

		if (sl_vo.getOrder_select() == null) {
			sl_vo.setOrder_select("none");
		} // end if

		if (sl_vo.getLoc_select() == null) {
			sl_vo.setLoc_select("none");
		} // end if

		if (sl_vo.getKind_select() == null) {
			sl_vo.setKind_select("none");
		} // end if

		if (sl_vo.getSearch_inputBox() == null) {
			sl_vo.setSearch_inputBox("");
		} // end if

		int totalCnt = sis.getSearchListCnt(sl_vo); // 총 게시물의 수.
		int totalPage = sis.totalPage(totalCnt); // 전체 게시물을 보여주기 위한 총 페이지의 수.
		int startNum = sis.startNum(sl_vo.getCurrentPage()); // DB에서 조회할 현재 페이지의 게시물의 시작 번호.
		int endNum = sis.endNum(startNum); // 현재 페이지의 게시물의 끝 번호

		// 요청으로 부터 들어오는 값을 VO에 설정함.
		sl_vo.setStartNum(startNum); // 페이지 마다 조회할 시작 번호
		sl_vo.setEndNum(endNum); // 페이지 마다 조회할 끝 번호.

		// 페이지네이션의 URL을 설정 하기 위한 문자열
		String responseURL = "";
		if ("".equals(sl_vo.getSearch_inputBox())) { // 검색창을 이용하지 않았을 때.
			responseURL = "../search/search.do?order_select=" + sl_vo.getOrder_select() + "&loc_select=" + sl_vo.getLoc_select() + "&kind_select=" + sl_vo.getKind_select();
		} // end if

		if (!"".equals(sl_vo.getSearch_inputBox())) {
			responseURL = "search.do?order_select=" + sl_vo.getOrder_select() + "&loc_select=" + sl_vo.getLoc_select() + "&kind_select=" + sl_vo.getKind_select() + "&search_inputBox=" + sl_vo.getSearch_inputBox();
		} // end if

		List<ThumbnailDomain> list = sis.getSearchList(sl_vo, fsf_vo);

		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("responseURL", responseURL);
		model.addAttribute("currentPage", sl_vo.getCurrentPage());
		model.addAttribute("inputWord", sl_vo.getSearch_inputBox());

		return "study_info/search";
	}// searchStudy

}// class
