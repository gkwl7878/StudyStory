package kr.co.studystory.domain;

public class StudyCommentDomain {

	private String s_comment, input_date, id;

	/* getter & setter */

	public String getS_comment() {
		return s_comment;
	}

	public void setS_comment(String s_comment) {
		this.s_comment = s_comment;
	}

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/* getter & setter */

	@Override
	public String toString() {
		return "StudyCommentDomain [s_comment=" + s_comment + ", input_date=" + input_date + ", id=" + id + "]";
	}// toString

}// class
