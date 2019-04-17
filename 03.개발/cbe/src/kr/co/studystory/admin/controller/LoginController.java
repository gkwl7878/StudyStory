package kr.co.studystory.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.vo.LoginVO;

@Controller
public class LoginController {
	
	@RequestMapping(value="/admin/login.do",method=RequestMethod.GET)
	public String loginPage() {
		return "admin/login";
	}
	
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
}
