package kr.co.studystory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.service.StudyGroupService;
import kr.co.studystory.vo.CloseAlarmVO;
import kr.co.studystory.vo.CloseVO;
import kr.co.studystory.vo.LeaveAlarmVO;
import kr.co.studystory.vo.LeaveStudyVO;
import kr.co.studystory.vo.LeaveVO;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;

@Controller
public class UserStudyController {
	@Autowired
	private StudyGroupService sgs;
	
	//새 스터디 개설하기 
	@RequestMapping(value="study_group/create_study.do", method=GET )
	public String createStudyPage(HttpSession session) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		return "study_group/study_create";
	}//createStudyPage
	
	@ResponseBody
	@RequestMapping(value="study_group/check_dup_study_name.do", method=GET, produces="text/plain;charset=UTF-8")
	public String checkDupStudyName(String study_name) {
		
		JSONObject json = new JSONObject();
		
		if(sgs.checkDupStudyName(study_name)) {
			json.put("dupFlag", true);
			json.put("msg", "중복된 스터디명이 존재합니다");
		}else {
			json.put("dupFlag", false);
			json.put("msg", "사용가능한 스터디명입니다");
		}
		
		return json.toJSONString();
	}//checkDupStudyName
	
	@RequestMapping(value="study_group/create_study_process.do", method=POST)
	public String createStudyProcess(NewStudyVO ns_vo,HttpSession session,HttpServletRequest request, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		String id=(String)session.getAttribute("id");
		ns_vo.setId(id);
		
		String url= "forward:../study_group/create_study.do";
		
		if(sgs.addNewStudy(ns_vo, request)) {
			url = "study_group/study_create_request";
		}else{
			model.addAttribute("createFailFlag", true);
		}
		
		return url;
	}//createStudyProcess
	
	//내 스터디 수정하기
	@RequestMapping(value="study_group/modify_study.do", method= {GET,POST} )
	public String modifyStudyPage(String sNum, Model model ) {
		
		PrevStudyInfo psInfo=sgs.getPrevStudy(sNum);
		if(psInfo !=null) {
			String name=psInfo.getName();
			String loc=psInfo.getLoc();
			String category=psInfo.getCategory();
			String content=psInfo.getContent();
			String img=psInfo.getImg();
			
			model.addAttribute("name",name);
			model.addAttribute("loc",loc);
			model.addAttribute("category",category);
			model.addAttribute("content",content);
			model.addAttribute("img",img);
			
			model.addAttribute("ps_info",psInfo);
		}
		
		return "study_group/study_modify";
	}//createStudyPage
	
	@RequestMapping(value="study_group/modify_study_process.do", method= {RequestMethod.POST})
	public String modifyStudyProcess(ModifiedStudyVO ms_vo, 
			HttpServletRequest request, Model model) {
		
		// 파일 업로드
				MultipartRequest mr=null;
				try {
					mr = new MultipartRequest(request,"C:/dev/StudyStory/03.개발/cbe/WebContent/study_img/",
							1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
				} catch (IOException e) {
					e.printStackTrace();
				}
				String flag=mr.getParameter("imgChangeFlag");
				String img="";
				if("true".equals(flag)) {
					img= mr.getFilesystemName("file");
					
				}else {
					img=mr.getParameter("prevImg");
				}
				System.out.println("================="+img);
				String url = "study_group/study_modify";
				
				String sNum = mr.getParameter("sNum");
				String content= mr.getParameter("content");
				ms_vo.setContent(content);
				ms_vo.setImg(img);
				ms_vo.setsNum(sNum);
				
				String preImg= sgs.searchPreImg(sNum);
				
				
				File file = new File("C:/dev/StudyStory/03.개발/cbe/WebContent/study_img/"+preImg);
				if(!(preImg.equals("no_study_img.png"))){
						if(file.exists()||img!=null) {
						file.delete();
					}else {
						System.out.println("파일이 존재하지 않습니다.");
					}
				}
				
				if(img==null) {
					img ="no_study_img.png";
				}
				
				
				System.out.println(ms_vo);
				
		if(sgs.modifyStudy(ms_vo)) {
			url="redirect:../study_group/study_i_made.do";
			model.addAttribute("successFlag",true);
		}else {
			model.addAttribute("failFlag",true);
		} 
		return url;
	}
	

	// 내 스터디 탈퇴하기
	@RequestMapping(value="study_group/leave_study.do", method= {GET,POST} )
		public String leaveStudyPage(String id) {
		return "study_group/study_out";
	}//leaveStudyPage
	
	@RequestMapping(value="study_group/leave_study_process.do" , method=POST )
	public String leaveStudyProcess(LeaveVO l_vo, HttpSession session, Model model) {
		
		String id=(String)session.getAttribute("id");
		l_vo.setId(id);
		
		String url="study_group/my_study";
		
		if(sgs.leaveStudy(l_vo)) {
			
			LeaveAlarmVO la_vo=new LeaveAlarmVO();
			la_vo.setLeaderId(sgs.getLeaderId(l_vo.getsNum()));
			la_vo.setCategory("스터디");
			la_vo.setSubject("스터디에서 탈퇴하였습니다.");
			// snum이용해서 스터디명을 조회해서 content내용으로 추가
			// s_num을 받아서 study_name을 조회해 온 후 content에 
			// id가 [스터디명]에서 탈퇴하셨습니다. \n탈퇴사유 : 
			
			la_vo.setContent(l_vo.getId()+"가 ["+sgs.getStudyName(l_vo.getsNum())+"]에서 탈퇴되었습니다.: "+l_vo.getReason());
			la_vo.setsNum(l_vo.getsNum());
			
			sgs.sendLeaveAlarm(la_vo);
			
			url="redirect:../study_info/main.do";
		}else {
			model.addAttribute("failFlag",true);
			url="study_group/study_out";
		}

		return url;
	}//leaveStudyProcess
	
	//스터디 활동 종료
	@RequestMapping(value="study_group/end_study.do", method= {GET,POST} )
	public String closeStudyPage(String id) {
		return "study_group/end_study";
	}//leaveStudyPage
		
	@RequestMapping(value="study_group/end_study_process.do" , method=POST )
	public String closeStudyProcess(CloseVO c_vo, HttpSession session, Model model) {

		
		
			String id=(String)session.getAttribute("id");
			c_vo.setId(id);
			
			String url="study_group/my_study";
			if(sgs.closeStudy(c_vo)) {
			
				CloseAlarmVO ca_vo=new CloseAlarmVO();
				ca_vo.setId(id);
				ca_vo.setCategory("스터디");
				ca_vo.setSubject("스터디가 종료되었습니다.");
				ca_vo.setContent(sgs.getStudyName(c_vo.getsNum())+"스터디가 해당 이유로 활동 종료되었습니다.: "+c_vo.getReason());
				ca_vo.setsNum(c_vo.getsNum());
				//
				sgs.sendCloseAlarm(ca_vo);
			
				System.out.println(c_vo);
				url="redirect:../study_group/study_i_made.do";
			}else {
				model.addAttribute("failFlag",true);
				url="study_group/end_study";
			}

		return url ;
	}
}//class

















