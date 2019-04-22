<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">

<title>문의 답변하기</title>
<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>


<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			placeholder : '공지사항입니다  :)',
			tabsize : 2,
			height : 200,
			lang : 'ko-KR'
		});
	});
</script>

</head>
<body>
	<!-- navbar 시작 -->
	<c:import url="http://localhost:8080/third_prj/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="http://localhost:8080/third_prj/admin/layout/sidebar.jsp"></c:import>
	<!-- sidebar 끝 -->

	<form action="create_request.jsp" name="createFrm">
		<div class="container form-group" id="wrap">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-9 justify-content-left" style="margin-bottom: 20px; margin-top: 20px;">
					<label style="font-size: 40px;"><strong>문의 답변하기</strong></label> <img alt="" src="resources/images/qa.png" style="width: 130px; height: 100px; margin-left: 0px;">
				</div>
			</div>
			<div class=" row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 50px;" class="font17bold"><strong>번호</strong> : </label> <label style="width: 200px;">1</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>글쓴이</strong> : </label> <label>홍길동</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>분류명</strong> : </label> <label>회원정보 관련 문의</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>등록시간</strong> : </label> <label>2019 </label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>제목</strong> : </label> <label>회원정보 문의합니다. </label>
				</div>
			</div>
			<div class="row">
				<div style="margin-top: 10px; margin-left: 115px;">
					<label class=" font17bold"><strong>문의내용 </strong> : </label>
				</div>
				<div class="col-7" style="margin-top: 10px;">
					<textarea class=" form-control" rows="3" style="resize: none; width: 480px; height: 180px;" name="contents" readonly="readonly"></textarea>
				</div>
			</div>


			<div class=" row">
				<div class="col-9" style="margin-top: 30px; margin-left: 100px;">
					<input type="text" class="form-control" id="summernote">
				</div>
			</div>
			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 400px;">돌아가기</a> <a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 10px;">답변등록</a> <a class="btn btn-secondary btn " href="#void" role="button" style="margin-left: 10px;">삭제</a>
			</div>
		</div>
	</form>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>