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
			background-size: 100% 100%;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			
			<c:if test="${ cantFindId }">
				alert("입력하신 이름과 이메일로 등록된 아이디가 없습니다");
			</c:if>
			
			
			$("#find_pass").change(function() {
				location.href="find_pass.do";
			});
			
			$("#selectEmail").change(function() {
				var email = $("#selectEmail").val();
				
				if (email == "none") {
					$("#email2").val("");
					$("#email2").prop("readonly",false);
					return;
				}
				
				$("#email2").val(email);
				$("#email2").prop("readonly",true);
			});
			
			
			$("#findIdBtn").click(function() {
				
				var name = $("#name").val();
				
				if (name == "") {
					alert("이름을 입력해주세요");
					$("#name").focus();
					return;
				}
				
				var email1 = $("#email1").val();
				
				if (email1 == "") {
					alert("이메일을 입력해주세요");
					$("#email1").focus();
					return;
				}
				
				var email2 = $("#email2").val();
				
				if (email2 == "") {
					alert("이메일 도메인을 입력해주세요");
					$("#email2").focus();
					return;
				}
				
				var email = email1+"@"+email2;
				$("#email").prop("value",email);
				
				$("#findIdFrm").submit();
			});
			
		});
	</script>
</head>
<body>
	<!-- 점보트론 : 전광판 -->
	<section class="text-center mb-0" style="margin-top: 30px; margin-bottom: 20px;">
		<div class="container">
			<h1 class="jumbotron-heading">아이디/비밀번호 찾기</h1>
			<div style="color: #808080; padding-top: 10px">
				<h6>이름과 이메일을 입력하여 아이디를 찾을 수 있습니다.</h6>
			</div>
		</div>
	</section>
	<div style="height: 20px;"></div>
	<!-- 점보트론 : 전광판 -->

	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
				<form id="findIdFrm" action="find_id_process.do" method="post">
					<input type="hidden" id="email" name="email"/>
					<table class="table" style="width: 700px;">
						<tr>
							<td style="font-size: 17px">
								<input type="radio" class="radio" checked="checked" name="radio" />&nbsp;<strong>아이디 찾기</strong>
							</td>
							<td style="font-size: 17px">
								<input type="radio" class="radio" name="radio" id="find_pass"/>&nbsp;<strong>비밀번호 찾기</strong>
							</td>
						</tr>
						<tr>
							<td><strong>이름</strong></td>
							<td>
								<input type="text" maxlength="10" id="name" name="name" class="form-control" style="width: 200px">
							</td>
						</tr>
						<tr>
							<td><strong>이메일</strong></td>
							<td>
								<input type="text" id="email1" class="form-control" style="width: 120px; display: inline-block;" />&nbsp;@&nbsp;
								<input type="text" id="email2" class="form-control" style="width: 120px; display: inline-block;" />
								<select id="selectEmail" class="form-control" style="width: 140px; display: inline-block;">
									<option value="none">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.net">nate.net</option>
								</select>
							</td>
						</tr>
					</table>
					<div style="padding-left: 200px; padding-bottom: 30px; width: 700px">
						<button type="button" class="btn btn-dark btn-lg" onclick="location.href='login.do'">돌아가기</button>
						<button type="button" class="btn btn-primary btn-lg" id="findIdBtn">확인</button>
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