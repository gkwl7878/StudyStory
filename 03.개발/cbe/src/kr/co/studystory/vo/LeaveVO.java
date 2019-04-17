package kr.co.studystory.vo;

public class LeaveVO {
	
	private String id, pass;

	public LeaveVO(String id, String pass) {
		this.id = id;
		this.pass = pass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
}
