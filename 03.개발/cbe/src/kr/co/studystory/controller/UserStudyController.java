package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.service.StudyGroupService;
import kr.co.studystory.vo.CloseVO;
import kr.co.studystory.vo.LeaveAlarmVO;
import kr.co.studystory.vo.LeaveStudyVO;
import kr.co.studystory.vo.LeaveVO;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;
import oracle.net.aso.l;

@Controller
public class UserStudyController {
	@Autowired
	private StudyGroupService sgs;
	
	//새 스터디 개설하기 
	@RequestMapping(value="study_group/create_study.do", method=GET )
	public String createStudyPage() {
		return "study_group/study_create";
	}//createStudyPage
	
	@ResponseBody
	@RequestMapping(value="study_group/check_dup_study_name.do", method=GET, produces="text/plain;charset=UTF-8")
	public String checkDupStudyName(String study_name) {
		
		System.out.println("-----"+study_name);
		JSONObject json = new JSONObject();
		
		if(sgs.checkDupStudyName(study_name)) {
			json.put("dupFlag", true);
			json.put("msg", "중복된 스터디명이 존재합니다");
		}else {
			json.put("dupFlag", false);
			json.put("msg", "사용가능한 스터디명입니다");
		}
		
		return json.toJSONString();
	}//checkDupStudyName
	
	@RequestMapping(value="study_group/create_study_process.do", method=POST)
	public String createStudyProcess(NewStudyVO ns_vo,HttpSession session,HttpServletRequest request, Model model) {
		
		String id=(String)session.getAttribute("id");
		ns_vo.setId(id);
		
		String url= "forward:../study_group/create_study.do";
		
		if(sgs.addNewStudy(ns_vo, request)) {
			url = "study_group/study_create_request";
		}else{
			model.addAttribute("createFailFlag", true);
		}
		
		return url;
	}//createStudyProcess
	
	@RequestMapping(value="study_group/request_study.do", method=POST )
	public String RequestStudyPage() {
		return "study_group/study_create_request";
	}//createStudyPage
	
	//내 스터디 수정하기
	@RequestMapping(value="study_group/modify_study.do", method= {POST,GET})
	public String modifyStudyPage(String s_num,Model model ) {
		
		PrevStudyInfo psi=sgs.getPrevStudy(s_num);
		String name=psi.getName();
		String loc=psi.getLoc();
		String category=psi.getCategory();
		String content=psi.getContent();
		String img=psi.getImg();
		
		model.addAttribute("name",name);
		model.addAttribute("loc",loc);
		model.addAttribute("category",category);
		model.addAttribute("content",content);
		model.addAttribute("img",img);
		
		model.addAttribute("ps_Info",psi);
		
		return "study_group/study_modify";
	}//createStudyPage
	
	@RequestMapping(value="study_group/modify_study_process.do", method= RequestMethod.POST)
	public String modifyStudyProcess(ModifiedStudyVO ms_vo, HttpServletRequest request, Model model) {

		
		String url="study_group/study_modify";
		
		String s_num=request.getParameter("s_num");//
		String content= ms_vo.getContent();
		String img= ms_vo.getImg();
		
		ms_vo.setsNum(s_num);
		ms_vo.setContent(content);
		ms_vo.setImg(img);
		
		
		if(sgs.modifyStudy(ms_vo)) {
			url="study_group/study_modify";
			model.addAttribute("successFlag",true);
		}else {
			model.addAttribute("failFlag",true);
		}
		return url;
	}
	

	// 내 스터디 탈퇴하기
	@RequestMapping(value="study_group/leave_study.do", method= {GET,POST} )
		public String leaveStudyPage(String id) {
		return "study_group/study_out";
	}//leaveStudyPage
	
	@RequestMapping(value="study_group/leave_study_process.do" , method=POST )
	public String leaveStudyProcess(LeaveStudyVO ls_vo,LeaveAlarmVO la_vo,LeaveVO l_vo, HttpSession session, Model model) {
		//vo ????
		String id=(String)session.getAttribute("id");
		l_vo.setId(id);
		
		String s_num=l_vo.getsNum();
		String reason=l_vo.getReason();
		l_vo.setsNum(s_num);
		l_vo.setReason(reason);
		
		String url="study_group/study_out";
		
		if(sgs.leaveStudy(ls_vo)) {//???
			url="redirect:../index.do";
			model.addAttribute("id","");
			
		}else {
			model.addAttribute("failFlag",true);
		}

		return url;
	}//leaveStudyProcess
	
	//스터디 활동 종료
		@RequestMapping(value="study_group/end_study.do", method= {GET,POST} )
			public String closeStudyPage(String id) {
			return "study_group/end_study";
		}//leaveStudyPage
		
		@RequestMapping(value="study_group/end_study_process.do" , method=POST )
		public String closeStudyProcess(CloseVO l_vo, HttpSession session, Model model) {
			//vo ????
			String id=(String)session.getAttribute("id");
			l_vo.setId(id);
			
			String s_num=l_vo.getsNum();
			String reason=l_vo.getReason();
			l_vo.setsNum(s_num);
			l_vo.setReason(reason);
			
			String url="study_group/study_out";
			
			/*if(sgs.leaveStudy(l_vo)) {//???
				url="redirect:../index.do";
				model.addAttribute("id","");
				
			}else {
				model.addAttribute("failFlag",true);
			}*/

			return url;
		}
}//class

















