package kr.co.studystory.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
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
	@RequestMapping(value="/new_alarm.do",method=GET, produces="text/plain;charset=UTF-8")
	public String navAlarm(HttpSession session) {
		
		JSONArray jsonArr = new JSONArray();
		
		JSONObject json = null;
		NewAlarm na = null;
		List<NewAlarm> list = cbs.getNewAlarms((String)session.getAttribute("id"));
		
		System.out.println((String)session.getAttribute("id"));
		System.out.println(list);
		
		for(int i=0; i<list.size(); i++) {
			na = list.get(i);
			json = new JSONObject();
			// a_num, category, subject, input_date;
			json.put("a_num", na.getA_num());
			json.put("category", na.getCategory());
			json.put("subject", na.getSubject());
			json.put("input_date", na.getInput_date());
			
			jsonArr.add(json);
		}
		
		System.out.println(jsonArr.toJSONString());
		
		return jsonArr.toJSONString();
	}
	
}
