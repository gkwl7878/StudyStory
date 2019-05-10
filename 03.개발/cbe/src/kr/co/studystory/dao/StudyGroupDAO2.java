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
import kr.co.studystory.domain.Joiner;
import kr.co.studystory.domain.MemberWithImg;
import kr.co.studystory.vo.ApplicantBbsVO;
import kr.co.studystory.vo.DetailJoinerVO;
import kr.co.studystory.vo.JoinAlarmVO;
import kr.co.studystory.vo.JoinDeleteVO;
import kr.co.studystory.vo.NewMemberVO;
import kr.co.studystory.vo.RefuseAlarmVO;
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
	
	/**
	 * 신청자 총 합계 구하기 - 정미
	 */
	public int selectJoinerTotal(String s_num) {
		int jTotal=0;
		
		SqlSession ss= StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		jTotal=ss.selectOne("selectJoinerTotal", s_num);
		ss.close();
		
		return jTotal;
	}
	
	/**
	 * 신청자 디테일 정보 - 정미
	 */
	public Joiner selectJoiner(DetailJoinerVO djvo) {
		Joiner jr=null;
		
		SqlSession ss=StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		jr=ss.selectOne("selectDetailJoiner",djvo);
		ss.close();
		
		return jr;
	}
	
	public boolean insertNewMember(NewMemberVO nmvo) {
		boolean insertNewMemberflag=false;
		int cnt=0;
		SqlSession ss=StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		cnt=ss.insert("insertNewMember",nmvo);
		if(cnt>0) {
			insertNewMemberflag = true;
			ss.commit();
		}
		ss.close();
		return insertNewMemberflag;
	}
	
	public void insertJoinAlarm(JoinAlarmVO javo) {
		SqlSession ss=StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		ss.insert("insertJoinedAlarm", javo);
		ss.close();
	}
	
	public void insertRefuseAlarm(RefuseAlarmVO rfavo) {
		SqlSession ss=StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		ss.insert("insertRefuseAlarm", rfavo);
		ss.close();
	}
	
	public String selectStudyName(String s_num) {
		SqlSession ss=StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		String study_name = ss.selectOne("selectStudyName", s_num);
		ss.close();
		return study_name;
	}
	
	public boolean deleteJoin(JoinDeleteVO jdvo) {
		boolean flag = false;
		SqlSession ss= StudyGroupDAO2.getInstance().getSessionFactory().openSession();
		int cnt=ss.delete("deleteJoiner",jdvo);
		if(cnt == 1) {
			ss.commit();
			flag = true;
		}//end if
		ss.close();
		return flag;
	}
	
	
	//단위테스트
	public static void main(String[] args) {
		//ApplicantBbsVO abvo=new ApplicantBbsVO();
		//abvo.setsNum("s_000069");
		/*abvo.setBegin(1);
		abvo.setEnd(2);
		abvo.setCurrPage(1);*/
		
		//sg_dao.selectJoinerList(new ApplicantBbsVO());
		//System.out.println(sgd.selectJoinerList(abvo));
		StudyGroupDAO2 sgd=new StudyGroupDAO2();
		
		DetailJoinerVO djvo=new DetailJoinerVO();
		djvo.setId("wjdaks12");
		djvo.setS_num("s_000069");
		sg_dao.selectJoiner(new DetailJoinerVO());//왜 여기서 null이 나오지?
		System.out.println(sgd.selectJoiner(djvo));
		
	} 
	
}
