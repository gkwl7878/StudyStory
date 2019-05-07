package kr.co.studystory.domain;

/**
 * ΩÊ≥ª¿œ Domain.
 * 
 * @author owner
 *
 */
public class ThumbnailDomain {
	private String s_num, study_name, loc, category, img, recruitment, input_date, nick, user_img;
	private boolean favFlag;

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

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public boolean isFavFlag() {
		return favFlag;
	}

	public void setFavFlag(boolean favFlag) {
		this.favFlag = favFlag;
	}

	@Override
	public String toString() {
		return "ThumbnailDomain [s_num=" + s_num + ", study_name=" + study_name + ", loc=" + loc + ", category="
				+ category + ", img=" + img + ", recruitment=" + recruitment + ", input_date=" + input_date + ", nick="
				+ nick + ", user_img=" + user_img + ", favFlag=" + favFlag + "]";
	}// toString

}// class
