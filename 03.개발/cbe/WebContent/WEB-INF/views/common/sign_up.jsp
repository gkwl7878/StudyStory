<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head >
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  
	<title>회원가입</title>
  <style>
   	body {
		background-image: url("http://localhost:8080/third_prj/resources/images/cover.png");
		background-size: 100%;
	}
  	.btn-adjust {
  		height:37px;
  	}
  	.bigBtn{
  		height: 50px;
  	}
  	.span{
  		color: #FF0000;
  	}
  	.essential{
  		color: #FF0000;
  		padding-left: 585px
  	}
  </style>
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
	             // document.getElementById("jibunAddr").value = data.jibunAddress;
	          }
	      }).open();
	  }
  </script>
  <script type="text/javascript">
  	
  	//////////////////////////////////////// 검증처리부터 할 것 ~0418////////////
  	// 입력값 검증처리 후 회원가입 수행
  	$(function() {
  		$("#dupId").click(function() { // 아이디 중복 AJAX 처리
  			
  		});
  		
  		$("#dupEmail").click(function() { // 이메일 중복 AJAX 처리
  			
  		});
  		
  		$("#signUpBtn").click(function() {
  			
  			
  			// 패스워드2개 일치 검증
  			
  			// 빈값 존재하지 않도록 검증
  			
  			// tel이랑 email은 분리되어 있는데 submit할 때 한개의 값으로 어떻게 전달하는지?
  					
  			
  			
  		});
  	});
  </script>
</head>
<body>
<main role="main">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
   <!-- 점보트론 : 전광판 -->
    <section class="text-center mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">회원 가입</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->

  <div class="container ">
  	<form id="signUpFrm" action="sign_up_process.do" method="post">
  		 <div class="row" >
  		 <div class="col-lg-2"></div>
        <div class="col-lg-10">
        	<table class="table" style="width: 700px; ">
			<tr>
				<td>이름<span class="span">*</span></td>
				<td><input type="text" id="name" name="name" class="form-control" style="width:200px"></td>
			</tr>
			<tr>
				<td>아이디<span class="span">*</span></td>
				<td>
					<input type="text" id="id" name="id" class="form-control" style="width:200px;display: inline-block;" maxlength="15" placeholder="아이디는 15자 이하"/>
					<button type="button" id="dupId" class="btn btn-outline-secondary btn-adjust">중복확인</button>
				</td>
			</tr>
			<tr >
				<td>비밀번호<span class="span">*</span></td>
				<td><input type="password" id="password1" name="password" class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인<span class="span">*</span></td>
				<td><input type="password" id="password2" class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td rowspan="3">주소<span class="span">*</span></td>
				<td>
				<input type="text"  id="zipcode" name="zipcode" readonly="readonly"  class="form-control" style="width:200px; display: inline-block;"/>
				<button type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" id="searchZip" >주소검색</button>
				</td>
			</tr>
			<tr >
				<td><input id="addr1" type="text" name="addr1" readonly="readonly" class="form-control" style="width:500px"/></td>
			</tr>
			<tr >
				<td><input id="addr2" type="text" name="addr2" class="form-control" style="width:500px "/></td>
			</tr>
			<tr>
				<td>연락처<span class="span">*</span></td>
				<td>
				<select class="form-control" style="width: 80px; display: inline-block;" name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				<input type="text" id="tel2" class="form-control" style="width:80px; display: inline-block;"/>-
				<input type="text" id="tel3" class="form-control" style="width:80px; display: inline-block;"/>
				</td>
			</tr>
			<tr >
				<td>이메일<span class="span">*</span></td>
				<td>
				<input type="text" id="email1"  class="form-control" style="width:120px; display: inline-block;"/>@
				<input type="text" id="email2"  class="form-control" style="width:120px; display: inline-block;"/>
				<select class="form-control" style="width: 140px; display: inline-block;">
					<option value="직접입력">직접입력</option>
					<option value="네이버">naver.com</option>
					<option value="한메일">hanmail.net</option>
					<option value="구글">gmail.com</option>
					<option value="네이트">nate.net</option>
				</select>
				<button type="button" id="dupEmail" class="btn btn-outline-secondary btn-adjust">중복확인</button>
				</td>
			</tr>
			<tr>
				<td span="2">인증질문<span class="span">*</span></td>
				<td>
				<select id="question" name="question" class="form-control" style="width:500px">
					<option value="none">인증 질문을 선택해주세요.</option>
					<option value="1">초등학교 담임 선생님 성함은?</option>
					<option value="2">가장 좋아하는 캐릭터 이름은?</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>인증 답<span class="span">*</span></td>
				<td>
					<input type="text" id="answer" name="answer" class="form-control"  style="width:500px"/>
				</td>
			</tr>
			<tr>
				<td class="essential" colspan="2" style="padding-left: 520px">*은 필수항목입니다.</td>
			</tr>
		</table>
		<div style="padding-left:260px ; padding-bottom: 30px; width: 700px" >
		<button type="button" class="btn btn-dark btn-lg bigBtn" onclick="history.back()">돌아가기</button>
		<button type="button" class="btn btn-outline-secondary btn-lg bigBtn" id="signUpBtn">회원가입</button>
		</div>
        </div>
    	</div>
  </form>
  </div> 
</main>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>