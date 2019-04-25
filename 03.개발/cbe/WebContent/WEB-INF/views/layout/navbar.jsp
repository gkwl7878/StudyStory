<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$("#showNewAlarm").click(function() {
			alert("이게 되나?");
		});
	});
</script>


<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
	<div class="container">

		<!-- 로고 -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample07">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link text-secondary dropdown-toggle" href="#" id="menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">메뉴</a>
					<div class="dropdown-menu" aria-labelledby="menu">
						<a class="dropdown-item" href="../common/introduction.do">서비스소개</a>
						<a class="dropdown-item" href="#">공지사항</a>
						<a class="dropdown-item" href="../common/faq.do">FAQ</a>
						<a class="dropdown-item" href="#">문의하기</a>
						<a class="dropdown-item" href="#">내 문의내역</a>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link text-secondary" href="#">스터디 찾기</a></li>
				<li class="nav-item"><a class="nav-link text-secondary" href="#">스터디 만들기</a></li>
			</ul>
			<a class="navbar-brand mx-auto text-dark" href="../study_info/main.do"><img src="/third_prj/resources/images/study_story_logo2.png" width="140" height="40"/></a>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="스터디명으로 찾아보세요" aria-label="Search">
				<button class="btn btn-outline-info my-2 my-sm-0 mr-sm-2" type="submit">검색</button>
			</form>
			<ul class="navbar-nav text-center">
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="my_menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img class="rounded-circle" src="/third_prj/resources/images/nav_icon_alarm.png" id="showNewAlarm" style="width: 36px; height: 36px;">
					</a>
					<div class="dropdown-menu" aria-labelledby="notice">
						<a class="dropdown-item" href="#">[공지사항] 안녕하십니까...</a>
						<a class="dropdown-item" href="#">[스터디] 가입이되었습니다...</a>
						<a class="dropdown-item" href="#">[공지사항] 안녕하십니까...</a>
						<a class="dropdown-item" href="#">더보기</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="my_menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img class="rounded-circle" src="/third_prj/resources/images/nav_icon_my_page.png" style="width: 35px; height: 35px;">
					</a>
					<div class="dropdown-menu" aria-labelledby="my_menu">
						<a class="dropdown-item" href="../study_group/my_study.do">내 스터디</a>
						<a class="dropdown-item" href="#">내가 만든 스터디</a>
						<a class="dropdown-item" href="#">관심 스터디 보기</a>
						<a class="dropdown-item" href="#">알림보기</a>
						<a class="dropdown-item" href="../common/profile.do">프로필 관리</a>
						<a class="dropdown-item" href="../common/user_modify_menu.do">회원정보 관리</a>
						<a class="dropdown-item" href="../logout.do">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>


