package kr.co.studystory.domain;

public class JoinBbs {
	private String id, nick, img, motive, input_date,accept_flag;

	
	
	public void setAccept_flag(String accept_flag) {
		this.accept_flag = accept_flag;
	}

	public String getAccept_flag() {
		return accept_flag;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public String getInput_date() {
		return input_date;
	}

	public String getId() {
		return id;
	}

	public String getNick() {
		return nick;
	}

	public String getImg() {
		return img;
	}

	public String getMotive() {
		return motive;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setMotive(String motive) {
		this.motive = motive;
	}
	
	
	

}
