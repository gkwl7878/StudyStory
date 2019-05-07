package kr.co.studystory.vo;

public class ApplicantBbsVO {
	private String sNum;
	private int begin, end, currPage;
	
	public String getsNum() {
		return sNum;
	}
	public int getBegin() {
		return begin;
	}
	public int getEnd() {
		return end;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setsNum(String sNum) {
		this.sNum = sNum;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
	
	
	

}
