<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>  
	<title>회원정보 수정</title>
  <style>
   .bigBtn{
  		height: 50px;
  	}
   .btn-adjust {
  		height:37px;
  	}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		
  		<c:if test="${ failFlag }">
			alert("변경에 실패했습니다");
		</c:if>
  		
  		$("#modifyBtn").click(function() {
  			
  			// 이름 한글 10자까지 입력 가능
  			var name = $("#name").val();
  			
  			if(name == "") {
  				alert("이름을 입력해주세요");
  				$("#name").focus();
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
  			
  			var email = $("#email1").val()+"@"+$("#email2").val();
  			$("#email").prop("value",email);
  			
  			var pass = $("#pass").val();
  			
  			if (pass == "") {
  				alert("비밀번호를 입력해주세요");
  				$("#pass").focus();
  				return;
  			}
  			
  			$("#modifyFrm").submit();
  		}); // modifyBtn
  	});
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"/>

  <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">회원정보 수정</h1>
	      <div style="color: #808080;padding-top: 10px">
	      <h6>고객님의 주소와 연락처등 개인정보를 수정하실수 있습니다.</h6>
	      </div>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->

  <div class="container">
  <div class="row">
  <div class="col-lg-2"></div>
  <div class="col-lg-10">
  <form id="modifyFrm" action="modify_info_process.do" method="post">
  	<input type="hidden" name="id" value="${ id }"/>
  	<input type="hidden" id="tel" name="tel"/>
  	<input type="hidden" id="email" name="email"/>
		<table class="table" style="width: 700px;" >
			<tr>
				<td>이름</td>
				<td><input id="name" name="name" type="text"  maxlength="10" class="form-control" style="width:200px" value="${ prevInfo.name }"></td>
			</tr>
			<tr>
				<td rowspan="3">주소</td>
				<td>
				<input id="zipcode" name="zipcode" type="text"  value="${ prevInfo.zipcode }" readonly="readonly" class="form-control" style="width:200px; display: inline-block;"/>
				<button type="button" class="btn btn-outline-secondary btn-adjust btn-adjust" id="searchZip" >주소검색</button>
				</td>
			</tr>
			<tr >
				<td><input id="addr1" name="addr1" type="text" value="${ prevInfo.addr1 }" readonly="readonly" class="form-control" style="width:500px"/></td>
			</tr>
			<tr >
				<td><input id="addr2" name="addr2" type="text" value="${ prevInfo.addr2 }" class="form-control" style="width:500px "/></td>
			</tr>
			
			<tr>
				<td>연락처</td>
				<td>
				<select id="tel1" class="form-control" style="width: 80px; display: inline-block;">
					<option value="010" ${ tel1 eq '010' ? 'selected="selected"' : '' }>010</option>
					<option value="011" ${ tel1 eq '011' ? 'selected="selected"' : '' }>011</option>
					<option value="016" ${ tel1 eq '016' ? 'selected="selected"' : '' }>016</option>
					<option value="017" ${ tel1 eq '017' ? 'selected="selected"' : '' }>017</option>
					<option value="018" ${ tel1 eq '018' ? 'selected="selected"' : '' }>018</option>
					<option value="019" ${ tel1 eq '019' ? 'selected="selected"' : '' }>019</option>
				</select>
				<input id="tel2" maxlength="4" type="text" value="${ tel2 }" class="form-control" style="width:80px; display: inline-block;"/>-
				<input id="tel3" maxlength="4" type="text" value="${ tel3 }" class="form-control" style="width:80px; display: inline-block;"/>
				</td>
			</tr>
			
			<tr >
				<td>이메일</td>
				<td>
				<input type="text" readonly="readonly" id="email1" value="${ email1 }" class="form-control" style="width:120px; display: inline-block;"/>&nbsp;@&nbsp;
				<input type="text" readonly="readonly" id="email2" value="${ email2 }" class="form-control" style="width:120px; display: inline-block;"/>
				</td>
			</tr>
			<tr >
				<td>비밀번호</td>
				<td>
				<input id="pass" name="pass" type="password" maxlength="20" class="form-control" style="width:200px"/>
				<span style="color:#4691C3 ">정보를 수정하시려면 기존 비밀번호를 입력하시기 바랍니다.</span>
				</td>
			</tr>
		</table>
		<div style="padding-left:180px ; padding-bottom: 30px; width: 700px">
		<button type="button" class="btn btn-dark btn-lg bigBtn" onclick="location.href='modify_info.do'">돌아가기</button>
		<button type="button" class="btn btn-outline-secondary btn-lg bigBtn" id="modifyBtn">수정</button>
		</div>
  </form>
  </div>
  </div>
  </div> 

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>