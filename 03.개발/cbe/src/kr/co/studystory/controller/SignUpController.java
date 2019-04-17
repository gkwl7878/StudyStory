package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class SignUpController {

	
	@RequestMapping(value="/sign_up.do", method=GET)
	public String signupForm() {
		return "common/sign_up";
	}
}
