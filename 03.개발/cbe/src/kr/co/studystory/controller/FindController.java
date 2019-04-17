package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class FindController {

	@RequestMapping(value="/common/find_id.do", method=GET)
	public String findIdForm() {
		return "common/find_id";
	}
	
	@RequestMapping(value="/common/find_pass.do", method=GET)
	public String findPassForm() {
		return "common/find_pass";
	}
}
