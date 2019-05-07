package kr.co.studystory.vo;

public class NewCommentVO {
	private String snNum, snComment, id;
	
	public String getSnNum() {
		return snNum;
	}
	
	public String getSnComment() {
		return snComment;
	}
	
	public String getId() {
		return id;
	}
	
	public void setSnNum(String snNum) {
		this.snNum = snNum;
	}
	
	public void setSnComment(String snComment) {
		this.snComment = snComment;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "NewCommentVO [snNum=" + snNum + ", snComment=" + snComment + ", id=" + id + "]";
	}
}
