package kr.co.studystory.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.admin.domain.Answer;
import kr.co.studystory.admin.domain.DetailQuestion;
import kr.co.studystory.admin.domain.Question;
import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.service.QuestionService;
import kr.co.studystory.admin.vo.AlarmVO;
import kr.co.studystory.admin.vo.AnswerVO;
import kr.co.studystory.admin.vo.QuestionBoardVO;
import kr.co.studystory.admin.vo.QuestionDetailVO;

@Controller
public class QuestionMngController {
	
	@Autowired
	private CommonMngService cms;
	@Autowired
	private QuestionService qs;
	
	@RequestMapping(value="/admin/question_mng.do", method= GET)
	private String questionMngPage(QuestionBoardVO qb_vo,Model model) {
		int totalCount=cms.questionCount(qb_vo);
		int pageScale=cms.pageScale();
		int totalPage=cms.totalPage(totalCount);
		if(qb_vo.getCurrPage()==0){
			qb_vo.setCurrPage(1);
		}
		
		int startNum= cms.startNum(qb_vo.getCurrPage());
		int endNum= cms.endNum(startNum);
		
		int pageIndexNum= cms.pageIndexNum();
		int startPage= cms.startPage(qb_vo.getCurrPage(), pageIndexNum);
		int endPage= cms.endPage(startPage, pageIndexNum, totalPage);
		
		qb_vo.setBegin(startNum);
		qb_vo.setEnd(endNum);
		List<Question> list= qs.searchQuestion(qb_vo);
		
		model.addAttribute("forwardFlag", false);
		model.addAttribute("backwardFlag", false);
		model.addAttribute("pageIndexNum", pageIndexNum);
		model.addAttribute("searchCondition", qb_vo.getSearchCondition());
		
		if(qb_vo.getCurrPage()> pageIndexNum) {
			model.addAttribute("forwardFlag", true);
		}
		
		if(totalPage> endPage) {
			model.addAttribute("backwardFlag", true);
		}
		
		model.addAttribute("qList",list);
		model.addAttribute("pageScale",pageScale);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currPage",qb_vo.getCurrPage());
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("activeFlag","qActiveFlag");
		
		return "/admin/question";
	}
	
	@RequestMapping(value="/admin/answer.do",method= GET)
	public String answerProcess(QuestionDetailVO qd_vo, String answerFlag, Model model) {
		String url= "admin/answer_view";
		String qNum= qd_vo.getqNum();
		DetailQuestion de=qs.searchQuestion(qNum);
		Answer ans=null;
		//name, category, inputDate, subject, content
		if("N".equals(answerFlag)) {
			url="admin/answer_reg";
		}else {
			ans=qs.searchAnswer(qNum);
			model.addAttribute("answerContent", ans.getContent());
			model.addAttribute("answerDate", ans.getaDate());
		}
		model.addAttribute("id",de.getId());
		model.addAttribute("name",de.getName());
		model.addAttribute("category", de.getCategory());
		model.addAttribute("inputDate", de.getInputDate());
		model.addAttribute("subject", de.getSubject());
		model.addAttribute("content", de.getContent());
		model.addAttribute("qNum", qNum );
		
		return url;
	}
	
	@RequestMapping(value="/admin/answer_proc.do",method=GET)
	public String answerProcess(AnswerVO a_vo,String id, String subject, Model model) {
		boolean answerFlag= qs.modifyAnswerFlag(a_vo);
		AlarmVO al_vo= new AlarmVO();
		String qNum= a_vo.getqNum();
		model.addAttribute("qModifyFlag", answerFlag);
		model.addAttribute("qNum", qNum);
		if(answerFlag) {
			al_vo.setId(id);
			al_vo.setCategory("문의사항");
			al_vo.setSubject("문의사항의 답변이 등록되었습니다.");
			al_vo.setContent("["+subject+"]문의사항 글에 답변이 등록되었습니다.");
			cms.sendAlarm(al_vo);
		}
		return "forward:answer.do";
	}
	
	@RequestMapping(value="/admin/del_question.do",method=GET)
	public String removeQuestionProcess(String qNum,Model model) {
		boolean deleteFlag= qs.removeQuestion(qNum);
		if(deleteFlag) {
			model.addAttribute("qDeleteFlag",deleteFlag);
		}
		return "forward:question_mng.do";
	}
	
	
	
	
}
