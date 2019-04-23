package kr.co.studystory.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.domain.PrevProfile;
import kr.co.studystory.service.CommonService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class ProfileController {
	
	@Autowired
	private CommonService cs;

	@RequestMapping(value="common/profile.do",method= { GET, POST })
	public String profileForm(HttpSession session, Model model) {
		String url = "common/my_profile";
		PrevProfile pv = cs.getProfile((String)session.getAttribute("id"));
		model.addAttribute("prevProfile", pv);
		
		return url;
	}
}
