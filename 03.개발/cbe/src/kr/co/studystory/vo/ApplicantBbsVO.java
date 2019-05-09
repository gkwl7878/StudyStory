package kr.co.studystory.vo;

public class ApplicantBbsVO {
	private String s_num;
	private int begin, end, currPage;
	
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
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
