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
import kr.co.studystory.vo.JoinAlarmVO;
import kr.co.studystory.vo.JoinDeleteVO;
import kr.co.studystory.vo.NewMemberVO;
import kr.co.studystory.vo.RefuseAlarmVO;
import kr.co.studystory.vo.RefuseVO;

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

	public boolean addNewMember(NewMemberVO nmvo) {
		boolean acceptFlag=false;
		acceptFlag=sg_dao.insertNewMember(nmvo);
		
		String study_name = sg_dao.selectStudyName(nmvo.getS_num());
		
		JoinAlarmVO javo = new JoinAlarmVO("스터디", "가입 수락되었습니다",
				"가입 요청하셨던 ["+study_name+"]에 가입이 수락되었습니다. 많은 활동 부탁드립니다.",
				nmvo.getId());
		sg_dao.insertJoinAlarm(javo);
		
		return acceptFlag;
	}
	
	public boolean removeJoin(JoinDeleteVO jdvo) {
		boolean flag = false;
		System.out.println("=====================22222222222222222");
		flag = sg_dao.deleteJoin(jdvo);
		return flag;
	}
	
	public void sendRefuseAlarm(RefuseVO rfvo) {
		
		String study_name = sg_dao.selectStudyName(rfvo.getS_num());
		RefuseAlarmVO rfavo = new RefuseAlarmVO("스터디", "가입이 거절되었습니다",
				"가입 요청하셨던 ["+study_name+"]에 가입이 거절되었습니다. 사유는 다음과 같습니다.\n거절 사유 : "
				+rfvo.getReason(), rfvo.getId());
		
		sg_dao.insertRefuseAlarm(rfavo);
	}
	
	
}//class
