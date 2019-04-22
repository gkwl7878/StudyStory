<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head >
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
  <title>회원가입</title>
  <style>
   	body {
			background-image: url("http://localhost:8080/third_prj/resources/images/cover.png");
			background-size: 100% 100%;
		}
  	.btn-adjust {
  		height:37px;
  	}
  	.span{
  		color: #FF0000;
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
  	// 입력값 검증처리 후 회원가입 수행
  	$(function() {
  		var idFlag = false; // 중복 확인 후 true로 변경
  		var emailFlag = false; // 중복 확인 후 true로 변경
  		
  		<c:if test="${ signUpFlag }">
  			alert("회원가입에 실패했습니다. 다시 시도해주세요.");
  		</c:if>
  		
  		$("#dupId").click(function() { // 아이디 중복 AJAX 처리
  			
  			var id = $("#id").val();
  		
  			if (id == "") {
  				alert("아이디를 입력해주세요");
  				$("#id").focus();
  				return;
  			}
  			
  			// 한글 아이디 방지
  			var tempId = id.replace(/[ㄱ-힣]/g,"");
  			if (id.length != tempId.length) {
  				alert("아이디는 영문으로만 생성가능합니다.");
  				$("#id").val("");
  				$("#id").focus();
  				return;
  			}
  			
  			if (id.length < 5) {
  				alert("아이디는 5자 이상 10자 이하로 만들어주세요");
  				$("#id").val("");
  				$("#id").focus();
  				return;
  			}
  			
  			$.ajax({
  				 url:"check_dup_id.do",
  				 data:"id="+id,
                 dataType:"json",
                 type:"get",
                 error:function(xhr) {
                       alert("문제발생 "+xhr.status);
                 },
                 success:function(json_obj){
                	 if(json_obj.isDup) {
                		 $("#dupIdMsg").html("<span class='span'>사용중인 아이디입니다</span>");
                		 idFlag = false;
                	 } else {
                		 $("#dupIdMsg").html("<span style='color:#0F68B1'>사용가능한 아이디입니다</span>");
                		 idFlag = true;
                	 }
                 }
  			});
  		});
  		
  		$("#dupEmail").click(function() { // 이메일 중복 AJAX 처리
  			
  			var email1 = $("#email1").val();
  			var email2 = $("#email2").val();
  	  		
  			if (email1 == "") {
  				alert("이메일을 입력해주세요");
  				$("#email1").focus();
  				return;
  			}
  			
  			// 한글 email 방지
  			var tempEmail1 = email1.replace(/[ㄱ-힣~!@#$%^&*()_+={}\[\];:]/g,"");
  			if (email1.length != tempEmail1.length) {
  				alert("이메일은 영문과 숫자로만 입력가능합니다.");
  				$("#email1").val("");
  				$("#email1").focus();
  				return;
  			}
  			
  			if (email2 == "") {
  				alert("이메일을 입력해주세요");
  				$("#email2").focus();
  				return;
  			}
  			
  			// 한글 email 방지
  			var tempEmail2 = email2.replace(/[ㄱ-힣~!@#$%^&*()_+={}\[\];:]/g,"");
  			if (email2.length != tempEmail2.length) {
  				alert("이메일은 영문과 숫자로만 입력가능합니다.");
  				$("#email2").val("");
  				$("#email2").focus();
  				return;
  			}
  			
  			var tempEmail3 = email2.indexOf("."); 
  			if (tempEmail3 == -1) {
  				alert("입력하신 이메일 도메인 확인해주세요");
  				$("#email2").val("");
  				$("#email2").focus();
  				return;
  			} 
  			
  			var email = email1+"@"+email2;
  			
  			$.ajax({
 				 url:"check_dup_email.do",
 				 data:"email="+email,
                dataType:"json",
                type:"get",
                error:function(xhr) {
                      alert("문제발생 "+xhr.status);
                },
                success:function(json_obj){
               	 if(json_obj.isDup) {
               		 $("#dupEmailMsg").html("<br/><span class='span'>사용중인 이메일입니다</span>");
               		 emailFlag = false;
               	 } else {
               		 $("#dupEmailMsg").html("<br/><span style='color:#0F68B1'>사용가능한 이메일입니다</span>");
               		 emailFlag = true;
               	 }
                }
 			});
  		});
  		
  		$("#selectEmail").change(function() {
  			var email2 = $("#selectEmail").val();
  			
  			if (email2 == 'none') {
  				$("#email2").val("");
  				$("#email2").prop("readonly",false);
  			} else {
  				$("#email2").val(email2);
  				$("#email2").prop("readonly",true);
  			}
  		});
  		
  		$("#signUpBtn").click(function() {
  			
  			// 이름 한글 10자까지 입력 가능
  			var name = $("#name").val();
  			
  			if(name == "") {
  				alert("이름을 입력해주세요");
  				$("#name").focus();
  				return;
  			}
  			
  			var id = $("#id").val();
  			
  			if (id == "") {
  				alert("아이디를 입력해주세요");
  				$("#id").focus();
  				return;
  			}
  			
  			// 아이디 중복확인 여부 묻기
  			if (idFlag == false) {
  				alert("아이디 중복확인을 해주세요");
  				$("#id").focus();
  				return;
  			}
  			
  			// 패스워드2개 일치 검증, 최대 20자
  			var pass1 = $("#pass1").val();
  			
  			if (pass1 == "") {
  				alert("비밀번호를 입력해주세요");
  				$("#pass1").focus();
  				return;
  			}
  			
  			var pass2 = $("#pass2").val();
  			
  			if (pass2 == "") {
  				alert("비밀번호 확인을 입력해주세요");
  				$("#pass2").focus();
  				return;
  			}
  			
  			if (pass1 != pass2) {
  				alert("입력하신 비밀번호가 같지 않습니다");
  				$("#pass1").val("");
  				$("#pass2").val("");
  				$("#pass1").focus();
  				return;
  			}
  			
  			if (pass1.length < 6) {
  				alert("비밀번호는 6자보다 적을 수 없습니다");
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
  			
  			var tel2 = $("#tel2").val();
  			var tel3 = $("#tel3").val();
  			
  			if (tel2 == "") {
  				alert("연락처를 입력해주세요");
  				$("#tel2").focus();
  				return;
  			}
  			
  			if (tel3 == "") {
  				alert("연락처를 입력해주세요");
  				$("#tel3").focus();
  				return;
  			}
  			
  			var tempTel2 = tel2.replace(/[ㄱ-힣a-zA-Z~!@#$%^&*()_+={}\[\];:]/g, "");
  			var tempTel3 = tel3.replace(/[ㄱ-힣a-zA-Z~!@#$%^&*()_+={}\[\];:]/g, "");
  			
  			if ((tempTel2 == "" || (tempTel2.length < 3))
  					|| (tempTel3 == "" || (tempTel3.length !=4))) {
  				alert("입력하신 연락처를 확인해주세요");
  				$("#tel2").val("");
  				$("#tel3").val("");
  				$("#tel2").focus("");
  				return;
  			}
  			
  			var tel1 = $("#tel1").val();
  			
  			var tel = tel1+"-"+tel2+"-"+tel3;
  			$("#tel").prop("value",tel);
  			
  			if(!emailFlag) {
  				alert("이메일 중복확인을 해주세요");
  				$("#email1").focus();
  				return;
  			}
  			
  			var email = $("#email1").val()+"@"+$("#email2").val();
  			$("#email").prop("value",email);
  			
  			var question = $("#question").val();
  			
  			if (question == 'none') {
  				alert("인증질문을 선택해주세요");
  				$("#question").focus();
  				return;
  			}
  			
  			var answer = $("#answer").val();
  			
  			if (answer == "") {
  				alert("인증답을 입력해주세요");
  				$("#answer").focus();
  				return;
  			}
  			
  			$("#signUpFrm").submit();
  		}); // 회원가입버튼
  		
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
  	}); // ready
  </script>
</head>
<body>
   <!-- 점보트론 : 전광판 -->
    <section class="text-center mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">회원 가입</h1>
       </div>
    </section>
    <div style="margin-top:40px;">
    </div>
    <!-- 점보트론 : 전광판 -->
  <div class="container ">
  	<form id="signUpFrm" action="sign_up_process.do" method="post">
  		<input type="hidden" id="tel" name="tel"/>
  		<input type="hidden" id="email" name="email"/>
  		 <div class="row" >
  		 <div class="col-lg-2"></div>
        <div class="col-lg-10">
			<span class="span" style="margin-left:13px;">* 모든 항목은 필수입력항목입니다</span>
        	<table class="table" style="width: 700px; margin-top:5px;">
			<tr>
				<td><strong>이름</strong></td>
				<td><input type="text" id="name" maxlength="10" name="name" class="form-control" style="width:200px"></td>
			</tr>
			<tr>
				<td><strong>아이디</strong></td>
				<td>
					<input type="text" maxlength="15" id="id" name="id" class="form-control" style="width:200px;display: inline-block;" maxlength="15" placeholder="아이디는 15자 이하"/>
					<button type="button" id="dupId" class="btn btn-outline-secondary btn-adjust">중복확인</button>
					<span id="dupIdMsg"></span>
				</td>
			</tr>
			<tr >
				<td><strong>비밀번호</strong></td>
				<td><input maxlength="20" type="password" id="pass1" name="pass" class="form-control" style="width:200px"/></td>
			</tr>
			<tr>
				<td><strong>비밀번호 확인</strong></td>
				<td><input maxlength="20" type="password" id="pass2" class="form-control" style="width:200px"/>
				<span class="span" style="font-size:12px;">비밀번호는 영어 대소문자, 숫자 포함 20자 미만이어야 합니다</span></td>
			</tr>
			<tr>
				<td rowspan="3"><strong>주소</strong></td>
				<td>
				<input type="text"  id="zipcode" name="zipcode" readonly="readonly"  class="form-control" style="width:200px; display: inline-block;"/>
				<button type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" id="searchZip" >주소검색</button>
				</td>
			</tr>
			<tr >
				<td><input id="addr1" name="addr1" type="text" readonly="readonly" class="form-control" style="width:500px"/></td>
			</tr>
			<tr >
				<td><input id="addr2" name="addr2" type="text" class="form-control" style="width:500px "/></td>
			</tr>
			<tr>
				<td><strong>연락처</strong></td>
				<td>
				<select id="tel1" class="form-control" style="width: 80px; display: inline-block;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>-
				<input type="text" id="tel2" maxlength="4" class="form-control" style="width:80px; display: inline-block;"/>-
				<input type="text" id="tel3" maxlength="4" class="form-control" style="width:80px; display: inline-block;"/>
				</td>
			</tr>
			<tr >
				<td><strong>이메일</strong></td>
				<td>
				<input type="text" id="email1"  class="form-control" style="width:120px; display: inline-block;"/>&nbsp;@&nbsp;
				<input type="text" id="email2"  class="form-control" style="width:120px; display: inline-block;"/>
				<select id="selectEmail" class="form-control" style="width: 140px; display: inline-block;">
					<option value="none">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="google.com">gmail.com</option>
					<option value="nate.net">nate.net</option>
				</select>
				<button type="button" id="dupEmail" class="btn btn-outline-secondary btn-adjust">중복확인</button>
				<span id="dupEmailMsg"></span>
				</td>
			</tr>
			<tr>
				<td><strong>인증질문</strong></td>
				<td>
				<select id="question" name="question" class="form-control" style="width:500px">
					<option value="none">인증 질문을 선택해주세요.</option>
					<option value="1">초등학교 담임 선생님 성함은?</option>
					<option value="2">가장 좋아하는 캐릭터 이름은?</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><strong>인증 답</strong></td>
				<td>
					<input type="text" maxlength="10" id="answer" name="answer" class="form-control"  style="width:500px"/>
				</td>
			</tr>
		</table>
		<div style="padding-left:260px ; padding-bottom: 30px; width: 700px" >
		<button type="button" class="btn btn-dark btn-lg" onclick="location.href='login.do'">돌아가기</button>
		<button type="button" class="btn btn-primary btn-lg" id="signUpBtn">회원가입</button>
		</div>
        </div>
    	</div>
  </form>
  </div> 

  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>