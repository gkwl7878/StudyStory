package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class CommonController {

	@RequestMapping(value="/index.do",method=GET)
	public String indexPage() {
		return "common/index";
	}
	
	@RequestMapping(value="/agreement.do", method=GET)
	public String agreement() {
		return "common/agreement";
	}
	
	@RequestMapping(value="/faq.do", method=GET)
	public String faqPage() {
		return "common/faq";
	}
	
	@RequestMapping(value="/introduction.do", method=GET)
	public String introduction() {
		return "common/service_info";
	}
	
	@RequestMapping(value="/logout.do", method=GET)
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "common/index";
	}
}
