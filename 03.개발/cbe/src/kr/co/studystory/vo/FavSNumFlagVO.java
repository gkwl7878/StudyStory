package kr.co.studystory.vo;

/**
 * 내가 좋아요한 썸네일인지 비교할 VO.
 * 
 * @author owner
 *
 */
public class FavSNumFlagVO {

	private String id, myFavSNum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMyFavSNum() {
		return myFavSNum;
	}

	public void setMyFavSNum(String myFavSNum) {
		this.myFavSNum = myFavSNum;
	}

	@Override
	public String toString() {
		return "FavSNumFlagVO [id=" + id + ", myFavSNum=" + myFavSNum + "]";
	}// toString

}// class
