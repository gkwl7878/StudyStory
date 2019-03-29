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
  
  <title>신청자 상세보기 페이지</title>
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
		 <div style= "width: 920px; border:1px solid #D7D7D7; padding:40px ; ">
		<h3><strong>신청자 상세보기</strong></h3>
		<div>
		<img src="Resources/images/no_image.png">
		</div>
		<hr  color="gray" >
		<h5>스터디의 활동 종료 이유를 참여한 회원들에게 알려주세요.</h5>
		<br/>
		<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
				placeholder="내용을 입력해주세요.">
		<br/>
	
	<br/>
  
  <a class="btn btn-secondary btn-lg" href="#void" role="button">목록으로</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" role="button">수락하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" role="button">거절하기</a>
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