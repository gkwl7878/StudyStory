<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>스터디 스토디</title>
    <!-- Bootstrap core CSS -->
		<link href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
    <!-- Custom styles for this template -->
    <link href="http://localhost:8080/third_prj/resources/css/signin.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$("#btn").click(function() {
    			$("#frm").submit();
    		});
    	});
    </script>
  </head>
  <body class="text-center">
  <form id="frm" class="form-signin" action="login.do">
  <h1 class="h1 mb-3 font-weight-normal">스터디 스토리입니다.</h1>
  <h1 class="h4 mb-3 font-weight-normal">간략한 소개글 입니다, 간략한 소개글</h1>
  <button id="btn" class="btn btn-lg btn-primary btn-block" type="submit">로그인 / 회원가입</button>
  <p class="mt-5 mb-3 text-muted">&copy; SIST Team Project 2019</p>
  </form>
	</body>
</html>
    