<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css"  href="http://localhost:8080/html_prj/common/css/main_v190130.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
    
</script>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>비밀번호 수정</title>
  <style>
   .bd-placeholder-img {
     font-size: 1.125rem;
     text-anchor: middle;
     -webkit-user-select: none;
     -moz-user-select: none;
     -ms-user-select: none;
     user-select: none;
   }
   .bigBtn{
  		height: 50px;
  	}
   @media (min-width: 768px) {
     .bd-placeholder-img-lg {
       font-size: 3.5rem;
     }
   
  </style>
  <!-- Custom styles for this template -->
  <link href="./Resources/css/jumbotron.css" rel="stylesheet">
	
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>

<main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container" >
      <h1>비밀번호 수정</h1>
    </div>
  </div>

  <div class="container">
  	<form id="Frm">
		<table class="table" style="width: 700px; " >
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password"  name="newPass"  class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password"  name="newPass"  class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password"  name="newPass2"class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
			<td colspan="2">
				<div>주의하세요!</div>
  				<div style="padding-bottom: 20px">아이디와 같은 비밀번호나 주민등록번호,생일,학번,전화번호 등 개인정보와 관련된 숫자나 연속된 숫자, 동일 반복된 숫자 등
  	 			다른 사람이 쉽세 알아 낼 수 있는 비밀번호는 사용하지 않도록 주의하여 주시기 바랍니다.</div>
			</td>
			</tr>
		</table>
		
		<div style="padding-left:200px ; padding-bottom: 30px">
		<button type="button" class="btn btn-dark btn-lg bigBtn" >돌아가기</button>
		<button type="button" class="btn btn-outline-secondary btn-lg bigBtn">비밀번호 수정</button>
		</div>
  </form>
  <div>
  </div>
  </div> 

</main>

	

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
</body>
</html>