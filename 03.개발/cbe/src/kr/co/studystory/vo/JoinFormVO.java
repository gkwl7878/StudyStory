package kr.co.studystory.vo;

public class JoinFormVO {
	private String introduce_ta, apply_ta, id, s_num;

	/* setter & getter */

	public String getIntroduce_ta() {
		return introduce_ta;
	}

	public void setIntroduce_ta(String introduce_ta) {
		this.introduce_ta = introduce_ta;
	}

	public String getApply_ta() {
		return apply_ta;
	}

	public void setApply_ta(String apply_ta) {
		this.apply_ta = apply_ta;
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

	/* setter & getter */

	@Override
	public String toString() {
		return "JoinFormVO [introduce_ta=" + introduce_ta + ", apply_ta=" + apply_ta + ", id=" + id + ", s_num=" + s_num
				+ "]";
	}// toString

}// class
