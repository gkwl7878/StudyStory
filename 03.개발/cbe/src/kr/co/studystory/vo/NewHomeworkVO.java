package kr.co.studystory.vo;

public class NewHomeworkVO {
	private String sn_num, id, workload;

	public String getSn_num() {
		return sn_num;
	}

	public void setSn_num(String sn_num) {
		this.sn_num = sn_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWorkload() {
		return workload;
	}

	public void setWorkload(String workload) {
		this.workload = workload;
	}

	@Override
	public String toString() {
		return "NewHomeworkVO [sn_num=" + sn_num + ", id=" + id + ", workload=" + workload + "]";
	}
}
