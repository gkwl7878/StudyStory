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
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">

<title>세부 공지사항</title>
<!-- Custom styles for this template -->
<link href="/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/third_prj/resources/js/admin_dashboard.js"></script>


<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>


<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			placeholder : '공지사항입니다  :)',
			tabsize : 2,
			height : 300,
			lang : 'ko-KR'
		});
	});
</script>

</head>
<body>

	<!-- navbar 시작 -->
	<c:import url="/third_prj/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="/third_prj/admin/layout/sidebar.jsp"></c:import>
	<!-- sidebar 끝 -->

	<form action="create_request.jsp" name="createFrm">
		<div class="container form-group" id="wrap">
			<div class="row">
				<div class="col-12 justify-content-left" style="margin-bottom: 20px;">
					<label style="font-size: 40px;"><strong>세부 공지사항</strong></label> <img alt="" src="resources/images/notice.png" style="width: 100px; height: 100px; margin-left: 15px; margin-bottom: 30px;">
				</div>
			</div>

			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="font-size: 25px;">제목제목</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 50px;">등록일</label> <label style="width: 200px; margin-left: 30px;">2019</label> <label style="width: 50px; margin-left: 20px;">조회수</label> <label style="width: 100px; margin-left: 30px;">0000</label>
				</div>

			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<input type="text" class="form-control" id="summernote">
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 250px;">목록으로</a> <a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 10px;">수정</a> <a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 10px;">삭제</a>
			</div>
		</div>
	</form>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>

</body>
</html>