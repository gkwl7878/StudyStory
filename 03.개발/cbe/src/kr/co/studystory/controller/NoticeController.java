package kr.co.studystory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.domain.Notice;
import kr.co.studystory.service.CommonBbsService;
import kr.co.studystory.vo.NoticeBbsVO;

@Controller
public class NoticeController {
	
	@Autowired
	private CommonBbsService cbs;
	
	@RequestMapping("/common_bbs/notice.do")
	public String noticeBbs(NoticeBbsVO nbvo, Model model) {
		
		if(nbvo.getSearchWord() == null) {
			nbvo.setSearchWord("");
		}
		
		if(nbvo.getCurrPage() == 0) {
			nbvo.setCurrPage(1);
		}
		
		int currPage = nbvo.getCurrPage();
		
		int totalCnt = cbs.getNoticeTotal();
		int begin = cbs.beginNum(currPage);
		int end = cbs.endNum(begin);
		
		int pageScale = cbs.pageScale();
		
		nbvo.setBegin(begin);
		nbvo.setEnd(end);
		
		List<Notice> noticeList = cbs.getNotices(nbvo);
		
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
		model.addAttribute("noticeList", noticeList);
		
		return "common_bbs/notice_list";
	}
	
	@RequestMapping("/common/bbs/notice_detail.do")
	public String noticeDetail(String n_num, Model model) {
		return "common_bbs/notice_detail";
	}
}
