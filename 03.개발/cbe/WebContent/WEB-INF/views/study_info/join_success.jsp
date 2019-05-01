<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style>
#wrap {
	margin: 100px auto;
	min-height: 800px
}

table {
	width: 100%;
	text-align: center;
}

th, td {
	text-align: center;
}

div {
	margin: 0px auto;
}

.info {
	border: 0;
	padding: 30px;
	text-align: center;
	margin-bottom: 30px;
	margin-top: 30px;
	background-color: #E9ECEF;
	height: 80px;
	width: 100%;
	font: x-large bolder;
}

.form-control-1 {
	width: 100px;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	margin-left: 20px
}
/* form-control 부트스트랩 내용에서 width 100% 를 수정 */
/* .table td, .table th{ vertical-align: middle; } */
</style>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css" />
<title>스터디 참여 신청</title>
<!-- Custom styles for this template -->

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	location.href = "main.do";
</script>

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>