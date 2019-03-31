<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/Resources/css/bootstrap.min.css">
	<title>스터디 공지 리스트</title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/Resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/Resources/js/bootstrap.min.js" ></script>
  <style type="text/css">
  	.select-card:hover {
  		background-color:#F1F3F4;
  	}
  	
  	.font12bold {
  		font-size:12px;
  		font-weight:bold;
  	}
  </style>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->

	    <div class="container col-lg-6">
      <div class="row justify-content-left col-lg-6" style="margin-top:80px;">
        <h1 class="h2">OOO 스터디</h1>
      </div>
      <hr>
      <div class="col-lg-6 justify-content-center font12bold">
      	<a href="#">스터디 탈퇴하기</a>
      </div>
      <hr>
      <div class="container" style="min-height:500px;">
      	<div class="row col-sm justify-content-center">
	      	<div class="card select-card border-dark mb-3" onclick="location.href='#'">
	      		<div class="card-body">
	      			 <h6 class="card-title"><strong>언제 모일 스터디 공지명입니다.&nbsp;&nbsp;&nbsp;&nbsp;<img src="http://localhost:8080/third_prj/Resources/img/setting.png" width="20" height="20"/></strong></h6>
						    <p class="card-text">
						    	<p class="text-left">
						    		<span style="font-size:12px;">2019-03-00</span>
						    		<img src="http://localhost:8080/third_prj/Resources/img/no_profile.png" width="50" height="60" style="float:right;"/>
						    	</p>
					    	</p>
	      		</div>
      		</div>
      	</div>
      	<div class="row col-sm justify-content-center">
	      	<div class="card select-card border-dark mb-3" onclick="location.href='#'">
	      		<div class="card-body">
	      			 <h6 class="card-title"><strong>언제 모일 스터디 공지명입니다.&nbsp;&nbsp;&nbsp;&nbsp;<img src="http://localhost:8080/third_prj/Resources/img/setting.png" width="20" height="20"/></strong></h6>
						    <p class="card-text">
						    	<p class="text-left">
						    		<span style="font-size:12px;">2019-03-00</span>
						    		<img src="http://localhost:8080/third_prj/Resources/img/no_profile.png" width="50" height="60" style="float:right;"/>
						    	</p>
					    	</p>
	      		</div>
      		</div>
      	</div>
      	<div class="row col-sm justify-content-center">
	      	<div class="card select-card border-dark mb-3" onclick="location.href='#'">
	      		<div class="card-body">
	      			 <h6 class="card-title"><strong>언제 모일 스터디 공지명입니다.&nbsp;&nbsp;&nbsp;&nbsp;<img src="http://localhost:8080/third_prj/Resources/img/setting.png" width="20" height="20"/></strong></h6>
						    <p class="card-text">
						    	<p class="text-left">
						    		<span style="font-size:12px;">2019-03-00</span>
						    		<img src="http://localhost:8080/third_prj/Resources/img/no_profile.png" width="50" height="60" style="float:right;"/>
						    	</p>
					    	</p>
	      		</div>
      		</div>
      	</div>
      </div>
    </div>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>
</body>
</html>