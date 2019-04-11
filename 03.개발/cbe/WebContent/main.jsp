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
	<main role="main">

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">메인 페이지</h1>
			<p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but
				not too short so folks don’t simply skip over it entirely.</p>
		</div>
	</section>

	<!-- CONTAINER DIV -->
	<div class="container-fluid">
		<!-- row -->
		<div class="row justify-content-center">
			<div class="col-auto" style="width: 1000px;">
				<!-- 썸네일 row -->
				<div class="row">
					<!-- 1번째 줄 시작 -->
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<img class="card-img-top" src="http://localhost:8080/third_prj/Resources/images/no_img.png">
							<div class="card-body text-center p-3">

								<div class="d-flex justify-content-end align-items-center mb-3">
									<div class="mr-5">
										<small class="text-muted">2019/00/00</small>
									</div>
									<small class="pr-1">모집상태</small>
								</div>
								<div class="px-3 border-bottom">
									<p class="card-text pb-3">
										<strong>제목부분</strong> <br> <small>내용 어쩌구 어쩌구 내용 어쩌구 어쩌구 내용 어쩌구 어쩌구</small>
									</p>
								</div>
								<div class="d-flex justify-content-between align-items-center mt-3 px-2">

									<div class="border border-secondary rounded-circle" style="width: 45px; height: 45px;">
										<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top w-100 rounded-circle">
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
		</div>
		<!-- row -->
	</div>
	<!-- CONTAINER DIV --> </main>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>
</body>
</html>