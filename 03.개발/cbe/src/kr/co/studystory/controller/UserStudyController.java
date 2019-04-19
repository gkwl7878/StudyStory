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
	
	@RequestMapping(value="")
	public String createStudyProcess(NewStudyVO ns_vo,HttpServletRequest request, Model model) {
		
		StudyGroupService sgs=new StudyGroupService();
		
		return "";
	}
}
