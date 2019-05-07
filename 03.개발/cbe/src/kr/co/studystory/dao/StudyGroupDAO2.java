package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.studystory.domain.JoinBbs;
import kr.co.studystory.domain.MemberWithImg;
import kr.co.studystory.vo.ApplicantBbsVO;
@Component
public class StudyGroupDAO2 {

	private static StudyGroupDAO2 sg_dao;
	private SqlSessionFactory ssf=null;
	
	private StudyGroupDAO2() {
	}//StudyNoticeDAO
	
	public static StudyGroupDAO2 getInstance() {
		if(sg_dao==null) {
			sg_dao=new StudyGroupDAO2();
		}//end if
		return sg_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSessionFactory() {
		if(ssf==null) {
		Reader reader=null;

		try {
			reader=Resources.getResourceAsReader("kr/co/studystory/dao/mybatis_config.xml");
			SqlSessionFactoryBuilder ssfb= new SqlSessionFactoryBuilder();
			ssf=ssfb.build(reader);
			if(reader !=null) {reader.close();}
		} catch (IOException ie) {
			ie.printStackTrace();
		}//end catch
		}//end if
		return ssf;
	}//getSessionFactory
		
	
	/**
	 * 스터디 참여자 보기 ( 이미지띄우기 ) - 정미
	 * @param sNum
	 * @return
	 */
	public List<MemberWithImg> selectMemberWithImg(String sNum){
		List<MemberWithImg> list=null;
		SqlSession ss=getSessionFactory().openSession();
		list=ss.selectList("selectMemberList",sNum);
		ss.close();
		return list;
	}//selectMemberWithImg
	
	/**
	 * 신청자 조회해오는 메서드
	 */
	public List<JoinBbs> selectJoinerList(ApplicantBbsVO abvo){
		List<JoinBbs> list= null;
		
		SqlSession ss=getSessionFactory().openSession();
		list=ss.selectList("selectJoinerList",abvo);
		ss.close();
		
		return list;
	}//selectJoinerList
	
	public int selectJoinerTotal(String s_num) {
		int jTotal=0;
		
		SqlSession ss= StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		jTotal=ss.selectOne("selectJoinerTotal", s_num);
		ss.close();
		
		return jTotal;
	}
	
	//단위테스트
	/*public static void main(String[] args) {
		ApplicantBbsVO abvo=new ApplicantBbsVO();
		abvo.setsNum("s_000069");
		abvo.setBegin(1);
		abvo.setEnd(2);
		abvo.setCurrPage(1);
		
		//sg_dao.selectJoinerList(new ApplicantBbsVO());
		StudyGroupDAO2 sgd=new StudyGroupDAO2();
		System.out.println(sgd.selectJoinerList(abvo));
		
		
	}단위테스트 */
	
}
