package kr.co.studystory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.StudyGroupDAO2;
import kr.co.studystory.domain.JoinBbs;
import kr.co.studystory.domain.Joiner;
import kr.co.studystory.domain.MemberWithImg;
import kr.co.studystory.vo.ApplicantBbsVO;
import kr.co.studystory.vo.DetailJoinerVO;

/**
 * 스터디 참여자 보기 - 정미 
 * @author owner
 */
@Component
public class StudyGroupService2 {
	@Autowired
	private StudyGroupDAO2 sg_dao;
	
	public List<MemberWithImg> getMemberWithImg(String sNum){
		List<MemberWithImg> list=null;
		list=sg_dao.selectMemberWithImg(sNum);
		
		return list;
	}//getMemberWithImg
	
	/**
	 * 스터디 신청자 보기 리스트 - 정미
	 * @param abvo
	 * @return
	 */
	public List<JoinBbs> getJoinerList(ApplicantBbsVO abvo){
		List<JoinBbs> list= null;
		list=sg_dao.selectJoinerList(abvo);
		
		return list;
	}//getJoinerList
	
	/**
	 * 신청자 총 수 조회해오는 메서드 - 정미
	 */
	public int getJoinerTotal(String s_num) {
		return sg_dao.selectJoinerTotal(s_num);
	}
	
	
	/**
	 * 5개의 게시글을 한 페이지에 보여줌
	 * @return
	 */
	public int pageScale() {
		return 5;
	}
	
	/**
	 * 페이지 수를 구하는 메서드
	 */
	public int getTotalPage(int totalCnt) {
		int totalPage = totalCnt / pageScale();
		if(totalCnt % pageScale() !=0) {
			totalPage++;
		}
		return totalPage;
	}
	
	/**
	 * 게시글의 시작번호를 구하는 메서드
	 */
	public int beginNum(int currPage) {
		int begin=1;
		begin=currPage*pageScale()-pageScale()+1;
		return begin;
	}
	
	/**
	 * 게시글의 마지막 번호를 구하는 메서드
	 */
	public int endNum(int beginNum) {
		int end = beginNum +pageScale()-1;
		return end;
	}
	
	/**
	 * 페이지 인덱스를 반환하는 메서드
	 */
	public int pageIndexNum() {
		return 3;
	}
	
	/**
	 * 시작 페이지 인덱스를 반환하는 메서드 
	 * @return
	 */
	public int startPage(int currPage, int pageIndexNum) {
		int startPage = ((currPage-1)/pageIndexNum) *pageIndexNum+1;
		return startPage;
	}
	
	public int endPage(int startPage, int pageIndexNum, int totalPage) {
		int endPage =(((startPage-1) + pageIndexNum)/ pageIndexNum)*pageIndexNum;
	
	if(totalPage <= endPage) {
		endPage = totalPage;
		}
		return endPage;
	}
	
	/**
	 * 신청자 상세보기 
	 */
	public Joiner getJoiner(DetailJoinerVO djvo) {
		Joiner jr=null;
		jr=sg_dao.selectJoiner(djvo);
		
		return jr;
	}

}//class
