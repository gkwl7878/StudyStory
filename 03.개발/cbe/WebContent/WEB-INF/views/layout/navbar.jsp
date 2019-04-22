<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
						<a class="dropdown-item" href="#">서비스소개</a>
						<a class="dropdown-item" href="#">공지사항</a>
						<a class="dropdown-item" href="#">문의하기</a>
						<a class="dropdown-item" href="#">FAQ</a>
						<a class="dropdown-item" href="#">문의 내역 확인</a>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link text-secondary" href="#">스터디 찾기</a></li>
				<li class="nav-item"><a class="nav-link text-secondary" href="#">스터디 만들기</a></li>
			</ul>
			<a class="navbar-brand mx-auto text-dark" href="#">스터디 스토리</a>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-info my-2 my-sm-0 mr-sm-2" type="submit">검색</button>
			</form>
			<ul class="navbar-nav text-center">
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="my_menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img class="rounded-circle" src="http://localhost:8080/third_prj/resources/images/nav_icon_alarm.png" style="width: 36px; height: 36px;">
					</a>
					<div class="dropdown-menu" aria-labelledby="notice">
						<a class="dropdown-item" href="#">더 보기</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="my_menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img class="rounded-circle" src="http://localhost:8080/third_prj/resources/images/nav_icon_my_page.png" style="width: 35px; height: 35px;">
					</a>
					<div class="dropdown-menu" aria-labelledby="my_menu">
						<a class="dropdown-item" href="#">내 스터디</a>
						<a class="dropdown-item" href="#">내가 만든 스터디</a>
						<a class="dropdown-item" href="#">관심 스터디 보기</a>
						<a class="dropdown-item" href="#">알림보기</a>
						<a class="dropdown-item" href="#">프로필 관리</a>
						<a class="dropdown-item" href="#">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>


