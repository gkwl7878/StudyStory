package kr.co.studystory.domain;

public class MyStudy {

	private String s_num, study_name, loc, category, study_img, user_img, recruitment, input_date, nick, deactivation;

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	public String getStudy_name() {
		return study_name;
	}

	public void setStudy_name(String study_name) {
		this.study_name = study_name;
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

	public String getStudy_img() {
		return study_img;
	}

	public void setStudy_img(String study_img) {
		this.study_img = study_img;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(String recruitment) {
		this.recruitment = recruitment;
	}

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getDeactivation() {
		return deactivation;
	}

	public void setDeactivation(String deactivation) {
		this.deactivation = deactivation;
	}

	@Override
	public String toString() {
		return "MyStudy [s_num=" + s_num + ", study_name=" + study_name + ", loc=" + loc + ", category=" + category
				+ ", study_img=" + study_img + ", user_img=" + user_img + ", recruitment=" + recruitment
				+ ", input_date=" + input_date + ", nick=" + nick + ", deactivation=" + deactivation + "]";
	}
}
