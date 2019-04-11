<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
	.info{border: 1px solid #BFC8D0 ; padding: 50px ;text-align: center; margin-bottom: 50px; margin-top: 30px}
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
  <title>신청자 상세보기 페이지</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->

	
	
	<div id="wrap" >
		<form>
		 <div style= "width: 920px; border:1px solid #D7D7D7; padding:40px ; margin-bottom: 20px ">
		<h3><strong>신청자 상세보기</strong></h3>
		<img src="http://localhost:8080/third_prj/Resources/images/no_pic.png" style="float: inherit; margin-top: 20px">
		<span style="vertical-align: bottom;"><strong>닉네임 : 신규에용</strong></span>
		<hr  color="gray" >
		<!-- <h5>새로운 신청자를 확인 해주세요.</h5> -->
		<!-- <span style="font-weight: bold;"><h3>자기소개</h3></span> -->
		
		<div class="row" style="border:1px solid #BFC8D0 ;padding-top: 20px ;padding-bottom: 20px" ;>
  <div class="col-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">자기소개</a>
      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">지원동기</a>
    </div>
  </div>
  <div class="col-10">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">안녕하세요. 저는 이 모임에 꼭 가입하고싶습니다. 서울 역삼동에 거주하는 김신규입니다. 잘부탁드려요안녕하세요. 저는 이 모임에 꼭 가입하고싶습니다. 서울 역삼동에 거주하는 김신규입니다. 잘부탁드려요안녕하세요. 저는 이 모임에 꼭 가입하고싶습니다. 서울 역삼동에 거주하는 김신규입니다. 잘부탁드려요안녕하세요. 저는 이 모임에 꼭 가입하고싶습니다. 서울 역삼동에 거주하는 김신규입니다. 잘부탁드려요안녕하세요. 저는 이 모임에 꼭 가입하고싶습니다. 서울 역삼동에 거주하는 김신규입니다. 잘부탁드려요안녕하세요. 저는 이 모임에 꼭 가입하고싶습니다. 서울 역삼동에 거주하는 김신규입니다. 잘부탁드려요안녕하세요. 저는 이 모임에 꼭 가입하고싶습니다. 서울 역삼동에 거주하는 김신규입니다. 잘부탁드려요</div>
      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">영어 회화 잘하고싶어요. 회화를 배워서 해외여행도 자유롭게 다니는 자유로운 영혼이 되고싶습니다.</div>
    </div>
  </div>
</div>
		
  
  </div>
  <a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 250px; ">목록으로</a>
  <a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 10px;">수락하기</a>
  <a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 10px;">거절하기</a>
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