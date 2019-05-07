package kr.co.studystory.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.studystory.admin.dao.AdCommonDAO;
import kr.co.studystory.admin.dao.QnDAO;
import kr.co.studystory.admin.domain.DetailNotice;
import kr.co.studystory.admin.domain.Notice;
import kr.co.studystory.admin.vo.NewNoticeVO;
import kr.co.studystory.admin.vo.NoticeBoardVO;
import kr.co.studystory.admin.vo.NoticeModifyVO;

@Component
public class NoticeService {
	@Autowired
	private QnDAO qn_dao;
	
	@Autowired
	private AdCommonDAO ac_dao;
	
	
	public List<Notice> searchNotice(NoticeBoardVO nb_vo) {
		List<Notice> list =new ArrayList<Notice>();
		Notice notice=null;
		String subject="";
		list= qn_dao.selectNotice(nb_vo);
		for(int i=0; i<list.size();i++) {
			notice=list.get(i);
			subject = notice.getSubject();
			if(subject.length()>25) {
				subject= subject.substring(0, 24)+"...";
				notice.setSubject(subject);
			}//end if
		}//end for
		return list;
	}
	
	public DetailNotice searchDetailNotice(String nNum) {
		DetailNotice dn= qn_dao.selectDetailNotice(nNum);
		return dn;
	}
	
	public boolean modifyDetailNotice(NoticeModifyVO nm_vo) {
		boolean modifyNoticeFlag= qn_dao.updateNotice(nm_vo);
		return modifyNoticeFlag;
	}
	
	public boolean removeNotice(String nNum) {
		boolean removeNotice= qn_dao.deleteNotice(nNum);
		return removeNotice;
	}
	
	public List<String> getAllUser() {
		List<String> allUserList= qn_dao.selectAllUser();
		return allUserList;
	}
	
	public void newNotice(NewNoticeVO nn_vo) {
		qn_dao.insertNotice(nn_vo);
	}
	
	
}
