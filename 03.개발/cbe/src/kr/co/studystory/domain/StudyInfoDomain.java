package kr.co.studystory.domain;

public class StudyInfoDomain {

	private String studyName, loc, category, content, studyImg, leaderImg, inputDate, nick, introduce;
	// private int favNum, memberNum; // 좋아요 갯수, 스터디 참여자 수.

	/* getter & setter */

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStudyImg() {
		return studyImg;
	}

	public void setStudyImg(String studyImg) {
		this.studyImg = studyImg;
	}

	public String getLeaderImg() {
		return leaderImg;
	}

	public void setLeaderImg(String leaderImg) {
		this.leaderImg = leaderImg;
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

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	/* getter & setter */

	@Override
	public String toString() {
		return "StudyInfoDomain [studyName=" + studyName + ", loc=" + loc + ", category=" + category + ", content="
				+ content + ", studyImg=" + studyImg + ", leaderImg=" + leaderImg + ", inputDate=" + inputDate
				+ ", nick=" + nick + ", introduce=" + introduce + "]";
	}

}// class
