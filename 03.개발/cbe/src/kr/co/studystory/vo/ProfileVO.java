package kr.co.studystory.vo;

public class ProfileVO {
	
	private String id, nick, introduce, img;

	public ProfileVO(String id, String nick, String introduce, String img) {
		this.id = id;
		this.nick = nick;
		this.introduce = introduce;
		this.img = img;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
