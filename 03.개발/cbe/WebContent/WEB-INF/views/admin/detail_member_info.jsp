<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 700px;
	min-height: 800px
}
/* #link{margin-left: 1000px; margin-top: 20px} */
#loginTitle {
	text-align: center;
}

.font20bold {
	font-size: 20px;
	font-weight: bold;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">

<title>상세 회원 정보</title>
<!-- Custom styles for this template -->
<link href="/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/third_prj/resources/js/admin_dashboard.js"></script>
<!--daum 주소검색  -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("searchZip").addEventListener("click", execPostcode);
	}
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipcode').value = data.zonecode;
	            document.getElementById("addr1").value = roadAddr;
	        }
	    }).open();
	}
</script>

</head>
<body>
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
				<c:param name="weekUser" value="${param.weekUser}"></c:param>
				<c:param name="weekStudy" value="${param.weekStudy}"></c:param>
				<c:param name="allUser" value="${param.allUser}"></c:param>
				<c:param name="allStudy" value="${param.allStudy}"></c:param>
	</c:import>
	<!-- sidebar 끝 -->

	<div class="container form-group" id="wrap">
		<div class="row">
			<div class="col-12 justify-content-left" style="margin-bottom: 20px; margin-top: 20px;">
				<label style="font-size: 45px;"><strong>상세 회원 정보</strong></label>
			</div>
		</div>

		<div class="row" style="margin-bottom: 10px; margin-top: 20px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>아이디</strong>
			</div>
			<div class="col-9 " style="margin-top: 10px;">
				<label>${param.id }</label>
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold">
				<strong>이름</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" value="${requestScope.name }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>비밀번호</strong>
			</div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="password" class="form-control" >
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>연락처</strong>
			</div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control"  value="${requestScope.tel }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>주소</strong>
			</div>
			<div class="col-5 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control" readonly="readonly" id="zipcode" value="${requestScope.zipcode }">
			</div>
			<div class="font20bold" style="margin-top: 10px;">
				<input type="button" class="btn btn-secondary btn" id="searchZip" value="주소검색" placeholder="스터디명" style="margin-left: 12px;">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;"></div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control" readonly="readonly" id="addr1" value="${requestScope.addr1 }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>상세주소</strong>
			</div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control"  value="${requestScope.addr2 }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>인증질문</strong>
			</div>
			<div class="col-7" style="margin-top: 10px;">
				<label>${requestScope.question }</label>
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>질문답</strong>
			</div>
			<div class="col-7 " style="margin-top: 10px;">
				<label>${requestScope.answer }</label>

			</div>
		</div>

		<div class="row" style="margin-top: 70px;">
			<a class="btn btn-secondary btn" href="user_mng.do?currPage=${param.currPage}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}
									&allStudy=${param.allStudy}" role="button" style="margin-left: 180px;">목록으로</a>
			<a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 10px;">수정</a> 
			<a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 10px;">탈퇴</a>
		</div>
	</div>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>

</body>
</html>