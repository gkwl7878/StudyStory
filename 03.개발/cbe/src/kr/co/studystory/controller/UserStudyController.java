package kr.co.studystory.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

import kr.co.studystory.service.StudyGroupService;
import kr.co.studystory.vo.NewStudyVO;

@Controller
public class UserStudyController {
	@RequestMapping(value="/study_group/create_study.do", method=GET )
	public String createStudyPage() {
		return "study_group/study_create";
	}//createStudyPage
	
	public String checkDupStudyName(String id) {
		
		return "";
	}
	
	@RequestMapping(value="/study_group/createStudy.do", method=GET)
	public String createStudyProcess(NewStudyVO ns_vo,HttpServletRequest request, Model model) {
		
		StudyGroupService sgs=new StudyGroupService();
		sgs.addNewStudy(ns_vo);
		
		String studyName=request.getParameter("studyName");
		String loc=request.getParameter("loc");
		String category=request.getParameter("category");
		String content=request.getParameter("content");
		String img=request.getParameter("img");
		String id=request.getParameter("id");
	
		model.addAttribute("studyName",studyName);
		model.addAttribute("loc",loc);
		model.addAttribute("category",category);
		model.addAttribute("content",content);
		model.addAttribute("img",img);
		model.addAttribute("id",id);
		
		
		return "study_create_request";
	}
}
