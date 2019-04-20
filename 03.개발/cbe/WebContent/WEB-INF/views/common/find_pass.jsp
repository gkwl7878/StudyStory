<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css" />

<title>비밀번호 찾기</title>
<style type="text/css">
   	body {
		background-image: url("http://localhost:8080/third_prj/resources/images/cover.png");
		background-size: 100%;
	}
</style>
<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">

</head>
<body>
	<main role="main">
	<!-- 점보트론 : 전광판 -->
	<section class="text-center mb-0" style="margin-top: 30px; margin-bottom: 20px;">
		<div class="container">
			<h1 class="jumbotron-heading">아이디/비밀번호 찾기</h1>
			<div style="color: #808080; padding-top: 10px">
				<h6>이름과 이메일을 입력하여 아이디를 찾을 수 있습니다.</h6>
				<h6>아이디를 찾을 수 없을 경우 관리자에 문의바랍니다.</h6>
			</div>
		</div>
	</section>
	<div style="height: 20px;"></div>
	<!-- 점보트론 : 전광판 -->

	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
				<form id="Frm">
					<table class="table" style="width: 700px;">
						<tr>
							<td style="font-size: 17px">
								<input type="radio" class="radio" name="radio" onchange="location.href='find_id.do'"/> 아이디 찾기
							</td>
							<td style="font-size: 17px">
								<input type="radio" class="radio" checked="checked" name="radio" /> 비밀번호 찾기
							</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td>
								<input type="text" class="form-control" style="width: 200px; display: inline-block;" />
								<button type="button" class="btn btn-outline-secondary btn-adjust" id="idValid">중복확인</button>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" class="form-control" style="width: 200px">
							</td>
						</tr>
						<tr>
							<td span="2">인증질문</td>
							<td>
								<select class="form-control" style="width: 500px">
									<option value="question">인증 질문을 선택해주세요.</option>
									<option value="question1">초등학교 담임 선생님 성함은?</option>
									<option value="question2">가장 좋아하는 캐릭터 이름은?</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>인증 답</td>
							<td>
								<input type="text" class="form-control" style="width: 500px" />
							</td>
						</tr>
					</table>
					<div style="padding-left: 200px; padding-bottom: 30px; width: 700px;">
						<button type="button" class="btn btn-dark btn-lg bigBtn">돌아가기</button>
						<button type="button" class="btn btn-outline-secondary btn-lg bigBtn">확인</button>
					</div>
				</form>
			</div>
		</div>

	</div>

	</main>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>