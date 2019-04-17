package kr.co.studystory.vo;

import java.util.List;

public class NewStudyNoticeVO {
	private String sNum, subject, meetingInfo, content, addr;
	private List<NewHomeworkVO> listHw;
	public String getsNum() {
		return sNum;
	}
	public String getSubject() {
		return subject;
	}
	public String getMeetingInfo() {
		return meetingInfo;
	}
	public String getContent() {
		return content;
	}
	public String getAddr() {
		return addr;
	}
	public List<NewHomeworkVO> getListHw() {
		return listHw;
	}
	public void setsNum(String sNum) {
		this.sNum = sNum;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setMeetingInfo(String meetingInfo) {
		this.meetingInfo = meetingInfo;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setListHw(List<NewHomeworkVO> listHw) {
		this.listHw = listHw;
	}
	
	
	
	
}
