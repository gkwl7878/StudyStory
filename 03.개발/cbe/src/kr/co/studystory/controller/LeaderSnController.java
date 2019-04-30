package kr.co.studystory.controller;
//리더 공지사항 컨트롤러 정미

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.domain.NickAndId;
import kr.co.studystory.domain.StudyNotice;
import kr.co.studystory.service.StudyNoticeService;
import kr.co.studystory.vo.NewStudyNoticeVO;
import kr.co.studystory.vo.RecruitVO;
import kr.co.studystory.vo.SnModifiedVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class LeaderSnController {
	@Autowired
	private StudyNoticeService sns;
	
	@RequestMapping(value="/study_notice/notice_list_leader.do", method= { GET, POST })
	public String leaderSnList(String sNum, Model model) {
		List<StudyNotice> list = sns.getSnList(sNum);
		model.addAttribute("snList", list);
		return "study_notice/notice_list_leader";
	}//leaderSnList
	
	@RequestMapping(value="/study_notice/change_recruit.do", method=POST)
	public String changeRecruit(RecruitVO rvo, Model model) {
		
		if(sns.changeRecruit(rvo)) {
			model.addAttribute("recruitChanged", true);
			model.addAttribute("recruitment", rvo.getStatus());
		}
		
		return "study_notice/notice_list_leader";
	}
	
	@RequestMapping(value="/study_notice/wrtie.do", method= { GET, POST })
	public String leaderWrite(String sNum, Model model) {
		
		List<NickAndId> list = sns.getMember(sNum);
		model.addAttribute("nickAndIdList", list);
		
		return "study_notice/notice_write";
	}
	
	@RequestMapping(value="/study_notice/wrtie_process.do", method=POST)
	public String leaderWriteProcess(NewStudyNoticeVO nsnvo, Model model) {
		
		return "study_notice/notice_list_leader";
	}
	
	@RequestMapping(value="/study_notice/modify.do", method=GET)
	public String leaderModifySn(String snNum, Model model) {
		
		return "study_notice/notice_modify";
	}
	
	@RequestMapping(value="/study_notice/modify_process.do", method=POST)
	public String leaderModifyProcess(SnModifiedVO smvo, Model model) {
		
		return "study_notice/notice_list_leader";
	}
	
}//class
