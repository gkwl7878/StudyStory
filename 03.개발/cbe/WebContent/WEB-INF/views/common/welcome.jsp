<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <style type="text/css">
		#wrap{ margin:0px auto; margin-top:200px; width: 700px; min-height: 800px; }
   	body {
			background-image: url("http://localhost:8080/third_prj/resources/images/cover.png");
			background-size: 100%;
		}
  </style>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
  <title>회원가입을 환영합니다</title>
  <!-- Custom styles for this template -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<div id="wrap" >
      <form>
		<br/><br/>
		<div style= "width: 800px; padding:40px ; "><br/><br/>
		<img src="http://localhost:8080/third_prj/resources/images/welcome.png"  style="float: left; width:200px; height:200px;">
		<h3 style="color: #333333; margin-left: 280px "><Strong>환영합니다!</Strong></h3><br/>
		<div style="margin-left: 280px">
		<h5><c:out value="${ name }"/>님 회원가입을 완료 했습니다.</h5>
		<span style="text-align: left; font-weight:bold; color: #626262">
		<br/><br/>
		스터디 스토리에서 다양하고 유익한 스터디를 <br/>
		경험하시길 바랍니다.
		</span></div>
		<br/>
		<br/>
		<hr color="#F0F0F0" >
	<br/>
  <a class="btn btn-primary btn-lg" href="login.do" role="button" style="margin-left: 30%">로그인하러 가기</a>
    </div>
    </form>
  </div>
	
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>