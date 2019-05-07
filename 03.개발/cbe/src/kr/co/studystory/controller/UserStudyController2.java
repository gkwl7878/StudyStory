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
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

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
	
	@RequestMapping(value="/study_group/new_joiner.do",method= {GET, POST})
	public String appliedMemberPage(HttpSession session, ApplicantBbsVO abvo, Model model) {
		
	if (session.getAttribute("id") == null) {
		return "redirect:../index.do";
	}
	
		if(abvo.getCurrPage()==0) {
			abvo.setCurrPage(1);
		}
		String s_num=abvo.getS_num();
		
		int currPage= abvo.getCurrPage();
		
		int totalCnt=sgs.getJoinerTotal(s_num);            //
		int begin = sgs.beginNum(currPage);
		int end = sgs.endNum(begin);
		
		int pageScale=sgs.pageScale();
		
		abvo.setBegin(begin);
		abvo.setEnd(end);
		
		List<JoinBbs> jb=sgs.getJoinerList(abvo);
		
		int totalPage=sgs.getTotalPage(totalCnt);
		int pageIndexNum =sgs.pageIndexNum();
		int startPage= sgs.startPage(currPage, pageIndexNum);
		int endPage=sgs.endPage(startPage, pageIndexNum, totalPage);
		
		model.addAttribute("forwardFlag", false);
		model.addAttribute("backwardFlag", false);
		
		if(currPage>pageIndexNum) {
			model.addAttribute("forwardFlag",true);
		}
		if(totalPage>endPage) {
			model.addAttribute("backwardFlag",true);
		}
		
		model.addAttribute("total",jb.size());///??필요없는건지
		model.addAttribute("jb",jb);
		
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currPage", currPage);
		
		return "study_group/new_joiner";
	}//appliedMemberPage
	
	
	
	
}

