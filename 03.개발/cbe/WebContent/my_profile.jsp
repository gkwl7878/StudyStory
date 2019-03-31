<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

.profile_wrap{
	margin: 0px auto;
	width: 1000px;
}

.img_subscript{
	width: 280px;
}

.ta_subscript{
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

	<!-- 페이지 타이틀 DIV -->
	<div class="col-sm-1 col-md-12 p-4 bg-light mb-4 border-bottom">
		<p class="h3" style="text-align: center;">프로필 관리</p>
	</div>

	<!-- body -->
	<main role="main">
	<div class="container">
		<div class="border-top border-bottom mb-4 w-auto p-3 h-auto">
			<div class="profile_wrap ">
				<div class="left_div border-right w-40 mr-4 p-3 float-left text-center">
					<div class="mb-3 mx-auto d-block" style="width: 200px; height: 200px">
						<img class="w-100 " src="http://localhost:8080/third_prj/Resources/images/no_img.png">
					</div>
					<div class="mb-3">
						<form action="">
							<input type="button" value="이미지 등록하기">
						</form>
					</div>
					<div class="img_subscript">
						사이즈는 가로 200px, 세로 200px에
						<br>
						최적화 되어 있으며 jpg, gif, png파일을 지원합니다.
					</div>
				</div>
	
				<div class="right_div clearfix p-3">
					<form action="">
						<div>
							<label class="mr-4">닉네임</label>
							<input type="text">
						</div>
						<div>
							<label class="align-top mr-3">자기소개</label>
							<textarea rows="11" cols="70"></textarea>
							<br>
						</div>
						<span class="ta_subscript"> 소개글은 300자 이내로 작성해 주세요.</span>
					</form>
					
				</div>
			</div>
		</div>
	
		<div class="mb-5 ">
			<form action="">
				<input type="button" value="등록하기">
			</form>
		</div>
		<!-- CONTAINER DIV -->
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