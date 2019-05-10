<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/third_prj/resources/css/font.css"/> 
	<title>회원정보 관리</title>
  <style>
  	.btn-adjust {
  		height:37px;
  	}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		
  		<c:if test="${ failFlag }">
			alert("스터디 정보 변경에 실패했습니다");
		</c:if>
		
		  $("#modifyInfoBtn").click(function() {
			  location.href="modify_info.do";
		  });
		  $("#modifyPassBtn").click(function() {
			  location.href="modify_pass.do";
		  });
		  $("#accountOutBtn").click(function() {
			  location.href="account_out.do";
		  });
  	});
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"/>

  <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
       <div class="container" >
      <h1 class="jumbotron-heading">회원 정보 관리</h1>
    </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->

  <div class="container" style="min-height:620px;">
  	<div class="row">
  	<div class="col-lg-1"></div>
  	<div class="col-lg-11">
  		<div class="row bg-light" style="padding: 30px; margin-bottom: 20px">
  			<div class="col-lg-2" style="border-right: 1px solid #CECECE">
  				<div style="padding-top: 40px"><strong>회원정보 수정</strong></div>
  			</div>
  			<div class="col-lg-10" style="padding: 20px">
  				<div style="margin: 5px">
  					<button id="modifyInfoBtn" type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" >회원정보 수정</button>
  				</div>
  				<div>회원가입 할 때에 입력한 정보를 수정할 수 있는 페이지로 이동합니다.</div>
  			</div>
  		</div>
  		<div class="row bg-light"  style="padding: 30px; margin-bottom: 20px">
  			<div class="col-lg-2" style="border-right: 1px solid #CECECE">
  				<div style="padding-top: 40px"><strong>비밀번호 변경</strong></div>
  			</div>
  			<div class="col-lg-10" style="padding: 20px">
  				<div style="margin: 5px">
  					<button id="modifyPassBtn" type="button" class="btn btn-outline-secondary btn-adjust btn-adjust"  >비밀번호 변경</button>
  				</div>
  				<div>로그인 할 때에 사용하는 계정의 비밀번호를 수정하는 페이지로 이동합니다.</div>
  			</div>
  		</div>
  		<div class="row bg-light" style="padding: 30px">
  			<div class="col-lg-2" style="border-right: 1px solid #CECECE">
  				<div style="padding-top: 40px"><strong>계정 탈퇴</strong></div>
  			</div>
  			<div class="col-lg-10" style="padding: 20px">
  				<div style="margin: 5px">
  					<button id="accountOutBtn" type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" >탈퇴하기</button>
  				</div>
  				<div>회원을 탈퇴하는 페이지로 이동합니다.</div>
  			</div>
  		</div>
  	</div>
  </div> 
</div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="/third_prj/resources/js/popper.min.js" ></script>
  <script src="/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>