package kr.co.studystory.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.admin.vo.NsBoardVO;
import static org.springframework.web.bind.annotation.RequestMethod.GET;


@Controller
public class NewStudyMngController {
	@RequestMapping(value="/admin/new_study.do", method=GET)
	public String nsMngPage(NsBoardVO nb_vo) {
		System.out.println("°»½Å");
		String url="/admin/new_study_mng";
		return url;
	}
}
