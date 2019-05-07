package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

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
import kr.co.studystory.vo.CloseAlarmVO;
import kr.co.studystory.vo.CloseVO;
import kr.co.studystory.vo.LeaveAlarmVO;
import kr.co.studystory.vo.LeaveStudyVO;
import kr.co.studystory.vo.LeaveVO;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;

@Controller
public class UserStudyController {
	@Autowired
	private StudyGroupService sgs;
	
	//새 스터디 개설하기 
	@RequestMapping(value="study_group/create_study.do", method=GET )
	public String createStudyPage(HttpSession session) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		return "study_group/study_create";
	}//createStudyPage
	
	@ResponseBody
	@RequestMapping(value="study_group/check_dup_study_name.do", method=GET, produces="text/plain;charset=UTF-8")
	public String checkDupStudyName(String study_name) {
		
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
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
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
	
	//내 스터디 수정하기
	@RequestMapping(value="study_group/modify_study.do", method=GET )
	public String modifyStudyPage(String s_num, Model model ) {
		
		PrevStudyInfo psInfo=sgs.getPrevStudy(s_num);
		if(psInfo !=null) {
			String name=psInfo.getName();
			String loc=psInfo.getLoc();
			String category=psInfo.getCategory();
			String content=psInfo.getContent();
			String img=psInfo.getImg();
			
			model.addAttribute("name",name);
			model.addAttribute("loc",loc);
			model.addAttribute("category",category);
			model.addAttribute("content",content);
			model.addAttribute("img",img);
			
			model.addAttribute("ps_info",psInfo);
		}
		
		/*model.addAttribute("name",psInfo.getName());
		model.addAttribute("loc",psInfo.getLoc());
		model.addAttribute("category",psInfo.getCategory());
		model.addAttribute("content",psInfo.getContent());
		model.addAttribute("img",psInfo.getImg());*/
		
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
			url="/study_notice/notice_list_leader";
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
	public String leaveStudyProcess(LeaveVO l_vo, HttpSession session, Model model) {
		//vo ????
		String id=(String)session.getAttribute("id");
		l_vo.setId(id);
		
		String url="study_group/my_study";
		
		if(sgs.leaveStudy(l_vo)) {
			
			LeaveAlarmVO la_vo=new LeaveAlarmVO();
			
			la_vo.setCategory("스터디");
			la_vo.setSubject("스터디에서 탈퇴하였습니다.");
			// snum이용해서 스터디명을 조회해서 content내용으로 추가
			la_vo.setContent(l_vo.getsNum()+"가 탈퇴되었습니다.: "+l_vo.getReason());
			la_vo.setsNum(l_vo.getsNum());
			//
			sgs.sendLeaveAlarm(la_vo);
			
				url="redirect:../index.do";
				model.addAttribute("id","");
			
		}else {
			model.addAttribute("failFlag",true);
			url="study_group/study_out";
		}

		return url;
	}//leaveStudyProcess
	
	//스터디 활동 종료
		@RequestMapping(value="study_group/end_study.do", method= {GET,POST} )
			public String closeStudyPage(String id) {
			return "study_group/end_study";
		}//leaveStudyPage
		
		@RequestMapping(value="study_group/end_study_process.do" , method=POST )
		public String closeStudyProcess(CloseVO c_vo, HttpSession session, Model model) {

			String id=(String)session.getAttribute("id");
			c_vo.setId(id);
			
			String url="study_group/my_study";

			if(sgs.closeStudy(c_vo)) {
			
				CloseAlarmVO ca_vo=new CloseAlarmVO();
				
				ca_vo.setCategory("스터디");
				ca_vo.setSubject("스터디가 종료되었습니다.");
				// snum이용해서 스터디명을 조회해서 content내용으로 추가
				ca_vo.setContent("ooo스터디가 해당 이유로 활동 종료되었습니다.: "+c_vo.getReason());
				ca_vo.setsNum(c_vo.getsNum());
				//
				sgs.sendCloseAlarm(ca_vo);
			
				
					url="redirect:../index.do";
					model.addAttribute("id","");
				
			}else {
				model.addAttribute("failFlag",true);
				url="study_group/end_study";
			}

			return url ;
		}
}//class

















