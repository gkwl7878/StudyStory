package kr.co.studystory.vo;

public class ModifiedStudyVO {
	
	private  String sNum, content, img;

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "ModifiedStudyVO [sNum=" + sNum + ", content=" + content + ", img=" + img + "]";
	}
	
	
}
