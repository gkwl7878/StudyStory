<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css"  href="http://localhost:8080/html_prj/common/css/main_v190130.css">
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
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("roadAddr").value = roadAddr;
               // document.getElementById("jibunAddr").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }
            }
        }).open();
    }
    
</script>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>Bootstrap Template By Young</title>
  <style>
   .bd-placeholder-img {
     font-size: 1.125rem;
     text-anchor: middle;
     -webkit-user-select: none;
     -moz-user-select: none;
     -ms-user-select: none;
     user-select: none;
   }
  	.btn-adjust {
  		height:37px;
  	}
  	.bigBtn{
  		height: 50px
  	}
	
   @media (min-width: 768px) {
     .bd-placeholder-img-lg {
       font-size: 3.5rem;
     }
   
  </style>
  <!-- Custom styles for this template -->
  <link href="./Resources/css/jumbotron.css" rel="stylesheet">
	
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>

<main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container">
      <h1>회원가입</h1>
      <h6>스터디 스토리에 오신 것을 환영합니다.</h6>
    </div>
  </div>

  <div class="container">
  	<form id="Frm">
		<table class="table" style="width: 1200px; " >
			<tr>
				<td>이름<span class="span">*</span></td>
				<td><input type="text"  name="name" class="form-control" style="width:200px"></td>
			</tr>
			<tr>
				<td>아이디<span class="span">*</span></td>
				<td>
					<input type="text"  name="id" readonly="readonly" class="form-control" style="width:200px;display: inline-block;"/>
					<button type="button" class="btn btn-outline-secondary btn-adjust" id="idValid">중복확인</button>
				</td>
			</tr>
			<tr >
				<td>비밀번호<span class="span">*</span></td>
				<td><input type="password"  name="pass1"  class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인<span class="span">*</span></td>
				<td><input type="password"  name="pass2" id="pass2" class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td rowspan="3">주소<span class="span">*</span></td>
				<td>
				<input type="text"   id="roadAddr" readonly="readonly" name="addr1" class="form-control" style="width:200px; display: inline-block;"/>
				<button type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" id="searchZip" >주소검색</button>
				</td>
			</tr>
			<tr >
				<td><input type="text" name="addr2" readonly="readonly" class="form-control" style="width:500px"/></td>
			</tr>
			<tr >
				<td><input type="text" name="addr2"  class="form-control" style="width:500px "/></td>
			</tr>
			<tr>
				<td>연락처<span class="span">*</span></td>
				<td>
				<select class="form-control" style="width: 80px; display: inline-block;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				<input type="text"  name="tel2" id="tel1" class="form-control" style="width:80px; display: inline-block;"/>-
				<input type="text"  name="tel3" id="tel2" class="form-control" style="width:80px; display: inline-block;"/>
				</td>
			</tr>
			<tr >
				<td>이메일<span class="span">*</span></td>
				<td>
				<input type="text"  name="email1" id="email1" class="form-control" style="width:120px; display: inline-block;"/>@
				<input type="text"  name="email2" id="email2"  class="form-control" style="width:120px; display: inline-block;"/>
				<select class="form-control" style="width: 140px; display: inline-block;">
					<option value="직접입력">직접입력</option>
					<option value="네이버">naver.com</option>
					<option value="네이트">nate.com</option>
					<option value="다음">daum.net</option>
				</select>
				<button type="button" class="btn btn-outline-secondary btn-adjust" id="eamilValid">중복확인</button>
				</td>
			</tr>
			<tr>
				<td>인증질문<span class="span">*</span></td>
				<td>
				<select class="form-control" style="width:500px">
					<option value="question1">초등학교 담임 선생님 성함은?</option>
					<option value="question2">가장 좋아하는 캐릭터 이름은?</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>인증 답<span class="span">*</span></td>
				<td>
					<input type="text"  name="answer" id="answer" class="form-control"  style="width:500px"/>
				</td>
			</tr>
		</table>
		<div style="padding-left:250px ; padding-bottom: 30px">
		<button type="button" class="btn btn-dark btn-lg bigBtn" id="eamilValid">돌아가기</button>
		<button type="button" class="btn btn-outline-secondary btn-lg bigBtn" id="eamilValid">회원가입</button>
		</div>
  </form>
  </div> 

</main>

	

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
</body>
</html>