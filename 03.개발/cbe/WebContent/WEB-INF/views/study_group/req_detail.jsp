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
  <link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
  
  <title>신청자 상세보기 페이지</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  -->
	
	
	<div id="wrap" >
		<form>
		 <div style= "width: 920px; border:1px solid #D7D7D7; padding:40px ; margin-bottom: 20px ">
		<!-- <h3><strong>신청자 상세보기</strong></h3> -->
		<!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">신청자 상세보기</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->
		<div align="center">
		<img src="/third_prj/profile_img/${jrInfo.img}" style="float: inherit; margin-top: 20px; margin-left: 30px ;="Card image cap" onerror="this.src='/third_prj/resources/images/not_find_image.png'" /><br/><br/>
		<span style="vertical-align: bottom;"><h2>${jrInfo.nick}<!-- 닉네임 : 신규에용 --></h2></span>
		</div>
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
      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">${jrInfo.introduce}<!--자기소개  --></div>
      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">${jrInfo.motive}<!-- 지원동기 --></div>
    </div>
  </div>
</div>
		
  
  </div>
  <c:choose>
			<c:when test="${ empty currPage }">
				<a class="btn btn-secondary btn-lg" href="new_joiner.do?s_num=${param.s_num}"
					role="button" style="margin-left:250px;">목록으로</a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-secondary btn-lg" href="new_joiner.do?s_num=${param.s_num }"
					role="button" style="margin-left:250px;">목록으로</a>
			</c:otherwise>
		</c:choose>
  <a class="btn btn-secondary btn-lg" href="req_accept.do?s_num=${ param.s_num }&id=${jrInfo.id}" role="button" style="margin-left: 10px;">수락하기</a>
 <!--  <a class="btn btn-secondary btn-lg" href="#" id="act_bt" role="button" style="margin-left: 10px;">수락하기</a> -->
  <a class="btn btn-secondary btn-lg" href="req_reject.do?s_num=${param.s_num}&id=${jrInfo.id}" role="button" style="margin-left: 10px;">거절하기</a>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="/third_prj/resources/js/popper.min.js" ></script>
  <script src="/third_prj/resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>