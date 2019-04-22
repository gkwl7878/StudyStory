package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

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

	@RequestMapping(value="/login.do", method= { GET, POST })
	public String loginForm() {
		return "common/login";
	}
	
	@RequestMapping(value="/login_process.do", method=POST)
	public String loginProcess(LoginVO lvo, Model model) {
		String url = "common/login";
		
		System.out.println("=========="+lvo.getId()+" / "+lvo.getPass());
		CommonService cs = new CommonService();
		String encPass = CommonService.shaEncoding(lvo.getPass());
		lvo.setPass(encPass);
		LoginResult lr = cs.login(lvo);
		if(lr.getLogged()) {
			url = "study_info/main";
			model.addAttribute("id",lvo.getId());
			String nick = cs.getNick(lvo.getId());
			model.addAttribute("nick",nick);
		} else {
			model.addAttribute("deniedMsg", lr.getMsg());
		}
		
		return url;
	}
	
}
