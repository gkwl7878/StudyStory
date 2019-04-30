package kr.co.studystory.vo;

import java.util.List;

public class CloseAlarmVO {
	private String reason, category, subject, content;
	private List<String> memberId;
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<String> getMemberId() {
		return memberId;
	}
	public void setMemberId(List<String> memberId) {
		this.memberId = memberId;
	}
	
	
}
