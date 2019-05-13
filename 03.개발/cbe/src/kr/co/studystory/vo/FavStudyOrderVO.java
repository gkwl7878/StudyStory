package kr.co.studystory.vo;

/**
 * 관심 스터디에서 정렬 조건을 받는 VO.
 * 
 * @author vkfqk
 *
 */
public class FavStudyOrderVO {

	private String fav_order_select, fav_loc_select, fav_kind_select, my_id;
	private int startNum, endNum, currentPage;

	public String getFav_order_select() {
		return fav_order_select;
	}

	public void setFav_order_select(String fav_order_select) {
		this.fav_order_select = fav_order_select;
	}

	public String getFav_loc_select() {
		return fav_loc_select;
	}

	public void setFav_loc_select(String fav_loc_select) {
		this.fav_loc_select = fav_loc_select;
	}

	public String getFav_kind_select() {
		return fav_kind_select;
	}

	public void setFav_kind_select(String fav_kind_select) {
		this.fav_kind_select = fav_kind_select;
	}

	public String getMy_id() {
		return my_id;
	}

	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "FavStudyOrderVO [fav_order_select=" + fav_order_select + ", fav_loc_select=" + fav_loc_select + ", fav_kind_select=" + fav_kind_select + ", my_id=" + my_id + ", startNum=" + startNum + ", endNum=" + endNum + ", currentPage=" + currentPage + "]";
	}// toString

}// class
