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
	<div role="main" style="min-height: 900px">

		<!-- 점보트론 : 전광판 -->
		<section class="jumbotron text-center bg-white m-0">
			<div class="container">
				<h1 class="jumbotron-heading">스터디 찾기</h1>
				<p class="lead text-muted">Something short and leading about the collection below—its contents,</p>
			</div>
		</section>
		<!-- 점보트론 : 전광판 -->

		<!-- 정렬바 -->
		<section class="search_bar border">
			<div class="container">
				<div class="row py-3 align-items-center m-0">

					<div class="col-auto pl-0 mr-auto">
						<select class="custom-select">
							<option>정 렬</option>
							<option>최신순</option>
							<option>인기순</option>
						</select>
					</div>

					<div class="col-auto">
						<form class="form-row align-item-center" action="">
							<div class="col-auto">
								<select class="custom-select">
									<option>지 역</option>
									<option>신 촌</option>
									<option>홍 대</option>
									<option>종 각</option>
									<option>건 대</option>
									<option>노 원</option>
									<option>강 남</option>
								</select>
							</div>
							<div class="col-auto">
								<select class="custom-select">
									<option>종 류</option>
									<option>언 어</option>
									<option>취 업</option>
									<option>취 미</option>
									<option>기 타</option>
								</select>
							</div>
							<input type="button" class="btn btn-sm btn-secondary ml-1" value="필터 검색" />
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- 정렬바 -->

		<!-- 썸네일 -->
		<div class="c_wrap py-5 bg-white">
			<!-- CONTAINER DIV -->
			<div class="container">
				<!-- row -->
				<div class="row justify-content-center">
					<!-- 오른쪽-->
					<div class="col-md-12">
						<!-- 썸네일 row -->
						<div class="row">
							<!-- 1번째 줄 시작 -->
							<div class="col-md-3">
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
		<!-- 썸네일 -->


		<!-- 페이지네이션 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<!-- 페이지 번호 -->
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<!-- 페이지 번호 -->

				<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
		<!-- 페이지네이션 -->

	</div>
	<!-- DIV ROLE MAIN -->


	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>
</body>
</html>