package kr.co.studystory.domain;

public class WriterInfoDomain {

	private String img, nick;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	@Override
	public String toString() {
		return "WriterInfoDomain [img=" + img + ", nick=" + nick + "]";
	}

}// class
