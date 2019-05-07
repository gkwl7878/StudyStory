package kr.co.studystory.vo;

public class SearchListVO {

	private String order_select, loc_select, kind_select, search_inputBox;
	private int startNum, endNum, currentPage;

	public String getOrder_select() {
		return order_select;
	}

	public void setOrder_select(String order_select) {
		this.order_select = order_select;
	}

	public String getLoc_select() {
		return loc_select;
	}

	public void setLoc_select(String loc_select) {
		this.loc_select = loc_select;
	}

	public String getKind_select() {
		return kind_select;
	}

	public void setKind_select(String kind_select) {
		this.kind_select = kind_select;
	}

	public String getSearch_inputBox() {
		return search_inputBox;
	}

	public void setSearch_inputBox(String search_inputBox) {
		this.search_inputBox = search_inputBox;
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
		return "SearchListVO [order_select=" + order_select + ", loc_select=" + loc_select + ", kind_select="
				+ kind_select + ", search_inputBox=" + search_inputBox + ", startNum=" + startNum + ", endNum=" + endNum
				+ ", currentPage=" + currentPage + "]";
	}

}// class
