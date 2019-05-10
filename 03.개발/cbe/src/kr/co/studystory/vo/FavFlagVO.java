package kr.co.studystory.vo;

public class FavFlagVO {

	private String sNum, Color, my_id;

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	public String getColor() {
		return Color;
	}

	public void setColor(String flag) {
		this.Color = flag;
	}

	public String getMy_id() {
		return my_id;
	}

	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}

	@Override
	public String toString() {
		return "FavFlagVO [sNum=" + sNum + ", Color=" + Color + ", my_id=" + my_id + "]";
	}// toString

}// class
