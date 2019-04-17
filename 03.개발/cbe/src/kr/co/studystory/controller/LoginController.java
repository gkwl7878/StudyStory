package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.vo.LoginVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

	@RequestMapping(value="/login.do", method=GET)
	public String loginForm() {
		return "common/login";
	}
	
	@RequestMapping(value="/login_process.do", method=GET)
	public String loginProcess(LoginVO lvo, HttpSession session, Model model) {
		String url = "";
		
		
		return url;
	}
	
}
