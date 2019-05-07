package kr.co.studystory.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.domain.Alarm;
import kr.co.studystory.domain.DetailQuestion;
import kr.co.studystory.domain.MyQuestion;
import kr.co.studystory.service.CommonBbsService;
import kr.co.studystory.vo.QuestionBbsVO;
import kr.co.studystory.vo.QuestionPagingVO;
import kr.co.studystory.vo.QuestionVO;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

@Controller
public class QuestionController {
	
	@Autowired
	private CommonBbsService cbs;

	@RequestMapping(value="/common_bbs/ask.do", method=GET)
	public String ask(HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		return "common_bbs/ask";
	}
	
	@RequestMapping(value="/common_bbs/add_question.do", method=POST)
	public String askProcess(QuestionVO qvo, HttpSession session, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		qvo.setId((String)session.getAttribute("id"));
		
		String url = "common_bbs/ask";
		if(cbs.askQuestion(qvo)) {
			url="forward:question.do";
			model.addAttribute("askSuccessFlag", true);
		} else {
			model.addAttribute("askFailFlag", true);
		}
		
		return url;
	}
	
	@RequestMapping(value="common_bbs/question.do", method= { GET, POST })
	public String questionBbs(QuestionBbsVO qbvo, HttpSession session, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		if(qbvo.getCurrPage() == 0) {
			qbvo.setCurrPage(1);
		}
		
		String id = (String)session.getAttribute("id");
		
		int currPage = qbvo.getCurrPage();
		
		int totalCnt = cbs.getQuestionTotal(id);
		int begin = cbs.beginNum(currPage);
		int end = cbs.endNum(begin);
		
		int pageScale = cbs.pageScale();
		
		qbvo.setBegin(begin);
		qbvo.setEnd(end);
		qbvo.setId((String)session.getAttribute("id"));
		
		List<MyQuestion> questionList = cbs.getMyQuestion(qbvo);
		
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
		model.addAttribute("questionList", questionList);
		
		return "common_bbs/question_list";
	}
	
	@RequestMapping(value="common_bbs/detail_question.do", method=GET)
	public String questionDetail(HttpSession session, QuestionPagingVO qpvo, Model model) {
		
		if (session.getAttribute("id") == null) {
			return "redirect:../index.do";
		}
		
		String q_num = qpvo.getQ_num();
		String currPage = qpvo.getCurrPage();
		
		DetailQuestion dq = cbs.getDetailQuestion(q_num);
		
		if (dq != null) {
			model.addAttribute("detailQuestion", dq);
			model.addAttribute("currPage", currPage);
		}
		
		return "common_bbs/question_detail";
	}
}
