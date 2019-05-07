package kr.co.studystory.domain;

public class StudyNotice {
	private String snNum, subject, img, inputDate;
	private int commentNum;

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public String getSnNum() {
		return snNum;
	}

	public String getSubject() {
		return subject;
	}

	public String getImg() {
		return img;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setSnNum(String snNum) {
		this.snNum = snNum;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	
	
}
