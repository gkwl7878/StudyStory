<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 700px;
	min-height: 800px
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">

<title>스터디 삭제</title>
<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<!-- navbar 시작 -->
	<c:import url="http://localhost:8080/third_prj/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="http://localhost:8080/third_prj/admin/layout/sidebar.jsp"></c:import>
	<!-- sidebar 끝 -->

	<div id="wrap">
		<form>
			<br />
			<br />
			<br />
			<br />
			<h1>
				<Strong>스터디 삭제</Strong>
			</h1>
			<hr color="gray">
			<h5>모든 스터디 참여자에게 보여줄 삭제 사유를 입력하세요.</h5>
			<br />
			<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="내용을 입력해주세요.">
			<br />

			<br />
			<br />

			<a class="btn btn-secondary btn-lg" href="#void" role="button">돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-secondary btn-lg" href="#void" role="button">삭제</a>
		</form>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>