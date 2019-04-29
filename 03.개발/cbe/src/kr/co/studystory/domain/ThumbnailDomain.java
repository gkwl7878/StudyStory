package kr.co.studystory.domain;

/**
 * ΩÊ≥ª¿œ Domain.
 * 
 * @author owner
 *
 */
public class ThumbnailDomain {

	private String sNum, studyName, loc, category, img, recruitment, inputDate, nick, userImg;
	private boolean favFlag;

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(String recruitment) {
		this.recruitment = recruitment;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public boolean isFavFlag() {
		return favFlag;
	}

	public void setFavFlag(boolean favFlag) {
		this.favFlag = favFlag;
	}

	@Override
	public String toString() {
		return "ThumbnailDomain [sNum=" + sNum + ", studyName=" + studyName + ", loc=" + loc + ", category=" + category + ", img=" + img + ", recruitment=" + recruitment + ", inputDate=" + inputDate + ", nick=" + nick + ", userImg=" + userImg + ", favFlag=" + favFlag + "]";
	}

}// class
