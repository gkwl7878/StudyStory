package kr.co.studystory.domain;

public class StudyIMade {
	
	private String s_num, study_name, loc, category, img, recruitment, input_date, accept_flag, deactivation;

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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public String getAccept_flag() {
		return accept_flag;
	}

	public void setAccept_flag(String accept_flag) {
		this.accept_flag = accept_flag;
	}

	public String getDeactivation() {
		return deactivation;
	}

	public void setDeactivation(String deactivation) {
		this.deactivation = deactivation;
	}

	@Override
	public String toString() {
		return "StudyIMade [s_num=" + s_num + ", study_name=" + study_name + ", loc=" + loc + ", category=" + category
				+ ", img=" + img + ", recruitment=" + recruitment + ", input_date=" + input_date + ", accept_flag="
				+ accept_flag + ", deactivation=" + deactivation + "]";
	}
}
