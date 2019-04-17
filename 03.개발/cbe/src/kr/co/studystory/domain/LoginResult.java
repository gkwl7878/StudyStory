package kr.co.studystory.domain;

public class LoginResult {
	
	private boolean logged;
	private String msg;
	
	public boolean isLogged() {
		return logged;
	}
	public void setLogged(boolean logged) {
		this.logged = logged;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
