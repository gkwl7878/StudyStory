package kr.co.studystory.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.admin.domain.DetailNotice;
import kr.co.studystory.admin.domain.Notice;
import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.service.NoticeService;
import kr.co.studystory.admin.vo.AlarmVO;
import kr.co.studystory.admin.vo.NewNoticeVO;
import kr.co.studystory.admin.vo.NoticeBoardVO;
import kr.co.studystory.admin.vo.NoticeModifyVO;

@Controller
public class NoticeMngController {
	
	@Autowired
	private CommonMngService cms;
	@Autowired
	private NoticeService ns;
	
	@RequestMapping(value="/admin/notice_mng.do", method= GET)
	private String noticeMngPage(NoticeBoardVO nb_vo,Model model) {
		int totalCount=cms.noticeCount(nb_vo);
		int pageScale=cms.pageScale();
		int totalPage=cms.totalPage(totalCount);
		if(nb_vo.getCurrPage()==0) {
			nb_vo.setCurrPage(1);
		}
		
		int startNum= cms.startNum(nb_vo.getCurrPage());
		int endNum= cms.endNum(startNum);
		
		int pageIndexNum= cms.pageIndexNum();
		int startPage= cms.startPage(nb_vo.getCurrPage(), pageIndexNum);
		int endPage= cms.endPage(startPage, pageIndexNum, totalPage);
		
		nb_vo.setBegin(startNum);
		nb_vo.setEnd(endNum);
		List<Notice> list= ns.searchNotice(nb_vo);
		
		model.addAttribute("forwardFlag", false);
		model.addAttribute("backwardFlag", false);
		model.addAttribute("pageIndexNum", pageIndexNum);
		model.addAttribute("searchWord", nb_vo.getSearchWord());
		
		if(nb_vo.getCurrPage()> pageIndexNum) {
			model.addAttribute("forwardFlag", true);
		}
		
		if(totalPage> endPage) {
			model.addAttribute("backwardFlag", true);
		}
		
		model.addAttribute("nList",list);
		model.addAttribute("pageScale",pageScale);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currPage",nb_vo.getCurrPage());
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("activeFlag","nActiveFlag");
		
		return "/admin/notice";
	}
	
	@RequestMapping(value="/admin/notice_detail.do",method= GET)
	public String searchDetailNotice(NoticeBoardVO nd_vo,Model model) {
		String nNum= nd_vo.getnNum();
		//subject, inputDate, content,viewCnt;
		DetailNotice dn=ns.searchDetailNotice(nNum);
		model.addAttribute("subject",dn.getSubject());
		model.addAttribute("inputDate",dn.getInputDate());
		model.addAttribute("content", dn.getContent());
		model.addAttribute("viewCnt", dn.getViewCnt());
		model.addAttribute("nNum", nNum );
		
		return "/admin/notice_detail";
	}
	
	@RequestMapping(value="/admin/update_notice.do",method=GET)
	public String modifyNoticeProcess(NoticeModifyVO nm_vo, Model model) {
		boolean modifyFlag= ns.modifyDetailNotice(nm_vo);
		String nNum= nm_vo.getnNum();
		model.addAttribute("nModifyFlag",modifyFlag);
		model.addAttribute("nNum", nNum);
		return "forward:notice_detail.do";
	}
	
	@RequestMapping(value="/admin/del_notice.do",method=GET)
	public String removeNoticeProcess(String nNum,Model model) {
		boolean deleteFlag= ns.removeNotice(nNum);
		if(deleteFlag) {
			model.addAttribute("nDeleteFlag",deleteFlag);
		}
		return "forward:notice_mng.do";
	}
	
	
	@RequestMapping(value="/admin/write_notice_page.do",method=GET)
	public String writeNoticePage(Model model) {
		return "/admin/new_notice";
	}
	
	@RequestMapping(value="/admin/write_notice_proc.do",method=GET)
	public String writeNoticeProcess(NewNoticeVO nn_vo, Model model) {
		ns.newNotice(nn_vo);
		List<String> list=ns.getAllUser();
		AlarmVO al_vo= new AlarmVO();
		for(int i=0; i<list.size();i++) {
			al_vo.setId(list.get(i));
			al_vo.setCategory("공지사항");
			al_vo.setSubject("공지사항이 등록되었습니다.");
			al_vo.setContent("새 공지사항이 등록되었습니다. ["+nn_vo.getSubject()+"]");
			cms.sendAlarm(al_vo);
		}
		model.addAttribute("nInsertFlag",true);
		return "forward:notice_mng.do";
	}
	
	
	
}
