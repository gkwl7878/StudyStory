package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class CommonController {

	@RequestMapping(value="/index.do",method=GET)
	public String indexPage() {
		return "common/index";
	}
}
