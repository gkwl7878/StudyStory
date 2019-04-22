package kr.co.studystory.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.studystory.admin.vo.NsBoardVO;


@Controller
public class NewStudyMngController {
	@RequestMapping(value="/admin/new_study.do", method=RequestMethod.POST)
	public String nsMngPage(NsBoardVO nb_vo) {
		String url="/admin/new_study_mng";
		return url;
	}
}
