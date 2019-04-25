package kr.co.studystory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.dao.CommonBbsDAO;
import kr.co.studystory.domain.Alarm;
import kr.co.studystory.domain.NewAlarm;
import kr.co.studystory.vo.AlarmBbsVO;

@Component
public class CommonBbsService {

	@Autowired
	private CommonBbsDAO cb_dao;
	
	/**
	 * 10개의 게시글을 한 페이지에 보여줄 것
	 */
	public int pageScale() {
		return 10;
	}
	
	/**
	 * 페이지 수를 구하는 메서드
	 */
	public int getTotalPage(int totalCnt) {
		int totalPage = totalCnt / pageScale();
		if (totalCnt % pageScale() != 0) {
			totalPage++;
		}
		return totalPage;
	}
	
	/**
	 * 게시글의 시작번호를 구하는 메서드
	 */
	public int beginNum(int currPage) {
		int begin = 1;
		begin = currPage * pageScale() - pageScale() + 1;
		return begin;
	}
	
	/**
	 * 게시글의 마지막 번호를 구하는 메서드
	 */
	public int endNum(int beginNum) {
		int end = beginNum + pageScale() - 1;
		return end;
	}
	
	/**
	 * 페이지 인덱스를 반환하는 메서드 
	 */
	public int pageIndexNum() {
		return 5;
	}
	
	/**
	 * 시작 페이지 인덱스를 반환하는 메서드
	 */
	public int startPage(int currPage, int pageIndexNum) {
		int startPage = ((currPage - 1)/pageIndexNum) * pageIndexNum + 1;
		return startPage;
	}
	
	/**
	 * 마지막 페이지 인덱스를 반환하는 메서드
	 */
	public int endPage(int startPage, int pageIndexNum, int totalPage) {
		int endPage = (((startPage - 1) + pageIndexNum) / pageIndexNum)*pageIndexNum;
		
		if (totalPage <= endPage) {
			endPage = totalPage;
		}
		
		return endPage;
	}
	
	/**
	 * 새 알람 조회 후 반환
	 * by 영근 190424
	 */
	public List<NewAlarm> getNewAlarms(String id) {
		return cb_dao.selectNewAlarms(id);
	}
	
	/**
	 * 해당 유저의 전체 알람수 반환
	 * by 영근 190425
	 */
	public int getAlarmTotal(String id) {
		return cb_dao.selectAlarmTotal(id);
	}
	
	/**
	 * 알람 리스트 조회 후 반환
	 * by 영근 190425
	 */
	public List<Alarm> getAlarms(AlarmBbsVO abv) {
		return cb_dao.selectAlarms(abv);
	}
	
}
