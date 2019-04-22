<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css" />
	<title>아이디 찾기</title>
	<style type="text/css">
	   	body {
			background-image: url("http://localhost:8080/third_prj/resources/images/cover.png");
			background-size: 100%;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#setNewPassBtn").click(function() {
				
				var pass1 = $("#pass1").val();
				
				if (pass1 == "") {
					alert("비밀번호를 입력해주세요");
					$("#pass1").focus();
					return;
				}
				
				var pass2 = $("#pass2").val();
				
				if (pass2 == "") {
					alert("비밀번호확인을 입력해주세요");
					$("#pass2").focus();
					return;
				}

				if (pass1.length < 6) {
	  				alert("비밀번호는 6자보다 적을 수 없습니다");
	  				$("#pass1").val("");
	  				$("#pass2").val("");
	  				$("#pass1").focus();
	  				return;
	  			}
				
				if (pass1 != pass2) {
					alert("입력하신 비밀번호가 같지 않습니다. 다시 입력해주세요");
					$("#pass1").val("");
					$("#pass2").val("");
					$("#pass1").focus();
					return;
				}
				
	  			if(!checkPassPattern(pass1)) {
	  				alert("비밀번호는 영어 대소문자, 숫자를 포함해야 합니다");
	  				$("#pass1").val("");
	  				$("#pass2").val("");
	  				$("#pass1").focus();
	  				return;
	  			}
				
				$("#setNewPassFrm").submit();
			});
			
			function checkPassPattern(pass) {
	  			var flag = false;
	  			
	  			// 비밀번호가 올바른 패턴인지 확인, 영문소,대문자,숫자 혼합
	  			// 소문자 지웠을 때 원래 길이랑 다르면 소문자 존재
	  			// 대문자 지웠을 때 원래 길이랑 다르면 대문자 존재
	  			// 숫자 지웠을 때 원래 길이랑 다르면 숫자 존재
	  			var temp = pass.replace(/[a-z]/g, "");
	  			
	  			if (pass.length == temp.length) { // 소문자 없음
	  				return flag;
	  			}
	  			
	  			temp = pass.replace(/[A-Z]/g, "");
	  			
	  			if (pass.length == temp.length) { // 대문자 없음
	  				return flag;
	  			}
	  			
	  			temp = pass.replace(/[0-9]/g, "");
	  			
	  			if (pass.length == temp.length) { // 대문자 없음
	  				return flag;
	  			}
	  			
	  			flag = true; // 세 조건 모두 만족
	  			return flag;
	  		}
		});
	</script>
</head>
<body>
	<section class="text-center mb-0" style="margin-top: 30px; margin-bottom: 20px;">
		<div class="container">
			<h1 class="jumbotron-heading">비밀번호 재설정</h1>
			<div style="color: #808080; padding-top: 10px">
				<h6>새롭게 사용하실 비밀번호를 입력해주세요.</h6>
			</div>
		</div>
	</section>
	<div style="height: 20px;"></div>

	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-9">
				<form id="setNewPassFrm" action="set_new_pass.do" method="post">
					<input type="hidden" name="id" value="${ id }"/>
					<table class="table" style="width: 500px;">
						<tr>
							<td><strong>새 비밀번호</strong></td>
							<td>
								<input type="password" id="pass1" name="pass" class="form-control" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td><strong>새 비밀번호 확인</strong></td>
							<td>
								<input type="password" id="pass2" class="form-control" style="width: 200px" />
							</td>
						</tr>
					</table>
					<div style="padding-left: 200px; padding-bottom: 30px">
						<button type="button" class="btn btn-dark btn-lg" onclick="location.href='login.do'">취소</button>
						<button type="button" class="btn btn-primary btn-lg" id="setNewPassBtn">변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>