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

/* 프로필 작성 */
.profile_wrap {
	margin: 0px auto;
	width: 1000px;
}

.img_subscript {
	width: 280px;
}

.ta_subscript {
	margin-left: 90px
}
/* 프로필 작성 */
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
				<h1 class="jumbotron-heading">프로필 관리</h1>
			</div>
		</section>
		<!-- 점보트론 : 전광판 -->


		<!-- CONTAINER DIV -->
		<div class="container mb-3" style="min-height: 700px;">
			<!-- row -->
			<div class="row border-top border-bottom pt-4 pb-4 justify-content-center">

				<!-- 왼쪽 사용자 이미지-->
				<div class="col-auto">
					<div class="card border-0 pr-0" style="width: 260px;">
						<img style="width: 200px; height: 200px;" src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top mx-auto d-block rounded-circle mt-3" alt="...">
						<div class="card-body text-center pt-0">
							<h5 class="card-title text-center m-4">프로필 사진</h5>
							<a href="#" class="btn btn-sm btn-primary mb-4">이미지 업로드</a>
							<p class="text-left text-muted">
								<small>사이즈는 가로 200px, 세로 200px에 최적화 되어 있으며 jpg, gif, png파일을 지원합니다.</small>
							</p>
						</div>
					</div>
				</div>
				<!-- 왼쪽 사용자 이미지-->


				<!-- 오른쪽-->
				<div class="col-auto" style="width: 600px;">
					<!-- 입력란 row -->
					<div class="row h-100 border-left align-items-center">
						<div class="row mr-3 ml-5 p-4 w-100 rounded">

							<form class="w-100">
								<div class="form-group row mb-4">
									<label for="nickname" class="col-2">닉네임</label>
									<div class="col-5">
										<input type="text" class="form-control">
									</div>
								</div>

								<div class="form-group row">
									<label for="introduce" class="col-2 pr-0 col-form-label">자기소개</label>
									<div class="col-9">
										<textarea class="form-control" rows="11"></textarea>
										<p class="mt-2 text-muted">
											<small> * 자기소개는 300자 까지 입력할 수 있습니다.</small>
										</p>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- 입력란 row -->
				</div>
				<!-- 오른쪽-->
			</div>
			<!-- row -->

			<!-- 등록하기 버튼 row -->
			<div class="row mt-5 justify-content-center">
				<div class="col-auto">
					<button class="btn btn-primary">등록하기</button>
				</div>
			</div>
			<!-- 등록하기 버튼 row -->

		</div>
		<!-- CONTAINER DIV -->
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