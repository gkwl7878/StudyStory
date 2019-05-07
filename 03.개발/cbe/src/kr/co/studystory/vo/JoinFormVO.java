package kr.co.studystory.vo;

/**
 * JOIN 테이블에 인서트 하기위한 정보를 가지는 VO.
 * 
 * @author owner
 *
 */
public class JoinFormVO {

	private String joinerId, sNum, introduce, motive, leaderNick, studyName;

	public String getJoinerId() {
		return joinerId;
	}

	public void setJoinerId(String joinerId) {
		this.joinerId = joinerId;
	}

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getMotive() {
		return motive;
	}

	public void setMotive(String motive) {
		this.motive = motive;
	}

	public String getLeaderNick() {
		return leaderNick;
	}

	public void setLeaderNick(String leaderNick) {
		this.leaderNick = leaderNick;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	@Override
	public String toString() {
		return "JoinFormVO [joinerId=" + joinerId + ", sNum=" + sNum + ", introduce=" + introduce + ", motive=" + motive
				+ ", leaderNick=" + leaderNick + ", studyName=" + studyName + "]";
	}
}// class
