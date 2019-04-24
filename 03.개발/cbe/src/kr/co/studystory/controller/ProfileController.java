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
	
	@ResponseBody
	@RequestMapping(value="common/profile_img_upload.do", method=POST)
	public String profileImgUpload(HttpServletRequest request) {

		String fileName = "";
		JSONObject json = new JSONObject();
		try {
			fileName = cs.uploadNewImg(request);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if (!"".equals(fileName)) {
			json.put("fileName", fileName);
		}
		
		// 업로드한 파일명을 JSON형태로 반환
		return json.toJSONString();
	}
}
