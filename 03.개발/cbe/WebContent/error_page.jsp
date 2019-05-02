<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:0px auto; margin-top:300px; width: 700px; min-height: 800px; text-align: center;}
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/font.css"/>
  <title>페이지 찾을 수 없음</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  -->

	
	
	<div id="wrap" >
		<form>
		 <br/><br/>
		 <div style= "width: 800px; padding:40px ; "><br/><br/>
		<h3 style="color: #F77027"><Strong>페이지를 찾을 수 없습니다.</Strong></h3><br/>
		<img src="/resources/images/error.JPG"  style="float: left;">
		<div style="margin-left: 200px">
		<span style="text-align: left; font-weight:bold; color: #626262">
		<h6>죄송합니다. <br/> 페이지 주소가 잘못 입력되었거나, 변경 혹은 삭제되어<br/>
		요청하신 페이지를 찾을 수 없습니다.<br/>입력하신 주소가 정확한지 다시 한번 확인해주세요.</h6>
		</span></div>
		<br/>
		<br/>
	
		<hr  color="#F0F0F0" >
	<br/>
  <a class="btn btn-secondary btn-lg" href="#void" role="button" >이전 페이지로</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" role="button">메인으로</a>
  </div>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="/resources/js/popper.min.js" ></script>
  <script src="/resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>