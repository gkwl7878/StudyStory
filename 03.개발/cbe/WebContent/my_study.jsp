<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">

<title>Bootstrap Template By Young</title>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="./Resources/css/jumbotron.css" rel="stylesheet">

</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>


	<!-- body -->
	<div role="main">

		<!-- 점보트론 : 전광판 -->
		<section class="jumbotron text-center bg-white mb-0">
			<div class="container">
				<h1 class="jumbotron-heading">내 스터디</h1>
			</div>
		</section>
		<!-- 점보트론 : 전광판 -->

		<!-- CONTAINER DIV -->
		<div class="container mb-3">
			<!-- row -->
			<div class="row justify-content-center">

				<!-- 왼쪽 사용자 상태 -->
				<div class="col-auto">
					<div class="card" style="width: 250px;">
						<img style="width: 200px; height: 200px;" src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top mx-auto d-block rounded-circle mt-3" alt="...">
						<div class="card-body text-center pt-0">
							<h5 class="card-title text-center m-4">닉네임</h5>
							<div class="border-top border-bottom mb-3">
								<div class="d-flex flex-row p-2 border-bottom">
									<div class="mr-auto">진행 중인 스터디</div>
									<div class="text-right">0</div>
									<div class=""> 건</div>
								</div>
								<div class="d-flex flex-row p-2 border-bottom">
									<div class="mr-auto">오픈 대기 스터디</div>
									<div class="text-right">10</div>
									<div class=""> 건</div>
								</div>
								<div class="d-flex flex-row p-2">
									<div class="mr-auto">종료 스터디</div>
									<div class="text-right">6</div>
									<div class=""> 건</div>
								</div>
							</div>
							<a href="#" class="btn btn-md btn-primary">프로필 관리</a>
						</div>
					</div>
				</div>
				<!-- 왼쪽 사용자 상태 -->


				<!-- 오른쪽-->
				<div class="col-auto" style="width: 800px;">

					<!-- 정렬바 row -->
					<div class="row mb-3" style="height: 3em;">
						<div class="row mr-3 ml-3 w-100 rounded bg-secondary align-items-center">

							<div class="col-auto mr-auto">
								<span>Total</span>
							</div>

							<div class="col-auto">
								<form action="">
									<select class="btn btn-light btn-sm dropdown-toggle ml-1">
										<option>지 역</option>
										<option>신 촌</option>
										<option>홍 대</option>
										<option>종 각</option>
										<option>건 대</option>
										<option>노 원</option>
										<option>강 남</option>
									</select>
									<select class="btn btn-light btn-sm dropdown-toggle ml-1">
										<option>종 류</option>
										<option>언 어</option>
										<option>취 업</option>
										<option>취 미</option>
										<option>기 타</option>
									</select>
									<input type="button" class="btn btn-sm btn-light ml-1" value="필터 검색" />
								</form>
							</div>
						</div>
					</div>
					<!-- 정렬바 row -->

					<!-- 썸네일 row -->
					<div class="row">
						<!-- 1번째 줄 시작 -->
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
										<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
										<text x="50%" y="50%" fill="#eceeef" dy=".3em">이미지</text></svg>
								<div class="card-body">
									<p class="card-text">제목부분</p>
									<p class="card-text">간략한 내용...(25자 이상 ...으로)</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<button type="button" class="btn btn-sm btn-outline-secondary">버튼1</button>
											<button type="button" class="btn btn-sm btn-outline-secondary">버튼2</button>
										</div>
										<small class="text-muted">날짜</small>
									</div>
								</div>
							</div>
						</div>
						<!-- 1번째 줄 시작 -->
					</div>
					<!-- 썸네일 row -->
				</div>
				<!-- 오른쪽-->
			</div>
			<!-- row -->
		</div>
		<!-- CONTAINER DIV -->
	</div>
	<!-- DIV ROLE MAIN -->



	<!-- footer -->
	<footer>
		<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>
	</footer>
	<!-- footer -->

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>
</body>
</html>