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
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  
  <title>계정 탈퇴 </title>
  <!-- 계정 탈퇴시 회원님이 남긴 정보는 유지됩니다. 계속 탈퇴 진행하시겠습니까? -->
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
		 <div style="border:1px solid #D7D7D7; padding:40px"><br/><br/>
		<h1 ><Strong>계정 탈퇴</Strong></h1>
		<hr  color="gray" >
		<h5>계정탈퇴시 회원님이 남긴 정보는 유지됩니다. <br/>계속 탈퇴 진행하시겠습니까?</h5>
		<br/>
		<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
				placeholder="비밀번호 입력.">
		<br/>
	
	<br/>
	<br/>
  
  <a class="btn btn-secondary btn-lg" href="#void" role="button" >돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" role="button">탈퇴하기</a>
  </div>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>