package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.studystory.domain.LoginResult;
import kr.co.studystory.service.CommonService;
import kr.co.studystory.vo.LoginVO;

@SessionAttributes({"id","nick"})
@Controller
public class LoginController {
	
	@Autowired
	private CommonService cs;

	@RequestMapping(value="/login.do", method= { GET, POST })
	public String loginForm() {
		return "common/login";
	}
	
	@RequestMapping(value="/login_process.do", method=POST)
	public String loginProcess(LoginVO lvo, Model model) {
		String url = "common/login";
		
		String encPass = CommonService.shaEncoding(lvo.getPass());
		lvo.setPass(encPass);
		LoginResult lr = cs.login(lvo);
		if(lr.getLogged()) {
			model.addAttribute("id",lvo.getId());
			String nick = cs.getNick(lvo.getId());
			model.addAttribute("nick",nick);
			url = "redirect:study_info/main.do";
		} else {
			model.addAttribute("deniedMsg", lr.getMsg());
		}
		
		return url;
	}
}
