package kr.co.studystory.vo;

import java.util.List;

public class snAlarmVO {
	private String category, subject, content;
	private List<String> member;
	public String getCategory() {
		return category;
	}
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public List<String> getMember() {
		return member;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setMember(List<String> member) {
		this.member = member;
	}
	
	

}
