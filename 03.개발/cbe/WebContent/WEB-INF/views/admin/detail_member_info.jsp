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
<link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">

<title>상세 회원 정보</title>
<!-- Custom styles for this template -->
<link href="http://211.63.89.144/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://211.63.89.144/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://211.63.89.144/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://211.63.89.144/resources/js/feather.min.js"></script>
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
	
	$(function() {
		
		<c:if test="${ !loginSession }">
			location.replace("login.do");
		</c:if>
		
		<c:if test="${modifyFlag }">
			alert("${param.id}님의 정보가 수정 되었습니다");
		</c:if>
		
		$("#modifyBtn").click(function() {
			
			// 이름 한글 10자까지 입력 가능
  			var name = $("#name").val();
  			
  			if(name == "") {
  				alert("이름을 입력해주세요");
  				$("#name").focus();
  				return;
  			}
  			
  			var pass= $("#pass").val();
  			if(pass!=""){
  				if (pass.length < 6) {
  	  				alert("비밀번호는 6자보다 적을 수 없습니다");
  	  				$("#pass").val("");
  	  				$("#pass").focus();
  	  				return;
  	  			}
  	  			
  	  			if(!checkPassPattern(pass)) {
  	  				alert("비밀번호는 영어 대소문자, 숫자를 포함해야 합니다");
  	  				$("#pass").val("");
  	  				$("#pass").focus();
  	  				return;
  	  			}
  			}
  			
  			
  			var zipcode = $("#zipcode").val();
  			var addr1 = $("#addr1").val();
  			
  			if (zipcode == "" || addr1 == "") {
  				alert("주소검색을 이용하여 주소를 입력해주세요");
  				return;
  			}
  			
  			var addr2 = $("#addr2").val();
  			
  			if (addr2 == "") {
  				alert("상세 주소를 입력해주세요");
  				$("#addr2").focus();
  				return;
  			}
  			
  			var tel=$("#tel").val();
  			var telArray=$("#tel").val().split("-");
  			
  			var tel1= telArray[0];
  			var tel2 = telArray[1];
  			var tel3 = telArray[2];
  			
  			if (tel == "") {
  				alert("연락처를 입력해주세요");
  				$("#tel").focus();
  				return;
  			}
  			
  			if(telArray.length<3){
  				alert("연락처 형식이 잘못되었습니다.");
  				$("#tel").focus();
  				return;
  			}
  			
  			var tempTel2 = tel2.replace(/[ㄱ-힣a-zA-Z~!@#$%^&*()_+={}\[\];:]/g, "");
  			var tempTel3 = tel3.replace(/[ㄱ-힣a-zA-Z~!@#$%^&*()_+={}\[\];:]/g, "");
  			
  			if ((tempTel2 == "" || (tempTel2.length < 3))
  					|| (tempTel3 == "" || (tempTel3.length !=4))) {
  				alert("입력하신 연락처를 확인해주세요");
  				$("#tel").focus();
  				return;
  			}
  			
			$("#userDetailFrm").submit();
			$("#pass").val("");
		})
		
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
		
		
	});//ready
	
	function delete_confirm(){
		return confirm("정말 탈퇴 처리하시겠습니까?");
	}
	
</script>

</head>
<body>
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
	</c:import>
	<!-- sidebar 끝 -->
	<form id="userDetailFrm" action="user_modify.do" method="post">
	<input type="hidden" value="${param.currPage}" name="currPage">
	<input type="hidden" value="${param.searchCondition}" name="searchCondition">
	<input type="hidden" value="${param.searchWord}" name="searchWord">
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
				<input type="hidden" name="id" value="${param.id }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold">
				<strong>이름</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" name="name" id="name" value="${requestScope.name }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>비밀번호</strong>
			</div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="password" class="form-control" name="pass"  id="pass">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>연락처</strong>
			</div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control" name="tel" id="tel" value="${requestScope.tel }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>주소</strong>
			</div>
			<div class="col-5 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control" readonly="readonly" id="zipcode" name="zipcode" value="${requestScope.zipcode }">
			</div>
			<div class="font20bold" style="margin-top: 10px;">
				<input type="button" class="btn btn-secondary btn" id="searchZip" value="주소검색" placeholder="스터디명" style="margin-left: 12px;">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;"></div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control" readonly="readonly" id="addr1" name="addr1" value="${requestScope.addr1 }">
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3 font20bold" style="margin-top: 10px;">
				<strong>상세주소</strong>
			</div>
			<div class="col-7 font20bold" style="margin-top: 10px;">
				<input type="text" class="form-control" name="addr2" id="addr2" value="${requestScope.addr2 }">
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
			<a class="btn btn-secondary btn" href="user_mng.do?currPage=${param.currPage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}" role="button" style="margin-left: 180px;">목록으로</a>
			<input type="button" class="btn btn-secondary btn" value="수정" id="modifyBtn" style="margin-left: 10px;" />
			 <a class="btn btn-secondary btn"  onclick="return delete_confirm();" href="user_delete.do?id=${param.id }&currPage=1" role="button" style="margin-left: 10px;">탈퇴</a>
		</div>
	</div>
	</form>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://211.63.89.144/resources/js/popper.min.js"></script>
	<script src="http://211.63.89.144/resources/js/bootstrap.min.js"></script>

</body>
</html>