package kr.co.studystory.admin.service;

import kr.co.studystory.admin.dao.CommonDAO;
import kr.co.studystory.admin.vo.LoginVO;

public class CommonMngService {
	
	public boolean login(LoginVO l_vo) {
		CommonDAO c_dao= CommonDAO.getInstance();
		boolean login_flag=c_dao.selectLogin(l_vo);
		return login_flag;
	}
	
	public static void main(String[] args) {
		CommonMngService cms= new CommonMngService();
		LoginVO l_vo= new LoginVO("admin", "1q2w3e");
		System.out.println("service==="+ cms.login(l_vo));
	}
}
