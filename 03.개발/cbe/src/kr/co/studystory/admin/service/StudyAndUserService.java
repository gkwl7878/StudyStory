package kr.co.studystory.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.ClassClassPath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.dao.StudyAndUserDAO;
import kr.co.studystory.admin.domain.DetailNewStudyInfo;
import kr.co.studystory.admin.domain.NewStudyInfo;
import kr.co.studystory.admin.vo.AcceptVO;
import kr.co.studystory.admin.vo.NsBoardVO;

@Component
public class StudyAndUserService {
	@Autowired
	private StudyAndUserDAO sau_dao;
	
	public List<NewStudyInfo> searchNewStudy(NsBoardVO nb_vo) {
		List<NewStudyInfo> list =new ArrayList<NewStudyInfo>();
		NewStudyInfo nsi=null;
		String studyName="";
		list= sau_dao.selectNewStudy(nb_vo);
		for(int i=0; i<list.size();i++) {
			nsi=list.get(i);
			studyName = nsi.getStudyName();
			if(studyName.length()>25) {
				studyName= studyName.substring(0, 24)+"...";
				nsi.setStudyName(studyName);
			}//end if
		}//end for
		
		return list;
	}
	
	public DetailNewStudyInfo detailNewStudy(String sNum) {
		DetailNewStudyInfo dnsi=sau_dao.selectDetailNewStudy(sNum);
		return dnsi;
	}
	
	public boolean acceptStudy(AcceptVO a_vo) {
		boolean acceptFlag= false;
		acceptFlag =sau_dao.updeteAccept(a_vo);
		if(acceptFlag) {
			System.out.println("¾Ë¶÷");
		}
		return acceptFlag;
	}
	
	public static void main(String[] args) {
//		 StudyAndUserService saus= new StudyAndUserService();
//		 AcceptVO a_vo= new AcceptVO();
//		 a_vo.setsNum("s_000021");
//		 saus.acceptStudy(a_vo);
		
	}
}
