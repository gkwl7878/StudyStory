package kr.co.studystory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

import kr.co.studystory.service.StudyGroupService;
import kr.co.studystory.vo.NewStudyVO;

@Controller
@Component
public class UserStudyController {
	@Autowired
	private StudyGroupService sgs;
	
	@RequestMapping(value="/study_group/create_study.do", method=GET )
	public String createStudyPage() {
		return "study_group/study_create";
	}//createStudyPage
	
	public String checkDupStudyName(String id) {
		
		return "";
	}//checkDupStudyName
	
	@RequestMapping(value="/study_group/createStudy.do", method=GET)
	public String createStudyProcess(NewStudyVO ns_vo,HttpSession session,HttpServletRequest request, Model model) {
		
		
		String id=(String)session.getAttribute("id");
		ns_vo.setId(id);
		
		//이미지업로드
		
		if(sgs.addNewStudy(ns_vo)) {
			
		}
		

		
		//session:아이디얻기
		
		
		return "study_create_request";
	}//createStudyProcess
	
	@RequestMapping(value="/study_group/modify_study.do", method=GET )
	public String modifyStudyPage() {
		return "study_group/study_modify";
	}//createStudyPage
	
/*	@RequestMapping(value="/study_group/createStudy.do", method=GET)
	public String modifyStudyProcess(ModifiedStudyVO ms_vo,HttpServletRequest request, Model model) {
		
		StudyGroupService sgs=new StudyGroupService();
		sgs.modifyStudy(ms_vo);
		
		String content=request.getParameter("content");
		String img=request.getParameter("img");
		String s_num=request.getParameter("s_num");
	
		model.addAttribute("content",content);
		model.addAttribute("img",img);
		model.addAttribute("s_num",s_num);
		
		
		return "";
	}//createStudyProcess
	*/
	
	
	
	
	
	
	
	
	
	
	
	
}//class

















