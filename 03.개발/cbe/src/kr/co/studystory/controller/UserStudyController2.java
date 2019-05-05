package kr.co.studystory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.studystory.domain.MemberWithImg;
import kr.co.studystory.service.StudyGroupService2;

@Controller
public class UserStudyController2 {
	@Autowired
	private StudyGroupService2 sgs;

	@RequestMapping(value="/study_group/show_participants.do",method=RequestMethod.GET)
	public String studyMemberPage(String s_num, Model model) {
		List<MemberWithImg> mbwi=sgs.getMemberWithImg(s_num);
		
		
		model.addAttribute("total",mbwi.size());
		model.addAttribute("mbwi",mbwi );//멤버 (사진) 리스트
		//model.addAttribute("")//총 멤버수 dao에서 구해오기 
		
		return "study_group/show_participants";
	}//studyMemberPage
	
}

