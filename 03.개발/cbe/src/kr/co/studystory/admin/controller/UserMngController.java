package kr.co.studystory.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.studystory.admin.domain.DetailUser;
import kr.co.studystory.admin.domain.UserInfo;
import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.service.StudyAndUserService;
import kr.co.studystory.admin.vo.DetailUserVO;
import kr.co.studystory.admin.vo.UserBoardVO;
import kr.co.studystory.admin.vo.UserDetailVO;
import kr.co.studystory.util.ShaUtil;
@Controller
public class UserMngController {
	
	@Autowired
	private CommonMngService cms;
	@Autowired
	private StudyAndUserService saus;
	
	
	/** 유저 페이지 조회해서 띄우기
	 * @param uvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/user_mng.do", method= GET)
	private String userMngPage(UserBoardVO ub_vo,Model model) {
		int totalCount=cms.uTotalCount(ub_vo);
		int pageScale=cms.pageScale();
		int totalPage=cms.totalPage(totalCount);
		if(ub_vo.getCurrPage()==0) {
			ub_vo.setCurrPage(1);
		}
		
		int startNum= cms.startNum(ub_vo.getCurrPage());
		int endNum= cms.endNum(startNum);
		
		int pageIndexNum= cms.pageIndexNum();
		int startPage= cms.startPage(ub_vo.getCurrPage(), pageIndexNum);
		int endPage= cms.endPage(startPage, pageIndexNum, totalPage);
		
		ub_vo.setBegin(startNum);
		ub_vo.setEnd(endNum);
		List<UserInfo> list= saus.searchUserInfo(ub_vo);
		System.out.println(" 검색조건: "+ub_vo.getSearchCondition()+" 검색내용: "+ub_vo.getSearchWord()+
				" 시작넘버: "+startNum+" 끝넘버: "+endNum+
				" 시작페이지:"+startPage+" 끝페이지: "+endPage+" 현재페이지: "+ub_vo.getCurrPage()+
				" 검색갯수: "+list.size()+"토탈카운트"+totalCount);
		
		model.addAttribute("forwardFlag", false);
		model.addAttribute("backwardFlag", false);
		model.addAttribute("pageIndexNum", pageIndexNum);
		model.addAttribute("searchCondition", ub_vo.getSearchCondition());
		model.addAttribute("searchWord", ub_vo.getSearchWord());
		
		
		if(ub_vo.getCurrPage()> pageIndexNum) {
			model.addAttribute("forwardFlag", true);
		}
		
		if(totalPage> endPage) {
			model.addAttribute("backwardFlag", true);
		}
		
		model.addAttribute("uList",list);
		model.addAttribute("pageScale",pageScale);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currPage",ub_vo.getCurrPage());
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("activeFlag","uActiveFlag");
		
		return "/admin/user_mng";
	}
	
	//name, tel, zipcode, addr1, addr2, question, answer
	/**유저 detail정보 띄우기
	 * @param ud_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/user_detail.do",method= {GET,POST})
	public String userDetailPage(UserDetailVO ud_vo, Model model) {
		DetailUser du= saus.searchDetailUser(ud_vo.getId());
		if("1".equals(du.getQuestion())) {
			du.setQuestion("초등학교 담임선생님 성함은?");
		}else if("2".equals(du.getQuestion())) {
			du.setQuestion("가장 좋아하는 캐릭터 이름은?");
		}
		model.addAttribute("name",du.getName());
		model.addAttribute("tel", du.getTel());
		model.addAttribute("zipcode",du.getZipcode());
		model.addAttribute("addr1",du.getAddr1());
		model.addAttribute("addr2",du.getAddr2());
		model.addAttribute("question",du.getQuestion());
		model.addAttribute("answer",du.getAnswer());
		
		return "/admin/detail_member_info";
	}
	
	/**
	 * 유저 정보 수정
	 * @param du_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/user_modify.do", method=POST)
	public String modifyUserProcess(DetailUserVO du_vo, Model model) {
		du_vo.setPass(ShaUtil.shaEncoding(du_vo.getPass()));
		boolean modifyFlag= saus.modifyUser(du_vo);
		model.addAttribute("modifyFlag", modifyFlag);

		return "forward:user_detail.do";
	}
	
	@RequestMapping(value="/admin/user_delete.do", method=GET)
	public String removeUserProcess(String id, Model model) {
		boolean removeFlag= saus.removeUser(id);
		model.addAttribute("removeFlag", removeFlag);
		return "forward:user_mng.do";
	}
	
}

