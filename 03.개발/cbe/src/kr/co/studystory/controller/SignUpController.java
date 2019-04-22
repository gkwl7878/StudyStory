package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.studystory.service.CommonService;
import kr.co.studystory.vo.NewUserVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.json.simple.JSONObject;

@Controller
public class SignUpController {

	@RequestMapping(value="/sign_up.do", method= { GET,POST })
	public String signupForm() {
		return "common/sign_up";
	}
	
	@ResponseBody
	@RequestMapping(value="/check_dup_id.do", method=GET)
	public String checkDupId(String id) {
		JSONObject json = null;
		
		CommonService cs = new CommonService();
		json = cs.checkDupId(id);
		
		return  json.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/check_dup_email.do", method=GET)
	public String checkDupEmail(String email) {
		JSONObject json = null;
		
		CommonService cs = new CommonService();
		json = cs.checkDupEmail(email);
		
		return  json.toJSONString();
	}
	
	@RequestMapping(value="/sign_up_process.do", method=POST)
	public String signUpProcess(NewUserVO nuvo, Model model) {
		
		CommonService cs = new CommonService();
		
		String url = "common/sign_up";
		
		if(cs.signUp(nuvo)) {
			url ="forward:welcome.do";
			model.addAttribute("name",nuvo.getName());
		} else {
			model.addAttribute("signUpFlag", false);
		}
		
		return url;
	}
	
	@RequestMapping(value="/welcome.do", method=POST)
	public String welcomePage(String name, Model model) {

		CommonService cs = new CommonService();
		model.addAttribute("name", name);
		
		return "common/welcome";
	}
}
