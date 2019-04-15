<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 810px;
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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">

<title>새 공지사항</title>
<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script>


<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>


<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			placeholder : '공지사항을 입력해주세요 :)',
			tabsize : 2,
			height : 300,

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

	<form>
		<div class="container form-group" id="wrap">
			<div class="row">
				<div class="col-12 justify-content-left">
					<label style="font-size: 40px;"><strong>새 공지사항</strong></label> <img alt="" src="resources/images/notice.png" style="width: 100px; height: 100px; margin-left: 15px; margin-bottom: 30px;">
				</div>
			</div>

			<div class="row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<input type="text" class="form-control" placeholder="제목을 입력해주세요(최대 100자)">
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<input type="text" class="form-control" id="summernote">
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 320px;">목록으로</a> <a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 10px;">작성</a>
			</div>
		</div>
	</form>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>

</body>
</html>