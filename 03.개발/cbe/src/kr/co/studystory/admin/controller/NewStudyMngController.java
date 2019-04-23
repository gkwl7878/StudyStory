package kr.co.studystory.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.studystory.admin.domain.DetailNewStudyInfo;
import kr.co.studystory.admin.domain.NewStudyInfo;
import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.service.StudyAndUserService;
import kr.co.studystory.admin.vo.NsBoardVO;
import kr.co.studystory.admin.vo.NsDetailVO;


@Controller
public class NewStudyMngController {
	
	@Autowired
	private CommonMngService cms;
	@Autowired
	private StudyAndUserService saus;
	
	/**
	 * newStudy 페이지의 리스트를 띄우는 컨트롤러
	 * @param nb_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/new_study.do", method=RequestMethod.POST)
	public String nsMngPage(NsBoardVO nb_vo, Model model) {
		int totalCount=cms.nsTotalCount();
		int pageScale=cms.pageScale();
		int totalPage=cms.totalPage(totalCount);
		if(nb_vo.getCurrPage()==0) {
			nb_vo.setCurrPage(1);
		}
		
		int startNum= cms.startNum(nb_vo.getCurrPage());
		int endNum= cms.endNum(startNum);
		int pageIndexNum= cms.pageIndexNum();
		int startPage= cms.startPage(nb_vo.getCurrPage(), pageIndexNum);
		int endPage= cms.endPage(startPage, pageIndexNum, totalPage);
		
		nb_vo.setBegin(startNum);
		nb_vo.setEnd(endNum);
		
		List<NewStudyInfo> list= saus.searchNewStudy(nb_vo);
		
		model.addAttribute("nsList",list);
		model.addAttribute("pageScale",pageScale);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currentPage",nb_vo.getCurrPage());
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
		return "/admin/new_study_mng";
	}
	
	@RequestMapping(value="/admin/ns_detail.do",method=RequestMethod.GET)
	public String nsDetailPage(NsDetailVO nd_vo,Model model) {
		DetailNewStudyInfo dnsi= saus.detailNewStudy(nd_vo.getsNum());
		model.addAttribute("id",dnsi.getId());
		model.addAttribute("category",dnsi.getCategory());
		model.addAttribute("content",dnsi.getContent());
		model.addAttribute("img",dnsi.getImg());
		model.addAttribute("inputDate",dnsi.getInputDate());
		model.addAttribute("loc",dnsi.getLoc());
		model.addAttribute("studyName",dnsi.getStudyName());
		
		return "/admin/new_study_detail";
	}
	
	
}
