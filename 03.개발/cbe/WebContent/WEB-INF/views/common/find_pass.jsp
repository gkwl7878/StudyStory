<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css" />
<title>비밀번호 찾기</title>
<style type="text/css">
   	body {
		background-image: url("http://localhost:8080/third_prj/resources/images/cover.png");
		background-size: 100% 100%;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		<c:if test="${ cantFindAnswer }">
			alert("입력하신 정보와 맞는 가입정보가 없습니다");
		</c:if>
		
		
		$("#findPassBtn").click(function() {
			
			var id = $("#id").val();
			
			if (id == "") {
				alert("아이디를 입력해주세요");			
				$("#id").focus();
				return;
			}
			
			var name = $("#name").val();
			
			if (name == "") {
				alert("이름을 입력해주세요");			
				$("#name").focus();
				return;
			}
			
			var question = $("#question").val();
			
			if (question == "none") {
				alert("질문을 선택해주세요");			
				$("#question").focus();
				return;
			}
			
			var answer = $("#answer").val();
			
			if (answer == "") {
				alert("인증답을 선택해주세요");			
				$("#answer").focus();
				return;
			}
			
			$("#findPassFrm").submit();
		});
	}); // ready
</script>
</head>
<body>
	<!-- 점보트론 : 전광판 -->
	<section class="text-center mb-0" style="margin-top: 30px; margin-bottom: 20px;">
		<div class="container">
			<h1 class="jumbotron-heading">아이디/비밀번호 찾기</h1>
			<div style="color: #808080; padding-top: 10px">
				<h6>아이디와 이름, 인증질문과 답을 입력하여 검증 후</h6>
				<h6>새로운 비밀번호를 설정할 수 있습니다.</h6>
			</div>
		</div>
	</section>
	<div style="height: 20px;"></div>
	<!-- 점보트론 : 전광판 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
				<form id="findPassFrm" action="find_pass_process.do" method="post">
					<table class="table" style="width: 700px;">
						<tr>
							<td style="font-size: 17px">
								<input type="radio" class="radio" name="radio" onchange="location.href='find_id.do'"/>&nbsp;<strong>아이디 찾기</strong>
							</td>
							<td style="font-size: 17px">
								<input type="radio" class="radio" checked="checked" name="radio" />&nbsp;<strong>비밀번호 찾기</strong>
							</td>
						</tr>
						<tr>
							<td><strong>아이디</strong></td>
							<td>
								<input type="text" id="id" name="id" maxlength="15" class="form-control" style="width: 200px; display: inline-block;" />
							</td>
						</tr>
						<tr>
							<td><strong>이름</strong></td>
							<td>
								<input type="text" id="name" name="name" maxlength="10" class="form-control" style="width: 200px">
							</td>
						</tr>
						<tr>
							<td><strong>인증질문</strong></td>
							<td>
								<select id="question" name="question" class="form-control" style="width: 500px">
									<option value="none">인증 질문을 선택해주세요.</option>
									<option value="1">초등학교 담임 선생님 성함은?</option>
									<option value="2">가장 좋아하는 캐릭터 이름은?</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><strong>인증 답</strong></td>
							<td>
								<input type="text" id="answer" name="answer" maxlength="10" class="form-control" style="width: 500px"/>
							</td>
						</tr>
					</table>
					<div style="padding-left: 200px; padding-bottom: 30px; width: 700px;">
						<button type="button" class="btn btn-dark btn-lg" onclick="location.href='login.do'">돌아가기</button>
						<button type="button" class="btn btn-primary btn-lg" id="findPassBtn">확인</button>
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