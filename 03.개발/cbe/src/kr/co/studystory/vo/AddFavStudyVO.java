package kr.co.studystory.vo;

public class AddFavStudyVO {

	private String sNum, my_id;

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	public String getMy_id() {
		return my_id;
	}

	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}

	@Override
	public String toString() {
		return "AddFavStudyVO [sNum=" + sNum + ", my_id=" + my_id + "]";
	}

}// class
