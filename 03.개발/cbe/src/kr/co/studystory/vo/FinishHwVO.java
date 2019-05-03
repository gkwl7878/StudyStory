package kr.co.studystory.vo;

public class FinishHwVO {

	private String sn_num, id;

	public String getSn_num() {
		return sn_num;
	}

	public void setSn_num(String sn_num) {
		this.sn_num = sn_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "FinishHwVO [sn_num=" + sn_num + ", id=" + id + "]";
	}
}
