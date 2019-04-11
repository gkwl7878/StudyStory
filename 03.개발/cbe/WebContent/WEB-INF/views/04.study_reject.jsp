<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>스터디 생성 거절</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->



	<div id="wrap">
		<form>
		 <br/><br/><br/><br/>
		<h1 ><Strong>새 스터디 생성 거절</Strong></h1>
		<hr  color="gray" >
		<h5>스터디 생성 요청자에게 보여줄 메세지를 입력하세요.</h5>
		<br/>
		<!--input typt text  -->
		<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
				placeholder="내용을 입력해주세요.">
		<!-- <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" style="resize: none" placeholder="내용을 입력해주세요.";></textarea> -->
		<br/>
	
	<br/>
	<br/>
  
  <a class="btn btn-secondary btn-lg" href="#void" role="button" >돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" role="button">보내기</a>
</form>
	</div>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>



</body>
</html>