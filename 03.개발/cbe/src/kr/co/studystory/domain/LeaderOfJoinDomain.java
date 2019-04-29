package kr.co.studystory.domain;

/**
 * study_info/study_join_req에 보여줄 Leader의 정보.
 * 
 * @author 재현
 *
 */
public class LeaderOfJoinDomain {

	private String leaderImg, nick, studyName;

	/* settter & getter */

	public String getLeaderImg() {
		return leaderImg;
	}

	public void setLeaderImg(String leaderImg) {
		this.leaderImg = leaderImg;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	/* settter & getter */

	@Override
	public String toString() {
		return "JoinLeaderDomain [leaderImg=" + leaderImg + ", nick=" + nick + ", studyName=" + studyName + "]";
	}// toString

}// class
