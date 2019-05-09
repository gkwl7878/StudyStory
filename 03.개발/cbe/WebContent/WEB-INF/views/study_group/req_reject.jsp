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
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
  <title>신청자 거절</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$("#refuse_btn").click(function(){
  			$("#rejFrm").submit();
  		})
  	})
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  -->

	
	
	<div id="wrap" >
		<form id="rejFrm" action="req_reject_proc.do" method="post">
		 <br/><br/>
		 <div style="border:1px solid #D7D7D7; padding:40px"><br/><br/>
		<h1 ><Strong>이 신청자를 거절하시겠습니까?</Strong></h1>
		<hr  color="gray" >
		<h5>거절 이유를 해당 회원에게 알려주세요.</h5>
		<br/>
		<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
				placeholder="내용을 입력해주세요.">
		<br/>
	
	<br/><%-- req_detail.do?s_num=${param.s_num } --%>
  <a class="btn btn-secondary btn-lg" href="javascript:history.back()" role="button" >돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" id="refuse_btn" role="button">거절하기</a>
  </div>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>