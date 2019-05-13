package kr.co.studystory.vo;

public class MainLatestListVO {

	private int latestCurPage, latestStartNum, latestEndNum;

	public int getLatestCurPage() {
		return latestCurPage;
	}

	public void setLatestCurPage(int latestCurPage) {
		this.latestCurPage = latestCurPage;
	}

	public int getLatestStartNum() {
		return latestStartNum;
	}

	public void setLatestStartNum(int latestStartNum) {
		this.latestStartNum = latestStartNum;
	}

	public int getLatestEndNum() {
		return latestEndNum;
	}

	public void setLatestEndNum(int latestEndNum) {
		this.latestEndNum = latestEndNum;
	}

	@Override
	public String toString() {
		return "MainLatestListVO [latestCurPage=" + latestCurPage + ", latestStartNum=" + latestStartNum
				+ ", latestEndNum=" + latestEndNum + "]";
	}

}// class
