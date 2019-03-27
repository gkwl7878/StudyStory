<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
	/* #link{margin-left: 1000px; margin-top: 20px} */
	#loginTitle{text-align: center; st}
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>Bootstrap Template By Young</title>
  <!-- Custom styles for this template -->


  <title>스터디그룹 개설하기</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  $(function () {
  	$("#request").click(function (){
  		if("#exampleFormControlInput1").val()=="" {
  			alert("주제를 선택해주세요.");
  			$("#exampleFormControlInput1").focus();
  			return;
  		}//end if
  		$("#createFrm").submit();
  	});//click
  });//ready
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->

	
	
	<div id="wrap" >
		<form action="create_request.jsp" name="createFrm">
		 <br/>
		<h1><strong>스터디그룹 개설하기</strong></h1>
		<br/>
  <div class="form-group">
 <br/>
    <h3><label for="exampleFormControlInput1">어떤 <span style="font-weight: bold;">주제</span>와 관련된 스터디인가요?</label></h3>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="주제를 선택하세요">
    <br/>
    <button type="button" class="btn btn-info">언어</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-warning">취업</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-danger">취미</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-dark">기타</button>
  </div>
  <br/>
  <br/>
  <br/>
  <div class="form-group">
    <h3><label for="exampleFormControlSelect1">새로운 스터디 그룹의 주<span style="font-weight: bold;">지역</span>은 어디인가요? </label></h3>
    <select class="form-control" id="exampleFormControlSelect1">
      <option>지역을 선택해주세요</option>
      <option>신촌</option>
      <option>홍대</option>
      <option>종각</option>
      <option>건대</option>
      <option>노원</option>
      <option>강남</option>
    </select>
  </div>
<br/>
<br/>
<br/>
  <div class="form-group">
    <h3><label for="exampleFormControlTextarea1">스터디의 <span style="font-weight: bold;">이름</span>을 정해주세요</label></h3>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="스터디의 이름을 입력해주세요">
  </div>
  	<br/>
	<br/>
	<br/>
  <div class="form-group">
    <h3><label for="exampleFormControlTextarea1">스터디 <span style="font-weight: bold;">주제</span>와 이 방의 <span style="font-weight: bold;">규칙</span> 등을 자세히 설명해주세요</label></h3>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="스터디의 상세설명을 입력해주세요"></textarea>
  </div>
	<br/>
	<br/>
	<br/>
  <div class="form-group">
    <h3><label for="exampleFormControlTextarea1">대표썸네일</label></h3>
	<div class="input-group mb-3">
  <div class="custom-file">
    <input type="file" class="custom-file-input" id="inputGroupFile02" >
    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
  </div>
</div>
	<img width="700" src="Resources/images/Image.png" class="img-fluid" alt="Responsive image" id="img">
  </div>
  <br/>
	<br/>
	<br/>
  <a class="btn btn-primary btn-lg btn-block" href="create_request.jsp" role="button" id="request">승인 요청</a>
  <a class="btn btn-secondary btn-lg btn-block" href="create_check.jsp" role="button">취소</a>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>