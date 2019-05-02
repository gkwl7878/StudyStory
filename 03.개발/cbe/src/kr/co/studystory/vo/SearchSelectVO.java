package kr.co.studystory.vo;

/**
 * 검색 페이지에서 검색 조건을 저장하는 VO
 * 
 * @author owner
 *
 */
public class SearchSelectVO {

	private String loc_select, kind_select;

	/* setter & getter */

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

	/* setter & getter */

	@Override
	public String toString() {
		return "SearchSelectVO [loc_select=" + loc_select + "]";
	}// toString

}// class
