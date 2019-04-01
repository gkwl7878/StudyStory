<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css"  href="http://localhost:8080/html_prj/common/css/main_v190130.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
	
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	
		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
	
			 $("#floatMenu").css('top', newPosition);
	
		/* 	$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500); */
	
		}).scroll();
	});//ready
</script>	
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>스터디 상세 정보</title>
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
    
    .title{width:500px; margin:0px auto; text-align: center;}
    .img{height:450px ; margin: 0px auto; background-color:#CCCCCC }
    .likeLabel{text-align: right;}
    
    #floatMenu {
	position: absolute;
	width: 200px;
	height: 200px;
	left: 50px;
	top: 250px;
	background-color: #606060;
	color: #fff;
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
      <h1>스터디 상세 정보</h1>
    </div>
  </div>
  <div class="container">
	  <div class="row">
	  <div class="col-lg-1"></div>
	  <div class="col-lg-11">
		<div class="row justify-content-center" style="padding: 100px;"><h2>영어 같이 해봐요! 노하우 만땅 리더의 특급모임</h2></div> 
	  	<div class="row">
	  		<div class="col-8"></div>
	  		<div class="col-4" style="font-size:17px; font-weight:bold;">현재 00명이 이 모임을 좋아합니다.</div>
	  	</div>
	  	<div class="img"></div>
	  	<div class="detailInfo">
	  		<table>
	  		<tr>
	  			<td rowspan="2">상세 정보</td>
	  			<td>지역: </td>
	  			<td>인원: </td>
	  		</tr>
	  		<tr>
	  			<td>종류: </td>
	  			<td>등록일: </td>
	  		<tr>
	  		</table>
	  </div>  
	  </div> 
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