package kr.co.studystory.domain;

public class MyQuestion {

	private String q_num, category, subject, answer_flag, input_date;

	public String getQ_num() {
		return q_num;
	}

	public void setQ_num(String q_num) {
		this.q_num = q_num;
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

	public String getAnswer_flag() {
		return answer_flag;
	}

	public void setAnswer_flag(String answer_flag) {
		this.answer_flag = answer_flag;
	}

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
}
