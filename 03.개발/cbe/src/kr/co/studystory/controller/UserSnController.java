package kr.co.studystory.controller;
////유저공지사항 컨트롤러 정미

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.studystory.domain.DetailStudyNotice;
import kr.co.studystory.domain.Homework;
import kr.co.studystory.domain.SnComment;
import kr.co.studystory.domain.StudyNotice;
import kr.co.studystory.service.StudyNoticeService;
import kr.co.studystory.vo.NewCommentVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
	public String userDetailSn(String sn_num, Model model) {
		DetailStudyNotice dsn= sns.getDetailSn(sn_num);
		List<Homework> hwList = sns.getHomework(sn_num);
		List<SnComment> snCmt=sns.getComment(sn_num);
		
		model.addAttribute("snDetailList", dsn);
		model.addAttribute("hwList", hwList);
		model.addAttribute("snCmt", snCmt);
		
		System.out.println("---------------------------------------------"+sn_num);
		
		return "study_notice/notice_detail";
	}//userDetailSn
	
	public String finishHomework(String num, Model model) {
	
		
		
		return  "study_notice/notice_detail";//?????맞나
		
	}//finishHomework
	
	@RequestMapping(value="/study_notice/add_reply.do",method=GET)
	public String addComment(NewCommentVO ncvo, HttpSession hs,  Model model) {
		JSONObject json=null;
		/*json=sns.writeReply();*/
		
		return "study_notice/notice_detail";
	}//addComment
	
	
						//혜원이 코드랑 합치지못해서 일단 임시로 매핑해놈
					@RequestMapping(value="/study_group/my_study.do", method=GET)
					public String myStudyPage(String s, Model model) {
						
						
						
						return "study_group/my_study";
					}//myStudyPage
	
	
	
}//class
