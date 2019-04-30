package kr.co.studystory.domain;

public class Homework {
	private String id, workload, finishFlag, nick;

	public String getId() {
		return id;
	}

	public String getWorkload() {
		return workload;
	}

	public String getFinishFlag() {
		return finishFlag;
	}

	public String getNick() {
		return nick;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setWorkload(String workload) {
		this.workload = workload;
	}

	public void setFinishFlag(String finishFlag) {
		this.finishFlag = finishFlag;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
}
