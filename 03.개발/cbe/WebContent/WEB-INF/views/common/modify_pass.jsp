<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>  
	<title>비밀번호 수정</title>
  <style type="text/css">
   .bigBtn{
  		height: 50px;
  	}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		
  		<c:if test="${ failFlag }">
  			alert("비밀번호 변경에 실패했습니다");
  		</c:if>
  		
  		$("#modifyBtn").click(function() {
  			
  			var prevPass = $("#prevPass").val();
  			
  			if (prevPass == "") {
  				alert("비밀번호를 입력해주세요");
  				$("#prevPass").focus();
  				return;
  			}
  			
  			var newPass1 = $("#newPass1").val();
  			
  			if (newPass1 == "") {
  				alert("새 비밀번호를 입력해주세요");
  				$("#newPass1").focus();
  				return;
  			}
  			
  			var newPass2 = $("#newPass2").val();
  			
  			if (newPass2 == "") {
  				alert("새 비밀번호 확인을 입력해주세요");
  				$("#newPass2").focus();
  				return;
  			}
  			
  			if (newPass1 != newPass2) {
  				alert("입력하신 두 비밀번호가 다릅니다. 다시 입력해주세요");
  				$("#newPass1").val("");
  				$("#newPass2").val("");
  				$("#newPass1").focus();
  				return;
  			}
  			
  			if (checkPassPattern(newPass1)) {
  				$("#pass").prop("value",prevPass);
  				$("#newPass").prop("value",newPass1);
  				$("#modifyPassFrm").submit();
  			} else {
				alert("비밀번호는 6자 이상 20자 이하, 영어 대소문자와 숫자로 구성되어야 합니다");  				
  				$("#newPass1").val("");
  				$("#newPass2").val("");
  				$("#newPass1").focus();
  			}
  		});
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
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"/>

  <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
    <div class="container" >
      <h1 class="jumbotron-heading">비밀번호 수정</h1>
    </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->

  <div class="container">
  	<div class="row text-center justify-content-center">
  	<form id="modifyPassFrm" action="modify_pass_process.do" method="post">
  		<input type="hidden" id="pass" name="pass"/>
  		<input type="hidden" id="newPass" name="newPass"/>
		<table class="table" style="width: 600px;">
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" id="prevPass" class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" id="newPass1" class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="newPass2" class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
			<td colspan="2">
				<div><strong>주의하세요!</strong></div>
  				<div style="padding-bottom: 20px">
  				아이디와 같은 비밀번호나 주민등록번호,생일,학번,전화번호처럼<br/>
  	 			다른 사람이 쉽세 알아 낼 수 있는 비밀번호는 사용하지 않도록<br/>
  	 			주의하여 주시기 바랍니다.</div>
			</td>
			</tr>
		</table>
		
		<div style="padding-bottom: 30px; width: 600px">
		<button type="button" class="btn btn-dark btn-lg bigBtn" onclick="location.href='user_modify_menu.do'">돌아가기</button>
		<button type="button" class="btn btn-outline-secondary btn-lg bigBtn" id="modifyBtn">비밀번호 수정</button>
		</div>
  </form>
  	</div>
  	</div>
  <div>
  </div>
  </div> 

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://211.63.89.144/resources/js/popper.min.js" ></script>
  <script src="http://211.63.89.144/resources/js/bootstrap.min.js" ></script>
</body>
</html>