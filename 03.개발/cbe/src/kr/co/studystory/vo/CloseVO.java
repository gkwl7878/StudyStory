package kr.co.studystory.vo;

public class CloseVO {
	String id, reason, sNum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	@Override
	public String toString() {
		return "CloseVO [id=" + id + ", reason=" + reason + ", sNum=" + sNum + "]";
	}
	
	
}
