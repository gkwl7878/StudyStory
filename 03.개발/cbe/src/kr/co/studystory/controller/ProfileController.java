package kr.co.studystory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.studystory.domain.PrevProfile;
import kr.co.studystory.service.CommonService;
import kr.co.studystory.vo.ProfileVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;

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
	
	@RequestMapping(value="common/profile_change.do",method=POST)
	public String profileChange(ProfileVO pv, HttpServletRequest request, Model model) {
		
		String fileName = ""; 		
		try {
			fileName = cs.uploadNewImg(request);
			pv.setImg(fileName);
			if (cs.setProfile(pv)) {
				model.addAttribute("changeFlag", true);
			} else {
				model.addAttribute("changeFlag", false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "common/my_profile";
	}
	
}
