package kr.co.studystory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

import kr.co.studystory.service.StudyGroupService;
import kr.co.studystory.vo.ConditionVO;
import kr.co.studystory.vo.NewStudyVO;

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
	
	public String checkDupStudyName(String id) {
		
		return "";
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
	
	@RequestMapping(value="study_group/request_study.do", method=GET )
	public String RequestStudyPage() {
		return "study_group/study_create_request";
	}//createStudyPage
	
	//내 스터디 수정하기
	@RequestMapping(value="study_group/modify_study.do", method=GET )
	public String modifyStudyPage() {
		return "study_group/study_modify";
	}//createStudyPage
	
	@RequestMapping(value="study_group/my_study.do", method=GET)
	public String myStudyPage(ConditionVO c_vo, HttpSession session, Model model) {
		
		String id=(String)session.getAttribute("id");
		c_vo.setId(id);
		
		return "study_group/my_study";
	}//myStudyPage
	
	public String leaveStudyPage(String ) {
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}//class

















