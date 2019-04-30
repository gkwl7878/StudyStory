package kr.co.studystory.vo;

/**
 * JOIN 테이블에 인서트 하기위한 정보를 가지는 VO.
 * 
 * @author owner
 *
 */
public class JoinFormVO {

	private String joinerId, sNum, introduce_ta, apply_ta;

	/* setter & getter */

	public String getJoinerId() {
		return joinerId;
	}

	public void setJoinerId(String joinerId) {
		this.joinerId = joinerId;
	}

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

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

	/* setter & getter */

	@Override
	public String toString() {
		return "JoinFormVO [joinerId=" + joinerId + ", sNum=" + sNum + ", introduce_ta=" + introduce_ta + ", apply_ta=" + apply_ta + "]";
	}// toString

}// class
