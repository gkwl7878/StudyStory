<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 800px;
	min-height: 800px
}
/* #link{margin-left: 1000px; margin-top: 20px} */
#loginTitle {
	text-align: center;
	st
}

.font20bold {
	font-size: 20px;
	font-weight: bold;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">

<title>Bootstrap Template By Young</title>
<!-- Custom styles for this template -->

<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>

</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->


	<div class="container form-group" id="wrap">
		<div class="row">
			<div class="col-12 justify-content-left"
				style="margin-bottom: 20px; ">
				<strong style="font-size: 45px;">새 스터디 상세 정보</strong><img
					src="Resources/images/create.png"
					style="width: 150px; height: 120px; margin-left: 30px;">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>번호</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly">
			</div>
		</div>

		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>리더</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>주제</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>지역</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>스터디명</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>생성일</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly">
			</div>
		</div>

		<div class=" row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>스터디
						썸네일</strong></label>&nbsp;
			</div>
			<div class="col-7 font20bold">
				<img width="440" height="300" id="img"
					src="Resources/images/Image.png" border="0" title='찾아보기' alt='찾아보기'>
			</div>
		</div>

		<div class=" row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>상세설명</strong>
			</div>
			<div class="col-7 font20bold">
				<textarea class="form-control" rows="3"
					style="resize: none; width: 440px; height: 300px; margin-top: 20px;"
					name="contents" readonly="readonly"></textarea>
			</div>
		</div>

		<div class="row" style="margin-top: 30px;">
			<a class="btn btn-secondary btn" href="#void" role="button"
				style="margin-left: 180px;">목록으로</a> <a
				class="btn btn-secondary btn" href="#void" role="button"
				style="margin-left: 10px;">수락</a> <a class="btn btn-secondary btn"
				href="#void" role="button" style="margin-left: 10px;">거절</a>
		</div>
	</div>





	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>



</body>
</html>