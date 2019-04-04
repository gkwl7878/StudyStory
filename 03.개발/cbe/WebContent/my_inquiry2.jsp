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

.font17bold {
	font-size: 17px;
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

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->

	<form action="create_request.jsp" name="createFrm">
		<div class="container form-group" id="wrap">
			<div class="row">
				<div class="col-12 justify-content-left"
					style="margin-bottom: 20px; margin-top: 20px;">
					<label style="font-size: 40px;"><strong>내 문의보기</strong></label>
					<img alt="" src="Resources/images/qa.png"
				style="width: 130px; height: 100px; margin-left: 0px;">
				</div>
			</div>

			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="font-size: 25px;">제목제목</label>
				</div>
			</div>
			<div class=" row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 80px;" class="font17bold"><strong>분류</strong></label>
					<label style="width: 200px; margin-left: 30px;">회원관련</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 80px;" class="font17bold"><strong>등록일</strong></label>
					<label style="width: 150px; margin-left: 30px;">2019</label> <label
						style="width: 100px; margin-left: 20px;" class="font17bold">답변여부</label>
					<label style="width: 100px; margin-left: 50px;">미완료</label>
				</div>
			</div>

			<div class=" row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<textarea class="form-control" rows="3"
						style="resize: none;; height: 300px;" name="contents" placeholder="내용"  readonly="readonly"></textarea>
				</div>
			</div>
			<div class=" row">
				<div class="col-9"
					style="margin-top: 10px; margin-left: 100px; margin-top: 20px;">
					<textarea class="form-control" rows="3"
						style="resize: none;; height: 300px;" name="contents" placeholder="운영자 답변내용" readonly="readonly"></textarea>
				</div>
			</div>


			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="#void" role="button"
					style="margin-left: 290px;">목록으로</a> <a
					class="btn btn-secondary btn" href="#void" role="button"
					style="margin-left: 10px;">재문의하기</a>
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