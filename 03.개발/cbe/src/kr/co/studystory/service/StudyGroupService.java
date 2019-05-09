package kr.co.studystory.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.studystory.dao.StudyGroupDAO;
import kr.co.studystory.domain.AppliedStudy;
import kr.co.studystory.domain.MyStudy;
import kr.co.studystory.domain.PrevStudyInfo;
import kr.co.studystory.vo.CloseAlarmVO;
import kr.co.studystory.vo.CloseVO;
import kr.co.studystory.vo.ConditionVO;
import kr.co.studystory.vo.LeaveAlarmVO;
import kr.co.studystory.vo.LeaveStudyVO;
import kr.co.studystory.vo.LeaveVO;
import kr.co.studystory.vo.ModifiedStudyVO;
import kr.co.studystory.vo.NewStudyVO;
import kr.co.studystory.vo.OutStudyVO;

@Component
public class StudyGroupService {
	
	@Autowired
	private StudyGroupDAO sg_dao;
	
	/**
	 * 	새 스터디 개설하기-혜원
	 */
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
	
	/**
	 * 내 스터디 수정하기 -혜원
	 */
	public void deletePreImg(String sNum) {
	/*	String preImg= sg_dao.selectPreImg(sNum);
		return preImg;*/
	}
	
	
	public PrevStudyInfo getPrevStudy(String s_num) {
		PrevStudyInfo psi=null;
		psi=sg_dao.selectPrevStudyInfo(s_num);
		
		return psi;
	}//getPrevStudy
	
	public boolean modifyStudy(ModifiedStudyVO ms_vo) {
		boolean flag=false;
		
		if(sg_dao.updateStudy(ms_vo)) {
			flag=true;
		}
		
		return flag;
	}//modifyStudy
	

	
	/**
	 * 스터디 탈퇴 -혜원
	 */
	public String getLeaderId(String s_num) {
		return sg_dao.selectLeaderId(s_num);
		
	}//getLeaderId
	
	public boolean sendLeaveAlarm(LeaveAlarmVO la_vo) {
		boolean flag=false;
		
		if(sg_dao.insertLeaveAlarm(la_vo)) {
			flag=true;
		}
		
		return flag;
	}//sendLeaveAlarm
	
	public boolean leaveStudy(LeaveVO l_vo) {
		boolean flag=false;
		
		OutStudyVO osvo = new OutStudyVO(l_vo.getsNum(),l_vo.getId());
		if(sg_dao.deleteMember(osvo)) {
			flag=true;
		}
		
		return flag;
	}//leaveStudy
	
	public String getStudyName(String s_num) {
		return sg_dao.selectStudyName(s_num);
		
	}//getLeaderId
	
	/**
	 * 스터디 활동 종료 -혜원
	 */
	public List<String> getMemberId(String s_num) {
		return sg_dao.selectMemberId(s_num);
	}//getMemberId
	
	public boolean closeStudy(CloseVO c_vo) {
		boolean flag=false;
		
		
		if(sg_dao.updateDeactivation(c_vo.getsNum())) {
			
			flag=true;
		}
		return flag;
	}//closeStudy
	
	public void sendCloseAlarm(CloseAlarmVO ca_vo) {
		//1. snum이용해서 memberlist를 뽑는다.
		List<String> memberList=sg_dao.selectMemberId(ca_vo.getsNum());
		//2. list의 size만큼 반복해서 insert작업수행
		String tempId="";
		
		for(int i=0; i< memberList.size();i++) {
			tempId=memberList.get(i);
			ca_vo.setId(tempId);
			sg_dao.insertCloseAlarm(ca_vo);
		}
		
	}
	
}































