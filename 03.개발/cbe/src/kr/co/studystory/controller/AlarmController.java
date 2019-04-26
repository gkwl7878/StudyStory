package kr.co.studystory.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.studystory.domain.Alarm;
import kr.co.studystory.domain.DetailAlarm;
import kr.co.studystory.domain.NewAlarm;
import kr.co.studystory.service.CommonBbsService;
import kr.co.studystory.vo.AlarmBbsVO;
import kr.co.studystory.vo.AlarmPagingVO;

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
	
	@RequestMapping(value="common_bbs/alarm.do", method=GET)
	public String alarmBbs(AlarmBbsVO abvo, HttpSession session, Model model) {
		
		if(abvo.getCurrPage() == 0) {
			abvo.setCurrPage(1);
		}
		
		String id = (String)session.getAttribute("id");
		
		int currPage = abvo.getCurrPage();
		
		int totalCnt = cbs.getAlarmTotal(id);
		int begin = cbs.beginNum(currPage);
		int end = cbs.endNum(begin);
		
		int pageScale = cbs.pageScale();
		
		abvo.setBegin(begin);
		abvo.setEnd(end);
		abvo.setId((String)session.getAttribute("id"));
		
		List<Alarm> alarmList = cbs.getAlarms(abvo);
		
		int totalPage = cbs.getTotalPage(totalCnt);
		int pageIndexNum = cbs.pageIndexNum();
		int startPage = cbs.startPage(currPage, pageIndexNum);
		int endPage = cbs.endPage(startPage, pageIndexNum, totalPage);
		
		model.addAttribute("forwardFlag", false);
		model.addAttribute("backwardFlag", false);
		
		if (currPage > pageIndexNum) {
			model.addAttribute("forwardFlag", true);
		}
		
		if (totalPage > endPage) {
			model.addAttribute("backwardFlag", true);
		}
		
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currPage", currPage);
		model.addAttribute("alarmList", alarmList);
		
		return "common_bbs/alarm_list";
	}
	
	@RequestMapping(value="common_bbs/detail_alarm.do", method=GET)
	public String detailAlarm(AlarmPagingVO apvo, Model model) {
		
		String a_num = apvo.getA_num();
		String currPage = apvo.getCurrPage();
		
		DetailAlarm da = cbs.getDetailAlarm(a_num);
		
		if (da != null) {
			model.addAttribute("detailAlarm", da);
			model.addAttribute("currPage", currPage);
		}
		
		return "common_bbs/alarm_detail";
	}
	
}
