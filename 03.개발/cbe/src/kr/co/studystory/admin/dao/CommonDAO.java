package kr.co.studystory.admin.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.studystory.admin.vo.LoginVO;
import kr.co.studystory.admin.vo.NewStudyBoardVO;
import kr.co.studystory.admin.vo.NoticeBoardVO;
import kr.co.studystory.admin.vo.QuestionBoardVO;
import kr.co.studystory.admin.vo.StudyBoardVO;
import kr.co.studystory.admin.vo.UserBoardVO;


public class CommonDAO {
	private static CommonDAO c_dao;
	private SqlSessionFactory ssf=null;
	
	private CommonDAO() {
	}//CommonDAO
	
	public static CommonDAO getInstance() {
		if(c_dao==null) {
			c_dao=new CommonDAO();
		}//end if
		return c_dao;
	}//getInstance
	
	public synchronized SqlSessionFactory getSessionFactory() {
		if(ssf==null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();
			
			Reader reader = null;
			try {
				//1.설정용 xml 로딩
				reader = Resources.getResourceAsReader("kr/co/studystory/admin/dao/mybatis_config.xml");
				//2. MyBatis Framework생성
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				//3. DB와 연동된 객체 받기
				ssf=ssfb.build(reader);
				if(reader!=null) {
					reader.close();
				}
				
			} catch (IOException ie) {
				ie.printStackTrace();
			}//end catch
		}
		return ssf;
	}//getSessionFactory
	
	public boolean selectLogin(LoginVO l_vo) {
		boolean login_flag =false;
		int validCnt=0;
		SqlSession ss= CommonDAO.getInstance().getSessionFactory().openSession();
		validCnt= ss.selectOne("loginValid",l_vo);
		if(validCnt>0) {
			login_flag=true;
		}
		ss.close();
		return login_flag;
	}
	
	/**
	 *  한주 가입 유저 수
	 * @return
	 */
	public int selectWeekUser() {
		int weekUser=0;
		SqlSession ss= CommonDAO.getInstance().getSessionFactory().openSession();
		weekUser= ss.selectOne("countWeekUser");
		ss.close();
		return weekUser;
	}
	
	/**
	 * 한주 생성 스터디 수
	 * @return
	 */
	public int selectWeekStudy() {
		int weekStudy=0;
		SqlSession ss= CommonDAO.getInstance().getSessionFactory().openSession();
		weekStudy= ss.selectOne("countWeekStudy");
		ss.close();
		return weekStudy;
	}
	
	/**
	 * 모든 유저수
	 * @return
	 */
	public int selectAllUser() {
		int allUser=0;
		SqlSession ss= CommonDAO.getInstance().getSessionFactory().openSession();
		allUser= ss.selectOne("countAllUser");
		ss.close();
		return allUser;
	}
	
	/**
	 * 모든 스터디 수
	 * @return
	 */
	public int selectAllStudy() {
		int allStudy=0;
		SqlSession ss= CommonDAO.getInstance().getSessionFactory().openSession();
		allStudy= ss.selectOne("countAllStudy");
		ss.close();
		return allStudy;
	}
	
	/**
	 * NewStudy totalcount
	 * @return
	 */
	public int selectNewStudyTotal() {
		SqlSession ss= getSessionFactory().openSession();
		int totalCount= ss.selectOne("nsTotalCnt");
		ss.close();
		return totalCount;
	}
	
	/**
	 * user totalcount
	 * @return
	 */
	public int selectUserTotal(UserBoardVO ub_vo) {
		SqlSession ss= getSessionFactory().openSession();
		int totalCount= ss.selectOne("uTotalCnt",ub_vo);
		System.out.println("유저");
		ss.close();
		return totalCount;
	}
	
	/**
	 * study totalcount
	 * @return
	 */
	public int selectStudyTotal(StudyBoardVO sb_vo) {
		SqlSession ss= getSessionFactory().openSession();
		int totalCount= ss.selectOne("sTotalCnt",sb_vo);
		ss.close();
		return totalCount;
	}
	
	/**
	 * question totalcount
	 * @return
	 */
	public int selectQuestionTotal(QuestionBoardVO qb_vo) {
		SqlSession ss= getSessionFactory().openSession();
		int totalCount= ss.selectOne("qTotalCnt",qb_vo);
		ss.close();
		return totalCount;
	}
	
	/**
	 * question totalcount
	 * @return
	 */
	public int selectNoticeTotal(NoticeBoardVO nb_vo) {
		SqlSession ss= getSessionFactory().openSession();
		int totalCount= ss.selectOne("nTotalCnt",nb_vo);
		ss.close();
		return totalCount;
	}
	
	
	public static void main(String[] args) {
		CommonDAO c_dao = new CommonDAO();
		NoticeBoardVO nb_vo= new NoticeBoardVO();
		nb_vo.setSearchWord("베타");
		System.out.println(c_dao.selectNoticeTotal(nb_vo));
		
	}
	
	
	
}
