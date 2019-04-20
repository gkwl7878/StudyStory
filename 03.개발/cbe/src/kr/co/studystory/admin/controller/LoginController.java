package kr.co.studystory.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.vo.LoginVO;

@Controller
public class LoginController {
	
	/**
	 * 로그인 페이지 띄워주기
	 * @return
	 */
	@RequestMapping(value="/admin/login.do",method=RequestMethod.GET)
	public String loginPage() {
		return "admin/login";
	}
	
	/**
	 * 로그인 처리 (아이디,비밀번호 검증, 다음페이지 전달할 값 구하기)
	 * @param l_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/login_proc.do", method=RequestMethod.POST)
	public String loginProcess(LoginVO l_vo, Model model) {
		String url= "admin/login";
		boolean loginFlag=false;
		CommonMngService cms= new CommonMngService();
		loginFlag= cms.login(l_vo);
		if(loginFlag) {
			url= "admin/new_study_mng";
		}
		model.addAttribute("loginFlag",loginFlag);
		return url;
	}
	
	/**
	 * 로그아웃
	 * @param ss
	 */
	@RequestMapping(value="/admin/logout.do")
	public String LogOut(SessionStatus ss){
		ss.setComplete();
		return "admin/login";
	}
	
	
}
