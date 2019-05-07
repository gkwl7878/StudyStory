package kr.co.studystory.vo;

public class NewStudyNoticeVO {
	private String s_num, subject, meeting_info, content, addr;
	
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMeeting_info() {
		return meeting_info;
	}
	public void setMeeting_info(String meeting_info) {
		this.meeting_info = meeting_info;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "NewStudyNoticeVO [s_num=" + s_num + ", subject=" + subject + ", meeting_info=" + meeting_info
				+ ", content=" + content + ", addr=" + addr + "]";
	}
}
