package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

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
import kr.co.studystory.vo.ProfileImgVO;
import kr.co.studystory.vo.ProfileVO;

@Controller
public class ProfileController {
	
	@Autowired
	private CommonService cs;

	@RequestMapping(value="common/profile.do",method= { GET, POST })
	public String profileForm(HttpSession session, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		String url = "common/my_profile";
		PrevProfile pv = cs.getProfile((String)session.getAttribute("id"));
		model.addAttribute("prevProfile", pv);
		
		return url;
	}
	
	@RequestMapping(value="common/upload_img.do",method= { GET, POST })
	public String profileImgChange() {
		return "layout/upload_img";
	}
	
	@RequestMapping(value="common/upload_img_process.do",method=POST)
	public String profileUpload(ProfileImgVO pivo, HttpServletRequest request, HttpSession session, Model model) {

		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		String newFileName = cs.uploadNewImg(request);
		
		model.addAttribute("uploadFlag", false);
		model.addAttribute("failFlag", true);
		if (!"".equals(newFileName)) {
			String id = (String)session.getAttribute("id");

			
			pivo.setId(id);
			pivo.setImg(newFileName);
			
			if(cs.setProfileImg(pivo)) {
				model.addAttribute("uploadFlag", true);
				model.addAttribute("failFlag", false);
			}
		}
		
		return "forward:upload_img.do";
	}
	
	@RequestMapping(value="common/profile_process.do",method=POST)
	public String profileChange(ProfileVO pv, HttpSession session, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		pv.setId((String)session.getAttribute("id"));
		
		if (cs.setProfile(pv)) {
			model.addAttribute("changeFlag", true);
		}
		
		return "forward:profile.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/common/check_dup_nick.do", method=GET, produces="text/plain;charset=UTF-8")
	public String checkDupNick(String nick) {
		
		JSONObject json = new JSONObject();
		
		if(cs.checkDupNick(nick)) {
			json.put("dupFlag", true);
			json.put("msg", "사용중인 닉네임입니다");
		} else {
			json.put("dupFlag", false);
			json.put("msg", "사용가능한 닉네임입니다");
		}
		return json.toJSONString();
	}
	
}
