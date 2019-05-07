package kr.co.studystory.vo;

/**
 * 검색 페이지에서 검색 조건을 저장하는 VO
 * 
 * @author owner
 *
 */
public class SearchSelectVO {

	private String order_select, loc_select, kind_select;
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
		return "SearchSelectVO [order_select=" + order_select + ", loc_select=" + loc_select + ", kind_select="
				+ kind_select + ", startNum=" + startNum + ", endNum=" + endNum + ", currentPage=" + currentPage + "]";
	}

}// class
