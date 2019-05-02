package kr.co.studystory.vo;

public class RecruitVO {
	
	private String sNum;
	private String status;
	
	public String getsNum() {
		return sNum;
	}
	public void setsNum(String sNum) {
		this.sNum = sNum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "RecruitVO [sNum=" + sNum + ", status=" + status + "]";
	}
}
