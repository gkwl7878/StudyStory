<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  
	<title>아이디/비밀번호 찾기</title>
  <style>
   .bd-placeholder-img {
     font-size: 1.125rem;
     text-anchor: middle;
     -webkit-user-select: none;
     -moz-user-select: none;
     -ms-user-select: none;
     user-select: none;
   }

   @media (min-width: 768px) {
     .bd-placeholder-img-lg {
       font-size: 3.5rem;
     }
   }
  </style>
  
  <!-- Custom styles for this template -->
  <link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">
	
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>


	<!--  -->
	


<main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  

  <div class="container"><!-- 복붙 내용 -->
<br/><br/><br/><br/>
		<div id="contentWrap">
			<div class="memPage findMem">
				<!-- find id -->
				<div class="findIdPw">
					<h2 class="tMar35"><img src="resources/images/find_id_pw.png" alt="아이디 찾기" /></h2>
					<ul class="help">
						<li> 이름과 연락처를 입력하여 아이디를 찾을 수 있습니다.</li>
					</ul>
					<div class="overHidden">
						<div class="ftLt box2 tBdr1">
						<form name="frmIDfind" method="post" onsubmit="return false;">
						<input type="hidden" name="mode" value="id">
							<p class="type">
								<span><input type="radio" name="selIDDiv" id="fidMail" value="E" class="check" checked="checked" onclick="chgSelIdDiv(this)" /> <label for="fidMail">이메일</label></span>
								<span><input type="radio" name="selIDDiv" id="fidPhone" value="P" class="check" onclick="chgSelIdDiv(this)" /> <label for="fidPhone">휴대폰</label></span>
							</p>
							<div id="lyrIDEmail" class="boxCont">
<fieldset>
									<dl class="frmType">
										<dt><label for="fidName2">성명</label></dt>
										<dd><input type="text" name="usernameP" id="fidName2" maxlength="30" class="txtInp focusOn" style="width:228px" title="찾고자 하는 회원님의 성명을 입력해 주세요" /></dd>
									</dl>
									<dl class="frmType">
										<dt><label for="fidPhone2">휴대폰</label></dt>
										<dd>
											<select name="txCell1" id="fidPhone2" class="select focusOn" title="휴대전화 앞자리 선택" style="width:60px">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											-
											<input type="text" name="txCell2" class="txtInp focusOn" maxlength="4" title="휴대전화 가운데자리 입력" style="width:63px" />
											-
											<input type="text" name="txCell3" class="txtInp focusOn" maxlength="4" title="휴대전화 뒷자리 입력" style="width:64px" />
										</dd>
									</dl>
									<p class="btnAlign"><span class="btn btnM1 btnRed idRst" onclick="jsFindIDEP(document.frmIDfind)">확인</span></p>
								</fieldset>
								<p class="btnAlign"><span class="btn btnM1 btnRed idRst" onclick="jsFindIDEP(document.frmIDfind)">확인</span></p>
							</div>
							<div id="lyrIDPhone" class="boxCont" style="width:320px; display:none;">
								<fieldset>
									<legend>휴대폰번호로 아이디찾기</legend>
									<dl class="frmType">
										<dt><label for="fidName2">성명</label></dt>
										<dd><input type="text" name="usernameP" id="fidName2" maxlength="30" class="txtInp focusOn" style="width:228px" title="찾고자 하는 회원님의 성명을 입력해 주세요" /></dd>
									</dl>
									<dl class="frmType">
										<dt><label for="fidPhone2">휴대폰</label></dt>
										<dd>
											<select name="txCell1" id="fidPhone2" class="select focusOn" title="휴대전화 앞자리 선택" style="width:60px">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											-
											<input type="text" name="txCell2" class="txtInp focusOn" maxlength="4" title="휴대전화 가운데자리 입력" style="width:63px" />
											-
											<input type="text" name="txCell3" class="txtInp focusOn" maxlength="4" title="휴대전화 뒷자리 입력" style="width:64px" />
										</dd>
									</dl>
									<p class="btnAlign"><span class="btn btnM1 btnRed idRst" onclick="jsFindIDEP(document.frmIDfind)">확인</span></p>
								</fieldset>
							</div>
						</form>
						</div>
						<div class="ftRt box2 tBdr1">
							<p class="type">아이핀</p>
							<div class="boxCont sId">
								<p>아이핀(I-Pin)으로 가입하신 회원은<br />아이핀 인증으로 아이디를 확인하실 수 있습니다.</p>
								<p class="btnAlign" style="left:0;"><span class="btn btnM1 btnRed" onclick="jsFindIDIP(document.frmIDfind)">확인</span></p>
							</div>
						</div>
					</div>



  </div> <!-- /복붙 여기까지 container -->

</main>

	

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>