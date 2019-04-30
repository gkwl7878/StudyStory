package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserStudyController2 {

	@RequestMapping(value="/study_group/show_participants.do",method=RequestMethod.GET)
	public String studyMemberPage(String sNum, Model model) {
		
		
		return "study_group/show_participants";
	}//studyMemberPage
	
}
