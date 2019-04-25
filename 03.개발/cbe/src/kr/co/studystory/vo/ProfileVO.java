package kr.co.studystory.vo;

public class ProfileVO {
	
	private String id, nick, introduce;

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

	@Override
	public String toString() {
		return "ProfileVO [id=" + id + ", nick=" + nick + ", introduce=" + introduce + "]";
	}
}
