package kr.co.studystory.domain;

public class StudyNameAndRecruit {
	
	private String study_name, recruitment;

	public String getStudy_name() {
		return study_name;
	}

	public void setStudy_name(String study_name) {
		this.study_name = study_name;
	}

	public String getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(String recruitment) {
		this.recruitment = recruitment;
	}

	@Override
	public String toString() {
		return "StudyNameAndRecruit [study_name=" + study_name + ", recruitment=" + recruitment + "]";
	}
}
