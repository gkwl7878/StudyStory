<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>스터디 스토디</title>
   <!-- Bootstrap core CSS -->
	<link href="/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
   <!-- Custom styles for this template -->
   <link href="/third_prj/resources/css/signin.css" rel="stylesheet">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   <style type="text/css">
   	body {
		background-image: url("/third_prj/resources/images/cover.png");
		background-size: 100% 100%;
	}
	.form-signin {
		max-width:462px;
	}
   </style>
   <script type="text/javascript">
   	$(function() {
   		<c:if test="${ not empty sessionScope.id }">
   			location.replace("study_info/main.do");
   		</c:if>
   		
   		<c:if test="${ deactiveFlag }">
   			alert("탈퇴처리 되었습니다");
   		</c:if>
   		
   		$("#btn").click(function() {
   			$("#frm").submit();
   		});
   	});
   </script>
</head>
<body class="text-center">
  <form id="frm" class="form-signin" action="login.do">
  <h1><img src="/third_prj/resources/images/study_story_logo.png"/></h1>
  <h4 class="mb-3 font-weight-normal">배움의 꿈, 스터디 스토리와 함께하세요</h4>
  <button id="btn" class="btn btn-lg btn-primary btn-block" type="submit">로그인 / 회원가입</button>
  <p class="mt-5 mb-3 text-muted">&copy; SIST Team Project 2019</p>
  </form>
</body>
</html>
    