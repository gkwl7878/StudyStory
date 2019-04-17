package kr.co.studystory.vo;

public class ModifiedPassVO {
	
	private String id, pass, newPass;

	public ModifiedPassVO(String id, String pass, String newPass) {
		this.id = id;
		this.pass = pass;
		this.newPass = newPass;
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

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
}
