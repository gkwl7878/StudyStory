package kr.co.studystory.admin.service;

import kr.co.studystory.admin.dao.CommonDAO;
import kr.co.studystory.admin.domain.UserAndStudy;
import kr.co.studystory.admin.vo.LoginVO;
import kr.co.studystory.admin.vo.NewStudyBoardVO;
import kr.co.studystory.admin.vo.NoticeBoardVO;
import kr.co.studystory.admin.vo.QuestionBoardVO;
import kr.co.studystory.admin.vo.StudyBoardVO;
import kr.co.studystory.admin.vo.UserBoardVO;

public class CommonMngService {
	private CommonDAO c_dao;
	
	public CommonMngService() {
		c_dao= CommonDAO.getInstance();
	}//CommonMngService
	
	/**
	 * 로그인
	 * @param l_vo
	 * @return
	 */
	public boolean login(LoginVO l_vo) {
		CommonDAO c_dao= CommonDAO.getInstance();
		boolean login_flag=c_dao.selectLogin(l_vo);
		return login_flag;
	}
	
	/**
	 * 주간신규,주간스터디,총회원수,총스터디수 조회
	 * @return
	 */
	public UserAndStudy getCountUserAndStudy() {
		UserAndStudy uas= new UserAndStudy();
		CommonDAO c_dao= CommonDAO.getInstance();
		uas.setWeekUser(c_dao.selectWeekUser());
		uas.setWeekStudy(c_dao.selectWeekStudy());
		uas.setAllUser(c_dao.selectAllUser());
		uas.setAllStudy(c_dao.selectAllStudy());
		return uas;
	}
	
	
	/**
	 * new study의 totalcount 조회
	 * @param nsb_vo
	 * @return
	 */
	public int newStudyCount(NewStudyBoardVO nsb_vo) {
		CommonDAO c_dao= CommonDAO.getInstance();
		int totalPage=c_dao.selectNewStudyTotal();
		return totalPage;
	}
	
	public int userCount(UserBoardVO ub_vo) {
		CommonDAO c_dao= CommonDAO.getInstance();
		int totalPage=c_dao.selectUserTotal(ub_vo);
		return totalPage;
	}
	public int studyCount(StudyBoardVO sb_vo) {
		CommonDAO c_dao= CommonDAO.getInstance();
		int totalPage=c_dao.selectStudyTotal(sb_vo);
		return totalPage;
	}
	
	public int questionCount(QuestionBoardVO qb_vo) {
		CommonDAO c_dao= CommonDAO.getInstance();
		int totalPage=c_dao.selectQuestionTotal(qb_vo);
		return totalPage;
	}
	public int noticeCount(NoticeBoardVO nb_vo) {
		CommonDAO c_dao= CommonDAO.getInstance();
		int totalPage=c_dao.selectNoticeTotal(nb_vo);
		return totalPage;
	}
	
	/**
	 * new study 총 게시물의 수 얻기
	 * @return
	 */
	public int nsTotalCount() {
		int cnt=0;
		cnt = c_dao.selectNewStudyTotal();
		return cnt;
	}//nsTotalCount
	
	/**
	 * 한페이지에 보여줄 게시물의 수 
	 * @return
	 */
	public int pageScale() {
		int pageScale=10;
		return pageScale;
	}//pageScale
	
	/**
	 * 모든 게시물을 보여주기 위한 페이지 수
	 * @param totalCount
	 * @return
	 */
	public int totalPage(int totalCount) {
		int totalPage= totalCount/pageScale();
		if(totalCount%pageScale()!=0){
			totalPage++;
		}//end if
		return totalPage;
	}//totalPage
	
	/**
	 * 선택한 인덱스 리스트에서 조회할 시작 번호
	 * @param currentPage
	 * @return
	 */
	public int startNum(int currentPage) {
		int startNum=1;
		startNum= currentPage*pageScale()-pageScale()+1;
		return startNum;
	}//startNum
	
	/**
	 * 선택한 인덱스 리스트에서 조회할 끝 번호
	 * @param startNum
	 * @return
	 */
	public int endNum(int startNum) {
		int endNum=startNum+pageScale()-1;
		return endNum;
	}//endNum
	
	/**
	 * 게시판 이동버튼 만들기
	 * @param current_page
	 * @param total_page
	 * @param list_url
	 * @return
	 */
	public String indexList(int current_page, int total_page, String list_url) {
		int pagenumber; // 화면에 보여질 페이지 인덱스 수
		int startpage; // 화면에 보여질 시작페이지 번호
		int endpage; // 화면에 보여질 마지막페이지 번호
		int curpage; // 이동하고자 하는 페이지 번호

		String strList=""; // 리턴될 페이지 인덱스 리스트

		pagenumber = 10; // 한 화면의 페이지 인덱스 수 

		// 시작 페이지번호 구하기
		startpage = ((current_page - 1) / pagenumber) * pagenumber + 1;

		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 

		// 총 페이지 수가 마지막페이지 번호가 됨


		if (total_page <= endpage){
			endpage = total_page;
		}//end if

		// 첫번째 페이지 인덱스 화면이 아닌경우
		if ( current_page > pagenumber) {
			curpage = startpage - 1; // 시작페이지 번호보다 1 적은 페이지로 이동
			strList = strList + "[ <a href="+list_url+"?currentPage="+curpage+"> &lt;&lt; </a> ]";
		}else{
			strList = strList + "[<<]";
		}

		strList = strList + " ... ";

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;

		while (curpage <= endpage){
			if (curpage == current_page) {
				strList = strList + "[ "+current_page+" ]";
			} else {
				strList = strList +"[ <a href="+list_url+"?currentPage="+curpage+">"+curpage+" </a> ]";
			}//end else

			curpage++;
		}//end while

		strList = strList + " ... ";

		// 뒤에 페이지가 더 있는경우
		if ( total_page > endpage) {
			curpage = endpage + 1; 
			strList = strList + "[ <a href="+list_url+"?currentPage="+curpage+">&gt;&gt;</a> ]";
		}else{
			strList = strList + "[>>]";
		}//end else

		return strList;
		}//indexList
	
	public static void main(String[] args) {
		CommonMngService cms= new CommonMngService();
		System.out.println();
	}
}
