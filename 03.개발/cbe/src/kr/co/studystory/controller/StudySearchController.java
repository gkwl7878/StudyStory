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
import kr.co.studystory.vo.FavFlagVO;
import kr.co.studystory.vo.FavSNumFlagVO;
import kr.co.studystory.vo.FavStudyOrderVO;
import kr.co.studystory.vo.MainFavListVO;
import kr.co.studystory.vo.MainLatestListVO;
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
	public String mainPage(MainFavListVO mfl_vo, MainLatestListVO mll_vo, Model model, HttpSession session) {

		// 세션이 만료 되었다면 로그인 페이지로.
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		} // end if

		if (mfl_vo.getFavStartNum() == 0) {
			mfl_vo.setFavStartNum(1);
		} // end if

		if (mfl_vo.getFavEndNum() == 0) {
			mfl_vo.setFavEndNum(4);
		} // end if

		if (mll_vo.getLatestStartNum() == 0) {
			mll_vo.setLatestStartNum(1);
		} // end if

		if (mll_vo.getLatestEndNum() == 0) {
			mll_vo.setLatestEndNum(4);
		} // end if

		// 썸네일 리스트 생성.
		List<ThumbnailDomain> favList = sis.getFavThList(mfl_vo);
		List<ThumbnailDomain> latestList = sis.getLatestThList(mll_vo);

		System.out.println("////////////////////////// 컨트롤 : " + favList);
		System.out.println("////////////////////////// 컨트롤 : " + latestList);

		// model 객체에 값 저장.
		model.addAttribute("favList", favList);
		model.addAttribute("favCurPage", 1);
		model.addAttribute("latestList", latestList);
		model.addAttribute("latestCurPage", 1);

		return "study_info/main";
	}// mainPage

	//////////////////////////////////////////////////////////////////////////////////

	/**
	 * 메인 페이지의 요청처리.
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mainProcess/mainProcess.do", method = GET, produces = "application/text; charset=utf8")
	public String mainProcess(MainFavListVO mfl_vo, MainLatestListVO mll_vo, HttpSession session, Model model) {
		JSONObject json = null;

		// 세션이 만료 되었다면 로그인 페이지로.
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		} // end if

		// 인기 스터디로부터의 요청일 경우.
		if (mll_vo.getLatestCurPage() == 0 && mfl_vo.getFavCurPage() != 0) {
			int startNum = sis.mainStartNum(mfl_vo.getFavCurPage()); // DB에서 조회할 현재 페이지의 게시물의 시작 번호.
			int endNum = sis.mainEndNum(startNum); // 현재 페이지의 게시물의 끝 번호

			// 요청으로 부터 들어오는 값을 VO에 설정함.
			mfl_vo.setFavStartNum(startNum); // 페이지 마다 조회할 시작 번호
			mfl_vo.setFavEndNum(endNum);// 페이지 마다 조회할 끝 번호.

			// JSON 얻기.
			json = sis.getMainFavListProcess(mfl_vo);
		} // end if

		// 최신 스터디로 부터 요청일 경우.
		if (mfl_vo.getFavCurPage() == 0 && mll_vo.getLatestCurPage() != 0) {
			int startNum = sis.mainStartNum(mll_vo.getLatestCurPage()); // DB에서 조회할 현재 페이지의 게시물의 시작 번호.
			int endNum = sis.mainEndNum(startNum); // 현재 페이지의 게시물의 끝 번호

			System.out.println("/////////////////////////////// 컨트롤" + startNum + "/ /" + endNum);

			// 요청으로 부터 들어오는 값을 VO에 설정함.
			mll_vo.setLatestStartNum(startNum); // 페이지 마다 조회할 시작 번호
			mll_vo.setLatestEndNum(endNum);
			;// 페이지 마다 조회할 끝 번호.

			// JSON 얻기.
			json = sis.getMainLatestListProcess(mll_vo);
		} // end if

		return json.toJSONString();
	} // mainAjax

	//////////////////////////////////////////////////////////////////////////////////

	/**
	 * 내 관심 스터디으로 부터의 요청 처리.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interest/show_interest_study.do", method = GET)
	public String studyLikedPage(FavStudyOrderVO fso_vo, Model model, HttpSession session) {

		// 세션이 만료 되었다면 로그인 페이지로.
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		} // end if

		String my_id = (String) session.getAttribute("id"); // 내 아이디 얻기.
		fso_vo.setMy_id(my_id);

		// 최초 호출시 초기화된 현재 페이지를 1페이지로 설정.
		if (fso_vo.getCurrentPage() == 0) {
			fso_vo.setCurrentPage(1);
		} // end if

		if (fso_vo.getFav_order_select() == null) {
			fso_vo.setFav_order_select("none");
		} // end if

		if (fso_vo.getFav_loc_select() == null) {
			fso_vo.setFav_loc_select("none");
		} // end if

		if (fso_vo.getFav_kind_select() == null) {
			fso_vo.setFav_kind_select("none");
		} // end if

		int totalCnt = sis.getFavStudyCnt(fso_vo);
		int totalPage = sis.totalPage(totalCnt); // 전체 게시물을 보여주기 위한 총 페이지의 수.
		int startNum = sis.startNum(fso_vo.getCurrentPage()); // DB에서 조회할 현재 페이지의 게시물의 시작 번호.
		int endNum = sis.endNum(startNum); // 현재 페이지의 게시물의 끝 번호

		int pageIndexNum = sis.pageIndexNum(); // 한 화면에 보여줄 페이지의 인덱스 수 얻기. - 3개.
		int startPage = sis.startPage(fso_vo.getCurrentPage(), pageIndexNum); // 페이지 인덱스의 첫 번호.
		int endPage = sis.endPage(startPage, pageIndexNum, totalPage); // 페이지 인덱스의 끝 번호.

		// 요청으로 부터 들어오는 값을 VO에 설정함.
		fso_vo.setStartNum(startNum); // 페이지 마다 조회할 시작 번호
		fso_vo.setEndNum(endNum); // 페이지 마다 조회할 끝 번호.
		List<ThumbnailDomain> list = sis.getMyFavStudy(fso_vo);

		// 페이지네이션의 URL을 설정 하기 위한 문자열
		String responseURL = "../interest/show_interest_study.do?fav_order_select=" + fso_vo.getFav_order_select() + "&fav_loc_select=" + fso_vo.getFav_loc_select() + "&fav_kind_select=" + fso_vo.getFav_kind_select();

		// 썸네일 리스트 생성.

		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("responseURL", responseURL);
		model.addAttribute("currentPage", fso_vo.getCurrentPage());
		model.addAttribute("pageIndexNum", pageIndexNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "study_info/show_interest_study";
	}// studyLikedPage

	/**
	 * 좋아요로 체크하기.
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/heartProcess/heartProcess.do", method = GET)
	public String heartProcess(FavFlagVO ff_vo, HttpSession session) {

		// 세션이 만료 되었다면 로그인 페이지로.
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		} // end if

		JSONObject json = null;
		String id = (String) session.getAttribute("id");

		System.out.println("///////////////////// 컨트롤 : " + ff_vo.getsNum() + " / " + ff_vo.getColor() + " / " + ff_vo.getMy_id());

		// vo에 아이디 설정하기.
		if (ff_vo.getMy_id() == null) {
			ff_vo.setMy_id(id);
		} // end if

		System.out.println("///////////////////// 컨트롤 - 제이슨 넣기 위한 : " + ff_vo.getsNum() + " / " + ff_vo.getColor() + " / " + ff_vo.getMy_id());
		json = sis.heartProcess(ff_vo);

		return json.toJSONString();
	}// heartProcess

	/**
	 * 스터디 찾기로 부터의 요청 처리.
	 * 
	 * @param sl_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search/search.do", method = GET)
	public String searchStudy(SearchListVO sl_vo, FavSNumFlagVO fsf_vo, Model model, HttpSession session) {

		// 세션이 만료 되었다면 로그인 페이지로.
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		} // end if

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
		int totalPage = sis.totalPage(totalCnt); // 전체 게시물을 보여주기 위한 총 페이지의 수. - 6개.
		int startNum = sis.startNum(sl_vo.getCurrentPage()); // DB에서 조회할 현재 페이지의 게시물의 시작 번호.
		int endNum = sis.endNum(startNum); // 현재 페이지의 게시물의 끝 번호

		int pageIndexNum = sis.pageIndexNum(); // 한 화면에 보여줄 페이지의 인덱스 수 얻기. - 3개.
		int startPage = sis.startPage(sl_vo.getCurrentPage(), pageIndexNum); // 페이지 인덱스의 첫 번호.
		int endPage = sis.endPage(startPage, pageIndexNum, totalPage); // 페이지 인덱스의 끝 번호.

		// 요청으로 부터 들어오는 값을 VO에 설정함.
		sl_vo.setStartNum(startNum); // 페이지 마다 조회할 시작 번호
		sl_vo.setEndNum(endNum); // 페이지 마다 조회할 끝 번호.
		List<ThumbnailDomain> list = sis.getSearchList(sl_vo, fsf_vo);

		// 페이지네이션의 URL을 설정 하기 위한 문자열
		String responseURL = "";
		if ("".equals(sl_vo.getSearch_inputBox())) { // 검색창을 이용하지 않았을 때.
			responseURL = "../search/search.do?order_select=" + sl_vo.getOrder_select() + "&loc_select=" + sl_vo.getLoc_select() + "&kind_select=" + sl_vo.getKind_select();
		} // end if

		if (!"".equals(sl_vo.getSearch_inputBox())) {
			responseURL = "search.do?order_select=" + sl_vo.getOrder_select() + "&loc_select=" + sl_vo.getLoc_select() + "&kind_select=" + sl_vo.getKind_select() + "&search_inputBox=" + sl_vo.getSearch_inputBox();
		} // end if

		// model 객체에 값 저장.
		model.addAttribute("thumbnail_list", list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("responseURL", responseURL);
		model.addAttribute("currentPage", sl_vo.getCurrentPage());
		model.addAttribute("inputWord", sl_vo.getSearch_inputBox());
		model.addAttribute("pageIndexNum", pageIndexNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "study_info/search";
	}// searchStudy

}// class
