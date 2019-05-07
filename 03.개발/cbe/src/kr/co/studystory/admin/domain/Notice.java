package kr.co.studystory.admin.domain;

public class Notice {
	private String nNum, subject, inputDate;
	private int viewCnt;
	
	public String getnNum() {
		return nNum;
	}
	public void setnNum(String nNum) {
		this.nNum = nNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	
}
