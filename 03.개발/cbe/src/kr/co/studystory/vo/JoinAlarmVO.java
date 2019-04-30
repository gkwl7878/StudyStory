package kr.co.studystory.vo;

/**
 * 참여 신청가 정상적으로 인서트 되었을 때. ALARM 테이블에 인서트 하기 위한 정보를 가지는 VO
 * 
 * @author owner
 *
 */
public class JoinAlarmVO {

	private String content, studyName;

	/* setter & getter */

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	/* setter & getter */

	@Override
	public String toString() {
		return "JoinAlarmVO [content=" + content + ", studyName=" + studyName + "]";
	}// toString

}// class
