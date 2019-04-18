package kr.co.studystory.controller;
//리더 공지사항 컨트롤러 정미

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeaderSnController {

	@RequestMapping(value="/study_notice/notice_list_leader.do", method=RequestMethod.GET)
	public String leaderSnList(String s, Model m) {
		return "study_notice/notice_list_leader";
	}//leaderSnList
	
}//class
