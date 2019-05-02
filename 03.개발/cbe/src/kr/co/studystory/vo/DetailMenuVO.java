package kr.co.studystory.vo;

public class DetailMenuVO {
	
	private String id, s_num;
	
	public DetailMenuVO(String id, String s_num) {
		this.id = id;
		this.s_num = s_num;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

}
