package kr.co.studystory.domain;

public class StudyCommentDomain {

	private String s_comment, input_date, nick, img;

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

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "StudyCommentDomain [s_comment=" + s_comment + ", input_date=" + input_date + ", nick=" + nick + ", img="
				+ img + "]";
	}// toString

}// class
