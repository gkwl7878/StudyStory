package kr.co.studystory.domain;

public class Homework {
	private String id, workload, finish_flag, nick;

	public String getId() {
		return id;
	}

	public String getWorkload() {
		return workload;
	}

	public String getFinish_flag() {
		return finish_flag;
	}

	public void setFinish_flag(String finish_flag) {
		this.finish_flag = finish_flag;
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


	public void setNick(String nick) {
		this.nick = nick;
	}
}
