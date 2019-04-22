package kr.co.studystory.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.studystory.admin.domain.NewStudyInfo;
import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.service.StudyAndUserService;
import kr.co.studystory.admin.vo.NsBoardVO;
import kr.co.studystory.admin.vo.NsDetailVO;


@Controller
public class NewStudyMngController {
	/**
	 * newStudy 페이지의 리스트를 띄우는 컨트롤러
	 * @param nb_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/new_study.do", method=RequestMethod.POST)
	public String nsMngPage(NsBoardVO nb_vo, Model model) {
		CommonMngService cms= new CommonMngService();
		int totalCount=cms.nsTotalCount();
		int pageScale=cms.pageScale();
		int totalPage=cms.totalPage(totalCount);
		if(nb_vo.getCurrPage()==0) {
			nb_vo.setCurrPage(1);
		}
		
		System.out.println(nb_vo.getCurrPage()+"====================");
		
		int startNum= cms.startNum(nb_vo.getCurrPage());
		int endNum= cms.endNum(startNum);
		
		nb_vo.setBegin(startNum);
		nb_vo.setEnd(endNum);
		
		StudyAndUserService saus= new StudyAndUserService();
		List<NewStudyInfo> list= saus.searchNewStudy(nb_vo);
		String indexList=cms.indexList(nb_vo.getCurrPage(), totalPage, "new_study.do");
		model.addAttribute("nsList",list);
		model.addAttribute("indexList",indexList);
		model.addAttribute("pageScale",pageScale);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currentPage",nb_vo.getCurrPage());
		
		return "/admin/new_study_mng";
	}
	
	@RequestMapping(value="/admin/ns_detail.do",method=RequestMethod.GET)
	public String nsDetailPage(NsDetailVO nd_vo,Model model) {
		
		return "/admin/new_study_detail";
	}
	
	
}
