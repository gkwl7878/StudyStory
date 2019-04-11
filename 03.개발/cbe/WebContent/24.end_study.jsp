<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
  <title>스터디 활동 종료</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->

	
	
	<div id="wrap" >
		<form>
		 <br/><br/>
		 <div style= "width: 920px; border:1px solid #D7D7D7; padding:40px ; "><br/><br/>
		<h1 ><Strong>정말 이 스터디의 활동을 종료하시겠습니까?</Strong></h1>
		<hr  color="gray" >
		<h5>스터디의 활동 종료 이유를 참여한 회원들에게 알려주세요.</h5>
		<br/>
		<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
				placeholder="내용을 입력해주세요.">
		<br/>
	
	<br/>
  <a class="btn btn-secondary btn-lg" href="#void" role="button" >돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" role="button">스터디 활동종료</a>
  </div>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>