package kr.co.studystory.controller;
////유저공지사항 컨트롤러 정미

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.studystory.domain.DetailStudyNotice;
import kr.co.studystory.domain.Homework;
import kr.co.studystory.domain.SnComment;
import kr.co.studystory.domain.StudyNameAndRecruit;
import kr.co.studystory.domain.StudyNotice;
import kr.co.studystory.service.StudyNoticeService;
import kr.co.studystory.vo.FinishHwVO;
import kr.co.studystory.vo.NewCommentVO;

@Controller
public class UserSnController {
	@Autowired
	private StudyNoticeService sns;
	
	@RequestMapping(value="/study_notice/notice_list.do",method=GET)
	public  String userSnList(String s_num, Model model) {

		String url = "redirect:../study_info/main.do";
		if(!(s_num == null || "".equals(s_num))) {
			List<StudyNotice>snList= sns.getSnList(s_num);
			
			StudyNameAndRecruit snar = sns.getStudyNameAndRecruit(s_num);
			
			model.addAttribute("study_name", snar.getStudy_name());
			model.addAttribute("snList", snList);
			url = "study_notice/notice_list";
		}
		
		return url;
	}//userSnList
	
	@RequestMapping(value="/study_notice/notice_detail.do", method= { GET, POST })
	public String userDetailSn(String sn_num, Model model) {
		DetailStudyNotice dsn= sns.getDetailSn(sn_num);
		List<Homework> hwList = sns.getHomework(sn_num);
		List<SnComment> snCmt=sns.getComment(sn_num);
		
		String study_name = sns.getStudyNameBySnNum(sn_num);
		
		model.addAttribute("study_name", study_name);
		model.addAttribute("snDetailList", dsn);
		model.addAttribute("hwList", hwList);
		model.addAttribute("snCmt", snCmt);
		
		return "study_notice/notice_detail";
	}//userDetailSn
	
	@ResponseBody
	@RequestMapping(value="/study_notice/finish_hw.do",method=POST)
	public String finishHomework(FinishHwVO fvo, Model model) {

		JSONObject json = new JSONObject();
		
		if(sns.checkHomework(fvo)) {
			json.put("checkHw", true);
		}
		
		return  json.toJSONString();
	}//finishHomework
	
	@RequestMapping(value="/study_notice/add_sn_comment.do",method=POST)
	public String addComment(NewCommentVO ncvo, String sNum, Model model) {
		
		sns.addComment(ncvo);
		
		return "forward:../study_notice/notice_detail.do?sn_num="+ncvo.getSnNum()+"&s_num="+sNum;
	}//addComment
	
}//class
