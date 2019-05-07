package kr.co.studystory.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.studystory.domain.JoinBbs;
import kr.co.studystory.domain.MemberWithImg;
import kr.co.studystory.service.StudyGroupService2;
import kr.co.studystory.vo.ApplicantBbsVO;

@Controller
public class UserStudyController2 {
	@Autowired
	private StudyGroupService2 sgs;

	/**
	 * 정미 스터디 참여자(이미지랑) 띄우기 
	 * @param sNum
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/study_group/show_participants.do",method=RequestMethod.GET)
	public String studyMemberPage(HttpSession session, String s_num, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		List<MemberWithImg> mbwi=sgs.getMemberWithImg(s_num);
		
		
		model.addAttribute("total",mbwi.size());
		model.addAttribute("mbwi",mbwi );//멤버 (사진) 리스트
		//model.addAttribute("")//총 멤버수 dao에서 구해오기 
		
		return "study_group/show_participants";
	}//studyMemberPage
	
	@RequestMapping(value="/study_group/new_joiner.do",method=RequestMethod.GET)
	public String appliedMemberPage(HttpSession session, ApplicantBbsVO abvo, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		List<JoinBbs> jb=sgs.getJoinerList(abvo);
		
		model.addAttribute("total",jb.size());
		model.addAttribute("jb",jb);
		
		return "study_group/new_joiner";
	}//appliedMemberPage
	
	
	
	
}

