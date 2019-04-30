<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>

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
<link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">
<!-- 확인용 CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- 확인용 CDN -->
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>


	<!-- body -->
	<div role="main" style="min-height: 900px">

		<!-- 점보트론 : 전광판 -->
		<section class="text-center bg-white mb-0" style="margin-top: 30px; margin-bottom: 20px;">
			<div class="container">
				<h1 class="jumbotron-heading">내 스터디</h1>
			</div>
		</section>
		<div style="height: 20px;"></div>
		<!-- 점보트론 : 전광판 -->

		<!-- CONTAINER DIV -->
		<div class="container-fluid">
			<!-- row -->
			<div class="row justify-content-center">

				<!-- 왼쪽 사용자 상태 -->
				<div class="col-auto">
					<div class="card" style="width: 250px;">
						<img src="http://localhost:8080/third_prj/resources/images/no_img.png" class="card-img-top w-75 mx-auto d-block rounded-circle mt-3">
						<div class="card-body text-center pt-0">
							<h6 class="card-title text-center my-3">
								<strong>닉네임</strong>
							</h6>
							<div class="border-top border-bottom my-4">
								<div class="d-flex flex-row p-2 border-bottom">
									<div class="mr-auto">
										<small>진행 중인 스터디</small>
									</div>
									<div class="text-right">
										<small>10</small>
									</div>
									<div class="">
										<small> 건</small>
									</div>
								</div>
								<div class="d-flex flex-row p-2 border-bottom">
									<div class="mr-auto">
										<small>오픈 대기 스터디</small>
									</div>
									<div class="text-right">
										<small>10</small>
									</div>
									<div class="">
										<small> 건</small>
									</div>
								</div>
								<div class="d-flex flex-row p-2">
									<div class="mr-auto">
										<small>종료 스터디</small>
									</div>
									<div class="text-right">
										<small>10</small>
									</div>
									<div class="">
										<small> 건</small>
									</div>
								</div>
							</div>
							<a href="#" class="btn btn-sm btn-primary">프로필 관리</a>
						</div>
					</div>
				</div>
				<!-- 왼쪽 사용자 상태 -->


				<!-- 오른쪽-->
				<div class="col-auto" style="width: 1000px;">

					<!-- 정렬바 row -->
					<div class="row mb-3" style="height: 4em;">
						<div class="row mx-3 w-100 border-top border-bottom align-items-center">

							<div class="col-auto mr-auto">
								<span>Total</span>
							</div>

							<div class="col-auto">
								<form class="form-row align-item-center" action="">
									<div class="col-auto">
										<select class="form-control-sm">
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
										<select class="form-control-sm">
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
					<!-- 정렬바 row -->

					<!-- 썸네일 row -->
					<div class="row">
						<!-- 1번째 줄 시작 -->
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top" src="http://localhost:8080/third_prj/resources/images/no_img.png">
								<div class="card-body text-center p-3">

									<div class="d-flex justify-content-end align-items-center mb-3">
										<div class="mr-5">
											<small class="text-muted">2019/00/00</small>
										</div>
										<small class="pr-1">모집상태</small>
									</div>
									<div class="px-3 border-bottom">
										<p class="card-text pb-3">
											<strong>제목부분</strong>
										</p>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3 px-2">

										<div class="border border-secondary rounded-circle" style="width: 45px; height: 45px;">
											<img src="http://localhost:8080/third_prj/resources/images/no_img.png" class="card-img-top w-100 rounded-circle">
										</div>

										<div class="border-right p-2">
											<small>닉네임</small>
										</div>

										<div class="border-right p-2">
											<small>위치</small>
										</div>

										<div class="p-2">
											<small>종류</small>
										</div>


										<!-- 토글버튼 : 좋아요를 누르면  .active를 주세요. -->
										<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="button" aria-pressed="false" autocomplete="off">좋아요</button>

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
	<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>