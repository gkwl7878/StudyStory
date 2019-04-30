<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style>
#wrap {
	margin: 100px auto;
	min-height: 800px
}

table {
	width: 100%;
	text-align: center;
}

th, td {
	text-align: center;
}

div {
	margin: 0px auto;
}

.info {
	border: 0;
	padding: 30px;
	text-align: center;
	margin-bottom: 30px;
	margin-top: 30px;
	background-color: #E9ECEF;
	height: 80px;
	width: 100%;
	font: x-large bolder;
}

.form-control-1 {
	width: 100px;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	margin-left: 20px
}
/* form-control 부트스트랩 내용에서 width 100% 를 수정 */
/* .table td, .table th{ vertical-align: middle; } */
</style>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css" />
<title>스터디 참여 신청</title>
<!-- Custom styles for this template -->

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#apply_btn").click(function() {
			var introduce = $("#introduce_ta").val();
			var apply = $("#apply_ta").val();

			// 자기소개란이 비어 있다면.
			if (introduce == "") {
				alert("먼저 자기소개를 부탁드립니다.");
				return;
			} // end if

			// 지원동기란이 비어 있다면.
			if (apply == "") {
				alert("먼저 지원한 동기를 작성해주세요.");
				return;
			} // end if

			// 모두 작성을 완료 했을 때.
			if (introduce != "" && apply != "") {
				$("#join_frm").submit();
			}// end if

		}); // click
	}); // ready
</script>

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<div id="wrap">
		<div class="mx-auto" style="width: 920px; height: 1100px; border: 1px solid #D7D7D7; padding: 30px;">
			<!-- <h3><strong>스터디 참여 신청</strong></h3> -->
			<!-- 점보트론 : 전광판 -->
			<section class="text-center bg-white mb-0" style="margin-top: 30px; margin-bottom: 20px;">
				<div class="container">
					<h1 class="jumbotron-heading">스터디 참여 신청</h1>
				</div>
			</section>
			<div style="height: 20px;"></div>
			<!-- 점보트론 : 전광판 -->
			<div></div>
			<hr color="gray">
			<table class="table" style="border: 1px solid #E9ECEF">
				<thead class="thead-light">
					<tr>
						<th scope="col">리더</th>
						<th scope="col">스터디의 이름</th>
					</tr>
				</thead>
				<tbody>
					<tr style="vertical-align: middle;">
						<td scope="row">
							<img src="/third_prj/resources/images/${ leader.leaderImg }">
							<br />${ leader.nick }</td>
						<td style="vertical-align: middle;">${ leader.studyName }</td>
					</tr>
				</tbody>
			</table>

			<form id="join_frm" action="../study_info/join_process.do" method="POST">

				<!-- 보내기 위한 가입신청자의 정보 -->
				<label class="info">${ my_nick }님 자기소개를 부탁드립니다.</label>
				<textarea class="form-control" id="introduce_ta" name="introduce_ta" rows="4" style="resize: none; height: 180px;" placeholder="자기소개는 100자 이하로 입력해주세요."></textarea>

				<label class="info">${ leader.studyName }에 지원한 동기를 작성해주세요.</label>
				<textarea class="form-control" id="apply_ta" name="apply_ta" rows="4" style="resize: none; height: 180px;" placeholder="지원동기는 100자 이하로 입력해주세요."></textarea>


				<!-- 조인폼 vo를 위한 설정  -->
				<input type="hidden" name="joinerId" value="${ sessionScope.id }"> 
				<input type="hidden" name="sNum" value="${ param.sNum }">
				<!-- 조인알람 vo를 위한 설정  -->
				<input type="hidden" name="studyName" value="${ leader.studyName }">


			</form>
		</div>

		<div>
			<input id="back_btn" type="button" class="btn btn-secondary btn-lg" role="button" style="margin-left: 40%; margin-top: 15px;" value="돌아가기" /> <input id="apply_btn" type="button" class="btn btn-secondary btn-lg" role="button" style="margin-left: 10px; margin-top: 15px" value="참여하기" />
		</div>
	</div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

</body>
</html>