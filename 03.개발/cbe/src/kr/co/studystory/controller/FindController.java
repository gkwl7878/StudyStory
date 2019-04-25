package kr.co.studystory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.service.CommonService;
import kr.co.studystory.vo.ChangePassVO;
import kr.co.studystory.vo.FindIdVO;
import kr.co.studystory.vo.FindPassVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class FindController {
	
	@Autowired
	private CommonService cs;

	@RequestMapping(value="/find_id.do", method=GET)
	public String findIdForm() {
		return "common/find_id";
	}
	
	@RequestMapping(value="/find_id_process.do", method=POST)
	public String findIdProcess(FindIdVO fivo, Model model) {
		
		String url = "common/find_id";
		String id = cs.findId(fivo);
		
		if (id != null) {
			//model.addAttribute("foundIdFlag", true);
			model.addAttribute("foundId", id);
			url = "common/login";
		} else {
			model.addAttribute("cantFindId", true);
		}
		
		return url;
	}
	
	@RequestMapping(value="/find_pass.do", method= { GET,POST })
	public String findPassForm() {
		return "common/find_pass";
	}
	
	
	@RequestMapping(value="/find_pass_process.do", method=POST)
	public String findPassProcess(FindPassVO fpvo, Model model) {

		String url = "common/find_pass";
		if(cs.findPass(fpvo)) {
			model.addAttribute("id", fpvo.getId());
			url = "common/set_new_pass";
		} else {
			model.addAttribute("cantFindAnswer", true);
		}
		
		return url;
	}
	
	@RequestMapping(value="/set_new_pass.do", method=POST)
	public String setNewPassProcess(ChangePassVO cpvo, Model model) {
		
		String encPass = CommonService.shaEncoding(cpvo.getPass());
		cpvo.setPass(encPass);
		String url ="common/login";
		if(cs.setNewPass(cpvo)) {
			model.addAttribute("changePassFlag", true);
		}
		
		return url;
	}
}
