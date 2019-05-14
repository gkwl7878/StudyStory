package kr.co.studystory.domain;

public class WriterInfoDomain {

	private String img, input_date;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	@Override
	public String toString() {
		return "WriterInfoDomain [img=" + img + ", input_date=" + input_date + "]";
	}
}// class
