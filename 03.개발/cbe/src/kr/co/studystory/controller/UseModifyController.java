package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.studystory.domain.PrevUserInfo;
import kr.co.studystory.service.CommonService;
import kr.co.studystory.vo.ModifiedPassVO;
import kr.co.studystory.vo.ModifiedUserInfoVO;
import kr.co.studystory.vo.OutVO;

@SessionAttributes("id")
@Controller
public class UseModifyController {
	
	@Autowired
	private CommonService cs;

	@RequestMapping(value="/common/user_modify_menu.do", method= { GET, POST })
	public String userModifyMenu() {
		return "common/user_modify_menu";
	}
	
	@RequestMapping(value="/common/modify_info.do", method= { GET,POST })
	public String userInfoModifyForm(HttpSession session, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		String id = (String)session.getAttribute("id");
		
		String url = "redirect:user_modify_menu.do";
		PrevUserInfo pui = cs.selectMyInfo(id);
		if (pui != null) {
			String tel = pui.getTel();
			String email = pui.getEmail();
			String[] telArr = tel.split("-");
			String[] emailArr = email.split("@");
			
			model.addAttribute("tel1", telArr[0]);
			model.addAttribute("tel2", telArr[1]);
			model.addAttribute("tel3", telArr[2]);
			
			model.addAttribute("email1", emailArr[0]);
			model.addAttribute("email2", emailArr[1]);
			
			model.addAttribute("prevInfo",pui);
			url = "common/modify_info";
		}
		
		return url;
	}
	
	@RequestMapping(value="/common/modify_info_process.do", method=POST)
	public String userInfoChange(HttpSession session, ModifiedUserInfoVO muivo, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		String encPass = CommonService.shaEncoding(muivo.getPass());
		muivo.setPass(encPass);
		
		String url = "redirect:modify_info.do?info_changed=true";
		if(!cs.changeUserInfo(muivo)) {
			url = "forward:user_modify_menu.do";
			model.addAttribute("failFlag", true);
		}
		
		return url;
	}
	
	@RequestMapping(value="/common/modify_pass.do", method= { GET, POST })
	public String changePassForm(HttpSession session) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		return "common/modify_pass";
	}
	
	@RequestMapping(value="/common/modify_pass_process.do", method=POST)
	public String changePassProcess(ModifiedPassVO mpvo, HttpSession session, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		String url = "common/modify_pass";
		
		String encPass = CommonService.shaEncoding(mpvo.getPass());
		String encNewPass = CommonService.shaEncoding(mpvo.getNewPass());
		mpvo.setId((String)session.getAttribute("id"));
		mpvo.setPass(encPass);
		mpvo.setNewPass(encNewPass);
		
		if(cs.changePass(mpvo)) {
			url = "common/user_modify_menu";
			model.addAttribute("successFlag", true);
		} else {
			model.addAttribute("failFlag", true);
		}
		
		return url;
	}
	
	@RequestMapping(value="/common/account_out.do", method= { GET, POST })
	public String leaveForm() {
		return "common/account_out";
	}
	
	@RequestMapping(value="/common/account_out_process.do", method=POST)
	public String leaveProcess(OutVO ovo, HttpSession session, SessionStatus status, Model model) {
		
		String encPass = CommonService.shaEncoding(ovo.getPass());
		
		ovo.setId((String)session.getAttribute("id"));
		ovo.setPass(encPass);
		
		String url = "common/account_out";
		if(cs.setDeactivation(ovo)) {
			url = "redirect:../index.do";
			model.addAttribute("id", "");
			status.setComplete();
		} else {
			model.addAttribute("failFlag", true);
		}
		
		return url;
	}
}
