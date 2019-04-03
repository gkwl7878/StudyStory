<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 700px;
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

<script type="text/javascript">

</script>

</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->

	<form action="create_request.jsp" name="createFrm">
		<div class="container form-group" id="wrap">
			<div class="row">
				<div class="col-12 justify-content-left"
					style="margin-bottom: 20px;">
					<h2>
						<strong>상세 회원 정보</strong>
					</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-3 font20bold" style="margin-top: 10px;">
					<strong>아이디</strong>
				</div>
				<div class="col-9 font20bold" style="margin-top: 10px;">
					<label>someid</label>
				</div>
			</div>
			<div class="row">
				<div class="col-3 font20bold">
					<strong>이름</strong>
				</div>
				<div class="col-7 font20bold">
					<input type="text" class="form-control" placeholder="리더" style="">
				</div>
			</div>
			<div class="row">
				<div class="col-3 font20bold" style="margin-top: 10px;">
					<strong>비밀번호</strong>
				</div>
				<div class="col-7 font20bold" style="margin-top: 10px;">
					<input type="password" class="form-control" style="">
				</div>
			</div>
			<div class="row">
				<div class="col-3 font20bold" style="margin-top: 10px;">
					<strong>연락처</strong>
				</div>
				<div class="col-7 font20bold" style="margin-top: 10px;">
					<input type="text" class="form-control" placeholder="지역" style="">
				</div>
			</div>
			<div class="row">
				<div class="col-3 font20bold" style="margin-top: 10px;">
					<strong>주소</strong>
				</div>
				<div class="col-5 font20bold" style="margin-top: 10px;">
					<input type="text" class="form-control" placeholder="스터디명">
				</div>
				<div class="font20bold" style="margin-top: 10px;">
					<input type="button" class="btn btn-secondary btn" value="주소검색"
						placeholder="스터디명" style="margin-left: 12px;">
				</div>
			</div>
			<div class="row">
				<div class="col-3 font20bold" style="margin-top: 10px;"></div>
				<div class="col-7 font20bold" style="margin-top: 10px;">
					<input type="text" class="form-control" placeholder="스터디명">
				</div>
			</div>
			<div class="row">
				<div class="col-3 font20bold" style="margin-top: 10px;">
					<strong>상세주소</strong>
				</div>
				<div class="col-7 font20bold" style="margin-top: 10px;">
					<input type="text" class="form-control" placeholder="생성일">
				</div>
			</div>
			<div class="row">
				<div class="col-3 font20bold" style="margin-top: 10px;">
					<strong>인증질문</strong>
				</div>
				<div class="col-7 font20bold" style="margin-top: 10px;">
					<select class="form-control">
						<option>인증질문</option>
						<option>초등학교 담임선생님 성함은?</option>
						<option>가장 좋아하는 캐릭터 이름은?</option>
					</select>
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="#void" role="button"
					style="margin-left: 180px;">목록으로</a> <a
					class="btn btn-secondary btn" href="#void" role="button"
					style="margin-left: 10px;">수정</a> <a class="btn btn-secondary btn"
					href="#void" role="button" style="margin-left: 10px;">탈퇴</a>
			</div>
		</div>
	</form>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>



</body>
</html>