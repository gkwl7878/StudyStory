<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인</title>
    <!-- Bootstrap core CSS -->
		<link href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
    <!-- Custom styles for this template -->
    <link href="http://localhost:8080/third_prj/resources/css/signin.css" rel="stylesheet">
    <style type="text/css">
   	body {
		background-image: url("http://localhost:8080/third_prj/resources/images/cover.png");
		background-size: 100%;
	}
	.form-signin {
		max-width:462px;
	}
   </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   <script type="text/javascript">
   		$(function() {
   			
   			<c:if test="${ not empty foundId }">
   				alert("고객님의 아이디는 '${ foundId }' 입니다");
   			</c:if>
   			<c:if test="${ changePassFlag }">
   				alert("새로운 비밀번호로 변경되었습니다");
   			</c:if>
   			
   		});
   </script>
</head>
<body class="text-center">
  <form class="form-signin">
	  <h1><img src="http://localhost:8080/third_prj/resources/images/study_story_logo.png"/></h1>
	  <h5 class="mb-3 font-weight-normal">서비스 사용을 위해선 로그인이 필요합니다</h5>
	  <label class="sr-only">관리자 아이디</label>
	  <input type="text" id="inputEmail" class="form-control" placeholder="아이디" required autofocus>
	  <label class="sr-only">비밀번호</label>
	  <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
	  <button class="btn btn-lg btn-primary btn-block" type="button">로그인</button>
	  <button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='sign_up.do'">회원가입</button>
	  <br/>
	  <label><a href="find_id.do">아이디/비밀번호 찾기</a></label>
	  <p class="mt-5 mb-3 text-muted">&copy; SIST Team Project 2019</p>
  </form>
</body>
</html>
    