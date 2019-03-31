<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css"  href="http://localhost:8080/html_prj/common/css/main_v190130.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
		
	})//ready
</script>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>아이디 찾기</title>
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
      <h1>아이디/비밀번호 찾기</h1>
      <div style="color: #808080;padding-top: 10px">
      <h6>*이름과 이메일을 입력하여 아이디를 찾을 수 있습니다.</h6>
      <h6>*아이디를 찾을 수 없을 경우 관리자에 문의바랍니다.</h6>
      </div>
      
    </div>
  </div>

  <div class="container">
  	<form id="Frm">
		<table class="table" style="width: 700px; " >
			<tr>
				<td style="font-size: 17px"><input type="radio" class="radio" checked="checked" name="radio"/> 아이디 찾기</td>
				<td style="font-size: 17px"><input type="radio" class="radio" name="radio"/> 비밀번호 찾기</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text"  name="name" class="form-control" style="width:200px"></td>
			</tr>
			<tr >
				<td>이메일</td>
				<td>
				<input type="text"  name="email1" id="email1" class="form-control" style="width:120px; display: inline-block;"/>@
				<input type="text"  name="email2" id="email2"  class="form-control" style="width:120px; display: inline-block;"/>
				<select class="form-control" style="width: 140px; display: inline-block;">
					<option value="직접입력">직접입력</option>
					<option value="네이버">naver.com</option>
					<option value="한메일">hanmail.net</option>
					<option value="구글">gmail.com</option>
					<option value="네이트">nate.net</option>
				</select>
				</td>
			</tr>
		</table>
		<div style="padding-left:200px ; padding-bottom: 30px">
		<button type="button" class="btn btn-dark btn-lg bigBtn">돌아가기</button>
		<button type="button" class="btn btn-outline-secondary btn-lg bigBtn" >확인</button>
		</div>
  </form>
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