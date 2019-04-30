package kr.co.studystory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import kr.co.studystory.domain.MyStudy;
import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.service.StudyGroupService;
import kr.co.studystory.vo.ConditionVO;
import kr.co.studystory.vo.LeaveAlarmVO;
import kr.co.studystory.vo.LeaveStudyVO;
import kr.co.studystory.vo.LeaveVO;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;
import oracle.net.aso.l;

@Controller
@Component
public class UserStudyController {
	@Autowired
	private StudyGroupService sgs;
	
	//새 스터디 개설하기 
	@RequestMapping(value="study_group/create_study.do", method=GET )
	public String createStudyPage() {
		return "study_group/study_create";
	}//createStudyPage
	
	@ResponseBody
	@RequestMapping(value="/check_dup_study_name.do", method=GET)
	public String checkDupStudyName(String studyName) {
		JSONObject json=new JSONObject();
		
		if(sgs.checkDupStudyName(studyName)) {
			json.put("dupFlag", true);
		}else {
			json.put("dupFlag", false);
			
		}
		return json.toJSONString();
	}//checkDupStudyName
	
	@RequestMapping(value="study_group/create_study_process.do", method=GET)
	public String createStudyProcess(NewStudyVO ns_vo,HttpSession session,HttpServletRequest request, Model model) {
		
		
		String id=(String)session.getAttribute("id");
		ns_vo.setId(id);
		
		String url="study_group/study_create";//???요청완료페이지
		
		//이미지업로드
		
		if(sgs.addNewStudy(ns_vo)) {
			url = "forword:request_study.do";
			model.addAttribute("id",ns_vo.getId());
		}else{
			//????
		}
		return url;
		//session:아이디얻기
		
	}//createStudyProcess
	
	@RequestMapping(value="study_group/request_study.do", method=RequestMethod.POST )
	public String RequestStudyPage() {
		return "study_group/study_create_request";
	}//createStudyPage
	
	//내 스터디 수정하기
	@RequestMapping(value="study_group/modify_study.do", method=GET )
	public String modifyStudyPage(String sNum,Model model ) {
		
		PrevStudyInfo psInfo=sgs.getPrevStudy(sNum);
		model.addAttribute("ps_Info",psInfo);
		
		return "study_group/study_modify";
	}//createStudyPage
	
	public String modifyStudyProcess(ModifiedStudyVO ms_vo, HttpServletRequest request, Model model) {

		String url="study_group/study_modify";
		
		if(sgs.modifyStudy(ms_vo)) {
		model.addAttribute("");
		}else {
			
		}
		return "";
	}
	
	
	@RequestMapping(value="study_group/my_study.do", method=GET)
	public String myStudyPage(ConditionVO c_vo, HttpSession session, Model model) {
		List<MyStudy> list=null;
		
		String id=(String)session.getAttribute("id");
		c_vo.setId(id);
		
		list=sgs.getMyStudy(c_vo);
		
		model.addAttribute("id", c_vo.getId());
		model.addAttribute("mystudyList", list);
		return "study_group/my_study";
	}//myStudyPage
	
	//내 스터디 탈퇴하기
		@RequestMapping(value="study_group/leave_study.do", method=GET )
			public String leaveStudyPage(String id) {
			return "study_group/study_out";
		}//leaveStudyPage
		
		@RequestMapping(value="study_group/leave_study.do" , method=POST )
		public String leaveStudyProcess(LeaveVO l_vo , HttpSession session, Model model) {
			boolean alarmFlag=false;
			LeaveStudyVO ls_vo=new LeaveStudyVO();
			boolean leaveFlag=sgs.leaveStudy(ls_vo);
			LeaveAlarmVO la_vo=new LeaveAlarmVO();
			
			String id=(String)session.getAttribute("id");
			if(leaveFlag) {
				la_vo.setLeaderId(id);			
				la_vo.setReason("탈퇴이유");
				la_vo.setCategory("취업");
				la_vo.setContent("내용");
				la_vo.setSubject("제목");
				alarmFlag=sgs.sendLeaveAlarm(la_vo);
			}
			String url="forward:";
			if(alarmFlag&&leaveFlag) {
				model.addAttribute("acceptFlag",true);
				url="forward:index.do";
			}
			
			ls_vo.setId(id);
			ls_vo.setsNum("s_0000041");

			
			model.addAttribute("id",l_vo.getId());

			
			return "";
		}
}//class

















