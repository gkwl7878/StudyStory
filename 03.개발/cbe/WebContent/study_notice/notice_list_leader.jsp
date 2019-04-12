<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
	<title>스터디 공지 리스트</title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
  <style type="text/css">
  	.select-card:hover {
  		background-color:#F1F3F4;
  	}
  </style>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->

	    <main role="main" class="col-lg-10 px-4" style="margin:0px auto;">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" style="margin-top:80px;">
        <h1 class="h2">OOO 스터디</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
        <hr>
      </div>
      <div class="col-lg-12">
      	<a href="#">신청자 보기</a>&nbsp;&nbsp;
      	<a href="#">참여자 보기</a>&nbsp;&nbsp;
      	<a href="#">스터디 수정하기</a>&nbsp;&nbsp;
      	<a href="#">스터디 활동종료</a>&nbsp;&nbsp;
      	<div style="float:right;">
        <select>
        	<option value="opened">모집중</option>
        	<option value="closed">모집종료</option>
        </select>
        <button type="button" class="btn btn-sm btn-outline-secondary">모집상태 변경</button>
        </div>
      </div>
      <hr>
      <div class="container-fluid" style="min-height:500px;">
	  		<div class="row col-sm justify-content-center">
  	  		<a href="#">+새 공지 추가하기</a>
	  		</div>
      	<div class="row col-sm justify-content-center">
	      	<div class="card select-card border-dark mb-3" onclick="location.href='#'">
	      		<div class="card-body">
	      			 <h6 class="card-title"><strong>언제 모일 스터디 공지명입니다.&nbsp;&nbsp;&nbsp;&nbsp;<images src="http://localhost:8080/third_prj/resources/images/setting.png" width="20" height="20"/></strong></h6>
						    <p class="card-text">
						    	<p class="text-left">
						    		<span style="font-size:12px;">2019-03-00</span>
						    		<images src="http://localhost:8080/third_prj/resources/images/no_profile.png" width="50" height="60" style="float:right;"/>
						    	</p>
					    	</p>
	      		</div>
      		</div>
      	</div>
      </div>
    </main>



	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>



</body>
</html>