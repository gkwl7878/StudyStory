package kr.co.studystory.domain;

public class Alarm {

	String a_num, category, subject, input_date, read_flag;

	public String getA_num() {
		return a_num;
	}

	public void setA_num(String a_num) {
		this.a_num = a_num;
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

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public String getRead_flag() {
		return read_flag;
	}

	public void setRead_flag(String read_flag) {
		this.read_flag = read_flag;
	}
}