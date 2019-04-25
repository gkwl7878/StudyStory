package kr.co.studystory.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.studystory.domain.NewAlarm;
import kr.co.studystory.service.CommonBbsService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

@Controller
public class AlarmController {

	@Autowired
	private CommonBbsService cbs;
	
	
	@ResponseBody
	@RequestMapping(value="",method=GET)
	public String navAlarm(HttpSession session) {
		
		JSONObject json = new JSONObject();
		
		List<NewAlarm> list = cbs.getNewAlarms((String)session.getAttribute("id"));
		json.put("newAlarm", list);
		// 이걸 제이슨으로 해야하나? model에 담아서 반환해야하는거 아닐까?? ㅠㅠ
		
		return json.toJSONString();
	}
	
}
