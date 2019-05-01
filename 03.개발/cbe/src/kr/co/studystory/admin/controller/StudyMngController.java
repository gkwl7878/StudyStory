package kr.co.studystory.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.admin.domain.DetailStudy;
import kr.co.studystory.admin.domain.StudyInfo;
import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.service.StudyAndUserService;
import kr.co.studystory.admin.vo.DeleteStudyVO;
import kr.co.studystory.admin.vo.DetailStudyVO;
import kr.co.studystory.admin.vo.StudyBoardVO;
import kr.co.studystory.admin.vo.StudyDetailVO;

@Controller
public class StudyMngController {
	
	@Autowired
	private CommonMngService cms;
	@Autowired
	private StudyAndUserService saus;
	
	/** 스터디 페이지 조회해서 띄우기
	 * @param uvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/study_mng.do", method= GET)
	private String userMngPage(StudyBoardVO sb_vo,Model model) {
		int totalCount=cms.sTotalCount(sb_vo);
		int pageScale=cms.pageScale();
		int totalPage=cms.totalPage(totalCount);
		if(sb_vo.getCurrPage()==0) {
			sb_vo.setCurrPage(1);
		}
		
		int startNum= cms.startNum(sb_vo.getCurrPage());
		int endNum= cms.endNum(startNum);
		
		int pageIndexNum= cms.pageIndexNum();
		int startPage= cms.startPage(sb_vo.getCurrPage(), pageIndexNum);
		int endPage= cms.endPage(startPage, pageIndexNum, totalPage);
		
		sb_vo.setBegin(startNum);
		sb_vo.setEnd(endNum);
		List<StudyInfo> list= saus.searchStudyInfo(sb_vo);
		
		model.addAttribute("forwardFlag", false);
		model.addAttribute("backwardFlag", false);
		model.addAttribute("pageIndexNum", pageIndexNum);
		model.addAttribute("searchCondition", sb_vo.getSearchCondition());
		model.addAttribute("searchWord", sb_vo.getSearchWord());
		
		
		if(sb_vo.getCurrPage()> pageIndexNum) {
			model.addAttribute("forwardFlag", true);
		}
		
		if(totalPage> endPage) {
			model.addAttribute("backwardFlag", true);
		}
		
		model.addAttribute("sList",list);
		model.addAttribute("pageScale",pageScale);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currPage",sb_vo.getCurrPage());
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("activeFlag","sActiveFlag");
		
		return "/admin/study_mng";
	}
	
	@RequestMapping(value="/admin/study_detail.do",method=GET)
	public String studyDetailPage(StudyDetailVO sd_vo, Model model,HttpServletRequest request) {
		DetailStudy ds= saus.searchDetailStudy(sd_vo.getsNum());
		
		//studyName, id, nick, category,loc,inputDate, img, content, memberNum
		model.addAttribute("studyName",ds.getStudyName());
		model.addAttribute("id",ds.getId());
		model.addAttribute("nick",ds.getNick());
		model.addAttribute("category",ds.getCategory());
		model.addAttribute("loc",ds.getLoc());
		model.addAttribute("inputDate",ds.getInputDate());
		model.addAttribute("img",ds.getImg());
		model.addAttribute("content",ds.getContent());
		model.addAttribute("memberNum",ds.getMemberNum());
		
		return "/admin/detail_study_info";
	}
	
	/**
	 * 스터디 수정
	 * @param ds_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/mod_study_proc.do", method=GET)
	public String modifyStudyProcess(DetailStudyVO ds_vo,Model model) {
		
		
		return "/admin/detail_study_info";
	}
	
	/**
	 * 스터디 삭제 페이지
	 * @param sNum
	 * @return
	 */
	@RequestMapping(value="/admin/remove_study_page.do/", method=GET)
	public String removeStudyPage(String sNum) {
		
		return "/admin/study_del";
	}
	
	/**
	 * 스터디 삭제 작업
	 * @param ds_vo
	 * @return
	 */
	@RequestMapping(value="/admin/remove_study_proc.do",method=GET)
	public String removeStudyProcess(DeleteStudyVO ds_vo) {
		
		return "/admin/study_mng";
	}
	
}
