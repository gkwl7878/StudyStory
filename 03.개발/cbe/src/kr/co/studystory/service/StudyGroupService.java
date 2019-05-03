package kr.co.studystory.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.studystory.dao.StudyGroupDAO;
import kr.co.studystory.domain.AppliedStudy;
import kr.co.studystory.domain.MyStudy;
import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.vo.ConditionVO;
import kr.co.studystory.vo.LeaveAlarmVO;
import kr.co.studystory.vo.LeaveStudyVO;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;

@Component
public class StudyGroupService {
	
	@Autowired
	private StudyGroupDAO sg_dao;
	
	//새 스터디 개설하기
	//스터디명 중복확인은 ajax로 구현
	public boolean checkDupStudyName(String study_name) {
		boolean flag=false;
		
		if(sg_dao.selectDupStudyName(study_name)) {
			flag=true;
		}
		
		return flag;
	}//checkDupStudyName
	
	/**
	 * 스터디 생성(DB추가) + 이미지 업로드
	 */
	public boolean addNewStudy(NewStudyVO ns_vo, HttpServletRequest request) {
		boolean flag=false;

		try {
			MultipartRequest mr = new MultipartRequest(request, "C:/dev/StudyStory/03.개발/cbe/WebContent/study_img/",
					 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());

			ns_vo.setCategory(mr.getParameter("category"));
			ns_vo.setContent(mr.getParameter("content"));
			ns_vo.setImg(mr.getFilesystemName("file"));
			ns_vo.setLoc(mr.getParameter("loc"));
			ns_vo.setStudy_name(mr.getParameter("study_name"));
			
			if(sg_dao.insertNewStudy(ns_vo)) {
				flag = true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return flag;
	}//addNewStudy
	
	//내 스터디 수정하기
	public PrevStudyInfo getPrevStudy(String sNum) {
		
		StudyGroupDAO sg_dao=StudyGroupDAO.getInstance();
		PrevStudyInfo psi=sg_dao.selectPrevStudyInfo(sNum);
		return psi;
	}//getPrevStudy
	
	public boolean modifyStudy(ModifiedStudyVO ms_vo) {
		boolean flag=false;
		
		StudyGroupDAO sg_dao=StudyGroupDAO.getInstance();
		
		if(sg_dao.updateStudy(ms_vo)) {
			flag=true;
		}
		
		return flag;
	}//modifyStudy
	
	//스터디 탈퇴
	public String getLeaderId(String id) {
		return "";
	}//getLeaderId
	
	public boolean sendLeaveAlarm(LeaveAlarmVO la_vo) {
		boolean flag=false;
		
		if(sg_dao.insertLeaveAlarm(la_vo)) {
			flag=true;
		}
		
		return flag;
	}//sendLeaveAlarm
	
	public boolean leaveStudy(LeaveStudyVO ls_vo) {
		boolean flag=false;
		
		if(sg_dao.deleteMember(ls_vo)) {
			flag=true;
		}
		
		return flag;
	}
}































