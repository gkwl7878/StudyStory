<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:0px auto; width: 1200px; min-height: 800px}
	#link{margin-left: 1000px; margin-top: 20px}
</style>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>벚꽃 소개</title>

  <!-- Font Awesome Icons -->
  <link href="./Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="./Resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="./Resources/css/creative.min.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	축제정보 소개 페이지	
	<div id="wrap">
		<div><img src="http://localhost:8080/jsp_prj/common/images/blossom_img1.jpeg"></div>
		<div id="link">
			<a href="">봄이 왔음을 알리는 벚꽃</a><br/>
			<a href="">벚꽃 나들이 준비물 추천!</a>
		</div>
		<div>
			<span style="font-size: 38px">봄이 왔음을 알리는 벚꽃</span>
		</div>
	
	</div>
	
	
	

	<jsp:include page="layout/footer.jsp"></jsp:include>
	
	<!-- Bootstrap core JavaScript -->
	<script src="./Resources/vendor/jquery/jquery.min.js"></script>
	<script src="./Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Plugin JavaScript -->
	<script src="./Resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="./Resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	
	<!-- Custom scripts for this template -->
	<script src="./Resources/js/creative.min.js"></script>
</body>
</html>