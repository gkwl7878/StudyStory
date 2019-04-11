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
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  
	<title>회원 정보 관리</title>
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
  	.btn-adjust {
  		height:37px;
  	}
  	
  	.leftTd{
  		border-right: 2px solid #E9ECEF
  	}
  	.rightTd{
  		margin: 20px
  	}

   @media (min-width: 768px) {
     .bd-placeholder-img-lg {
       font-size: 3.5rem;
     }
   
  </style>
  <!-- Custom styles for this template -->
  <link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">
	
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>

<main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container" >
      <h1>회원 정보 관리</h1>
    </div>
  </div>

  <div class="container">
  	<div class="row">
  	<div class="col-lg-1"></div>
  	<div class="col-lg-11">
  	<form id="Frm">
  		<div class="row bg-light" style="padding: 30px; margin-bottom: 20px">
  			<div class="col-lg-2" style="border-right: 1px solid #CECECE">
  				<div style="padding-top: 40px">회원정보 수정</div>
  			</div>
  			<div class="col-lg-10" style="padding: 20px">
  				<div style="margin: 5px"><button type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" >회원정보 수정</button></div>
  				<div>회원가입 할 때에 입력한 정보를 수정할 수 있는 페이지로 이동합니다.</div>
  			</div>
  		</div>
  		<div class="row bg-light"  style="padding: 30px; margin-bottom: 20px">
  			<div class="col-lg-2" style="border-right: 1px solid #CECECE">
  				<div style="padding-top: 40px">비밀번호 변경</div>
  			</div>
  			<div class="col-lg-10" style="padding: 20px">
  				<div style="margin: 5px"><button type="button" class="btn btn-outline-secondary btn-adjust btn-adjust"  >비밀번호 변경</button></td></div>
  				<div>로그인 할 때에 사용하는 계정의 비밀번호를 수정하는 페이지로 이동합니다.</div>
  			</div>
  		</div>
  		<div class="row bg-light" style="padding: 30px">
  			<div class="col-lg-2" style="border-right: 1px solid #CECECE">
  				<div style="padding-top: 40px">계정 탈퇴</div>
  			</div>
  			<div class="col-lg-10" style="padding: 20px">
  				<div style="margin: 5px"><button type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" >탈퇴하기</button></div>
  				<div>회원을 탈퇴하는 페이지로 이동합니다.</div>
  			</div>
  		</div>

  </form>
  	</div>
  </div> 
</div>
</main>

	

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>