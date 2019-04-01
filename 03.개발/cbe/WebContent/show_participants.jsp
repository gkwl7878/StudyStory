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

	<!-- 페이지 타이틀 -->
	<div class="col-sm-1 col-md-12 p-4 bg-light mb-4 border-bottom">
		<p class="h3" style="text-align: center;">스터디 참여자 보기</p>
	</div>

	<!-- body -->
	<main role="main">

	<div class="container">
		<div class="border rounded p-2 bg-light mb-3">
			<div class="container">
				<div class="col-md-4">total</div>
			</div>
		</div>
	</div>

	<div class="album">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<div class="card mb-3" style="width: 10rem;">
						<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top">
						<div class="card-body card-body mx-auto">
							<h5 class="card-title text-center">이름</h5>
							<p class="card-text text-center">연락처</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card mb-3" style="width: 10rem;">
						<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top">
						<div class="card-body card-body mx-auto">
							<h5 class="card-title text-center">이름</h5>
							<p class="card-text text-center">연락처</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card mb-3" style="width: 10rem;">
						<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top">
						<div class="card-body card-body mx-auto">
							<h5 class="card-title text-center">이름</h5>
							<p class="card-text text-center">연락처</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card mb-3" style="width: 10rem;">
						<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top">
						<div class="card-body card-body mx-auto">
							<h5 class="card-title text-center">이름</h5>
							<p class="card-text text-center">연락처</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card mb-3" style="width: 10rem;">
						<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top">
						<div class="card-body card-body mx-auto">
							<h5 class="card-title text-center">이름</h5>
							<p class="card-text text-center">연락처</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card mb-3" style="width: 10rem;">
						<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top">
						<div class="card-body card-body mx-auto">
							<h5 class="card-title text-center">이름</h5>
							<p class="card-text text-center">연락처</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	</main>
	
	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>
</body>
</html>