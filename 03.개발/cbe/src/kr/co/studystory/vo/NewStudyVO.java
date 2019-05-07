package kr.co.studystory.vo;

public class NewStudyVO {
	
	public String study_name, loc, category, content, img, id;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "NewStudyVO [study_name=" + study_name + ", loc=" + loc + ", category=" + category + ", content="
				+ content + ", img=" + img + ", id=" + id + "]";
	}
}
