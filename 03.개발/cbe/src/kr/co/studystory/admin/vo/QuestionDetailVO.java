package kr.co.studystory.admin.vo;

public class QuestionDetailVO {
	private String qNum, answerFlag;
	private int currPage;
	public String getqNum() {
		return qNum;
	}
	public void setqNum(String qNum) {
		this.qNum = qNum;
	}
	public String getAnswerFlag() {
		return answerFlag;
	}
	public void setAnswerFlag(String answerFlag) {
		this.answerFlag = answerFlag;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
}
