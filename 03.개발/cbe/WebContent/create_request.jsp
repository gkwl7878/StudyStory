<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
	/* #link{margin-left: 1000px; margin-top: 20px} */
	#loginTitle{text-align: center; st}
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>Bootstrap Template By Young</title>
  <!-- Custom styles for this template -->


  <title>스터디그룹 개설하기</title>
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
		 <br/>
		<h1>요청이 <strong>완료</strong>되었습니다.</h1>
		<br/>
		<br/>
		
		<h3><strong>마이페이지</strong>에서 확인해주세요</h3>
		<br/>
		<p>
	모든 스터디 이벤트는 <a id="guidelinesLink" href="https://meetup.zendesk.com/hc/sections/360000683791-Community-Guidelines" class="link" target="_blank">커뮤니티 가이드라인</a>에 따른 검토를 거칩니다.
</p>
	<br/>
	<br/>
  <a class="btn btn-primary btn-lg" href="#void" role="button" >홈으로 가기</a>
  <a class="btn btn-secondary btn-lg" href="#void" role="button">취소</a>
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