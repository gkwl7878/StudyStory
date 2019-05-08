package kr.co.studystory.vo;

/**
 * 관심 스터디를 제거 하기 위한 VO.
 * 
 * @author vkfqk
 *
 */
public class RemoveFavStudyVO {

	private String sNum, id;

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "RemoveFavStudyVO [sNum=" + sNum + ", id=" + id + "]";
	}

}// class
