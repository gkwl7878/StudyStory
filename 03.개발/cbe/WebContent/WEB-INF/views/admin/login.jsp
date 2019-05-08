<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>관리자 로그인</title>

    <!-- Bootstrap core CSS -->
		<link href="/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">

	
		$(function() {

			<c:if test="${ loginSession }">
				location.replace("new_study.do");
			</c:if>
			
			<c:if test="${ param.logoutFlag }">
				alert("로그아웃 되었습니다.");
			</c:if>
			
			if("${param.id}"!=""){
				if("${ requestScope.loginFlag }"!="true"){
					alert("정보가 일치하지 않습니다.");
				}
			}
			
			 $("#inputPassword").keypress(function (e) {
			        if (e.which == 13){
			        	$("#frm").submit();
			        }
			    });
			
			$("#loginBtn").click(function() {
				
				$("#frm").submit();
				
				
			});
		})//ready
	</script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="/third_prj/resources/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
   <form class="form-signin" action="login_proc.do" method="POST" id="frm">
  <img class="mb-4" src="../resources/images/study_story_logo2.png" alt="" width="172" height="72">
  <h1 class="h3 mb-3 font-weight-normal">관리자 로그인</h1>
  <label class="sr-only">관리자 아이디</label>
  <input type="text" id="inputEmail" class="form-control" placeholder="관리자 아이디" name="id" required autofocus>
  <label class="sr-only">비밀번호</label>
  <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" name="pass" required >
  <button class="btn btn-lg btn-primary btn-block" type="button" id="loginBtn">로그인</button>
  <p class="mt-5 mb-3 text-muted">&copy; SIST Team Project 2019</p>
</form>
</body>
</html>
    