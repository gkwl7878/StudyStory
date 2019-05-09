package kr.co.studystory.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.studystory.admin.domain.DetailStudy;
import kr.co.studystory.admin.domain.StudyInfo;
import kr.co.studystory.admin.service.CommonMngService;
import kr.co.studystory.admin.service.StudyAndUserService;
import kr.co.studystory.admin.vo.AlarmVO;
import kr.co.studystory.admin.vo.DeleteStudyVO;
import kr.co.studystory.admin.vo.DetailStudyVO;
import kr.co.studystory.admin.vo.StudyBoardVO;
import kr.co.studystory.admin.vo.StudyDetailVO;

@SessionAttributes("activeFlag")
@Controller
public class StudyMngController {
	
	@Autowired
	private CommonMngService cms;
	@Autowired
	private StudyAndUserService saus;
	
	/** 스터디 페이지 조회해서 띄우기
	 * @param uvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/study_mng.do", method= GET)
	private String userMngPage(StudyBoardVO sb_vo,Model model) {
		int totalCount=cms.sTotalCount(sb_vo);
		int pageScale=cms.pageScale();
		int totalPage=cms.totalPage(totalCount);
		if(sb_vo.getCurrPage()==0) {
			sb_vo.setCurrPage(1);
		}
		
		int startNum= cms.startNum(sb_vo.getCurrPage());
		int endNum= cms.endNum(startNum);
		
		int pageIndexNum= cms.pageIndexNum();
		int startPage= cms.startPage(sb_vo.getCurrPage(), pageIndexNum);
		int endPage= cms.endPage(startPage, pageIndexNum, totalPage);
		
		sb_vo.setBegin(startNum);
		sb_vo.setEnd(endNum);
		List<StudyInfo> list= saus.searchStudyInfo(sb_vo);
		
		model.addAttribute("forwardFlag", false);
		model.addAttribute("backwardFlag", false);
		model.addAttribute("pageIndexNum", pageIndexNum);
		model.addAttribute("searchCondition", sb_vo.getSearchCondition());
		model.addAttribute("searchWord", sb_vo.getSearchWord());
		
		
		if(sb_vo.getCurrPage()> pageIndexNum) {
			model.addAttribute("forwardFlag", true);
		}
		
		if(totalPage> endPage) {
			model.addAttribute("backwardFlag", true);
		}
		
		model.addAttribute("sList",list);
		model.addAttribute("pageScale",pageScale);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currPage",sb_vo.getCurrPage());
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("activeFlag","sActiveFlag");
		
		return "/admin/study_mng";
	}
	
	/** 상세 스터디 조회
	 * @param sd_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/study_detail.do",method= {GET,POST})
	public String studyDetailPage(StudyDetailVO sd_vo, Model model) {

		DetailStudy ds= saus.searchDetailStudy(sd_vo.getsNum());
		model.addAttribute("studyName",ds.getStudyName());
		model.addAttribute("id",ds.getId());
		model.addAttribute("nick",ds.getNick());
		model.addAttribute("category",ds.getCategory());
		model.addAttribute("loc",ds.getLoc());
		model.addAttribute("inputDate",ds.getInputDate());
		model.addAttribute("img",ds.getImg());
		model.addAttribute("content",ds.getContent());
		model.addAttribute("memberNum",ds.getMemberNum());
		
		return "/admin/detail_study_info";
	}
	
	/**
	 * 스터디 수정
	 * @param ds_vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/study_modify.do", method= {POST,GET})
	public String modifyStudyProcess(DetailStudyVO ds_vo, Model model,HttpServletRequest request) {
		// 파일 업로드
		MultipartRequest mr=null;
		try {
			mr = new MultipartRequest(request,"C:/dev/StudyStory/03.개발/cbe/WebContent/study_img/",
					1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		String img= mr.getFilesystemName("file");
		String sNum = mr.getParameter("sNum");
		String category= mr.getParameter("category");
		String loc= mr.getParameter("loc");
		String content= mr.getParameter("content");
		String currPage= mr.getParameter("currPage");
		
		String preImg= saus.searchPreImg(sNum);
		
		
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
		
		ds_vo.setCategory(category);
		ds_vo.setLoc(loc);
		ds_vo.setContent(content);
		ds_vo.setImg(img);
		ds_vo.setsNum(sNum);
		
		boolean sModifyFlag= saus.modifyStudy(ds_vo);
		
		model.addAttribute("sModifyFlag", sModifyFlag);
		
		return "forward:study_detail.do?sNum="+sNum+"&currPage="+currPage;
	}
	
	/**
	 * 스터디 삭제 페이지
	 * @param sNum
	 * @return
	 */
	@RequestMapping(value="/admin/remove_study_page.do", method=GET)
	public String removeStudyPage(String sNum,String currPage, Model model) {
		model.addAttribute(sNum);
		model.addAttribute(currPage);
		return "/admin/study_del";
	}
	
	/**
	 * 스터디 삭제 작업
	 * @param ds_vo
	 * @return
	 */
	@RequestMapping(value="/admin/remove_study_proc.do",method=GET)
	public String removeStudyProcess(DeleteStudyVO ds_vo,String studyName ,Model model) {
		AlarmVO al_vo= new AlarmVO();
		boolean sDeleteFlag= saus.removeStudy(ds_vo.getsNum());
		List<String> list=saus.getMember(ds_vo.getsNum());
		if(sDeleteFlag) {
			for(int i=0; i<list.size();i++) {
				al_vo.setId(list.get(i));
				al_vo.setCategory("스터디");
				al_vo.setSubject("스터디가 삭제되었습니다.");
				al_vo.setContent("["+studyName+"]  스터디가 삭제되었습니다. 삭제사유: [" +ds_vo.getMsg()+"]");
				cms.sendAlarm(al_vo);
			}
		}
		model.addAttribute("sDeleteFlag", sDeleteFlag);
		return "forward:study_mng.do";
	}
	
}
