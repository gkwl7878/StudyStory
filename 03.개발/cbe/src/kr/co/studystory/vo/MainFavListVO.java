package kr.co.studystory.vo;

/**
 * 메인 페이지의 인기순의 시작과 끝 받기.
 * 
 * @author vkfqk
 *
 */
public class MainFavListVO {

	private int favStartNum, favEndNum;

	public int getFavStartNum() {
		return favStartNum;
	}

	public void setFavStartNum(int favStartNum) {
		this.favStartNum = favStartNum;
	}

	public int getFavEndNum() {
		return favEndNum;
	}

	public void setFavEndNum(int favEndNum) {
		this.favEndNum = favEndNum;
	}

	@Override
	public String toString() {
		return "MainFavListVO [favStartNum=" + favStartNum + ", favEndNum=" + favEndNum + "]";
	}

}// class
