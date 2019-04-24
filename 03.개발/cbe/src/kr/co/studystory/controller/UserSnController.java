package kr.co.studystory.controller;
////유저공지사항 컨트롤러 정미

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.studystory.domain.StudyNotice;
import kr.co.studystory.service.StudyNoticeService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class UserSnController {
	@Autowired
	private StudyNoticeService sns;
	
	@RequestMapping(value="/study_notice/notice_list.do",method=GET)
	public  String userSnList(@RequestParam(required=false,defaultValue="s_000041") String s_num, Model model) {
		
		List<StudyNotice>snList= sns.getSnList(s_num);
		
		model.addAttribute("snList", snList);
		
		return "study_notice/notice_list";
	}//userSnList
	
	@RequestMapping(value="/study_notice/notice_detail.do", method=GET)
	public String userDetailSn(String s, Model model) {
		
		
		
		return "study_notice/notice_detail";
	}//userDetailSn
	
	
	
}//class
