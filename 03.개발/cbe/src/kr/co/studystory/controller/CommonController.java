package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpSession;

@SessionAttributes({ "id", "nick" })
@Controller
public class CommonController {

	@RequestMapping(value="/index.do",method= { GET, POST })
	public String indexPage() {
		return "common/index";
	}
	
	@RequestMapping(value="common/agreement.do", method=GET)
	public String agreement(HttpSession session) {
		
		String url = "common/agreement";
		if (session.getAttribute("id") == null) {
			url="redirect:../index.do";
		}
		
		return url;
	}
	
	@RequestMapping(value="common/faq.do", method=GET)
	public String faqPage(HttpSession session) {
		
		String url = "common/faq";
		if (session.getAttribute("id") == null) {
			url="redirect:../index.do";
		}
		
		return url;
	}
	
	@RequestMapping(value="common/introduction.do", method=GET)
	public String introduction(HttpSession session) {
		
		String url = "common/service_info";
		if (session.getAttribute("id") == null) {
			url="redirect:../index.do";
		}
		
		return url;
	}
	
	@RequestMapping(value="/logout.do", method=GET)
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "common/index";
	}
}
