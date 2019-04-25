<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
	<title>스터디 공지 리스트</title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="/third_prj/resources/js/popper.min.js" ></script>
  <script src="/third_prj/resources/js/bootstrap.min.js" ></script>
  <style type="text/css">
  	.select-card:hover {
  		background-color:#F1F3F4;
  	}
  </style>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->
	
		<!-- 점보트론 : 전광판 -->
  <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
     <div class="container">
        <h1 class="jumbotron-heading">스터디명스터디명스터디명</h1>
     </div>
  </section>
  <div style="height:20px;"></div>
  <!-- 점보트론 : 전광판 -->
	

	    <main role="main" class="col-lg-10 px-4" style="margin:0px auto;">
      <hr>
      <div class="col-lg-12">
      	<a href="#">스터디 탈퇴하기</a>
      </div>
      <hr>
      
      <!-- 공지가 존재하지 않을 경우 공지사항이 없다고 보여주기  -->
      <c:if test="${ empty snList  }">
      <div	style="text-align: center; margin-top: 200px">
      	<strong>등록된 공지사항이 없습니다.</strong>
      	</div>
      </c:if>
      	<!--공지사항이 있으면 표시  -->
      <div class="container-fluid" style="min-height:500px;">
      	<c:forEach var="sndata" items="${ snList }">
      	<div class="row col-sm justify-content-center">
      	
	      	<div class="card select-card border-dark mb-3" onclick="location.href='#'">
	      		<div class="card-body">
	      			 <h6 class="card-title"><a href="../study_notice/notice_detail.do?${ sndata.snNum }"><strong><c:out value="${ sndata.subject }"/></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#void"><img src="http://localhost:8080/third_prj/resources/images/setting.png" width="20" height="20" align="right" /></strong></a></h6>
						    <p class="card-text">
						    	<p class="text-left">
						    		<span style="font-size:12px; vertical-align:text-bottom;"><c:out value="${ sndata.inputDate }"/></span>
						    		<img src="http://localhost:8080/third_prj/resources/images/${ sndata.img }"width="50" height="60" style="float:right;"/>
<%-- 						    		<img src="/resources/images/"${ sndata.img }" width="50" height="60" style="float:right;"/> --%>
						    	</p>
					    	</p>
	      		</div>
      		</div>
      	</div>
      	</c:forEach>
<!--       	<div class="row col-sm justify-content-center">
	      	<div class="card select-card border-dark mb-3" onclick="location.href='#'">
	      		<div class="card-body">
	      			 <h6 class="card-title"><strong>공지명2.&nbsp;&nbsp;&nbsp;&nbsp;<img src="/third_prj/resources/images/setting.png" width="20" height="20"/></strong></h6>
						    <p class="card-text">
						    	<p class="text-left">
						    		<span style="font-size:12px;">2019-03-00</span>
						    		<img src="/third_prj/resources/images/no_profile.png" width="50" height="60" style="float:right;"/>
						    	</p>
					    	</p>
	      		</div>
      		</div>
      	</div>
      	<div class="row col-sm justify-content-center">
	      	<div class="card select-card border-dark mb-3" onclick="location.href='#'">
	      		<div class="card-body">
	      			 <h6 class="card-title"><strong>공지명1.&nbsp;&nbsp;&nbsp;&nbsp;<img src="/third_prj/resources/images/setting.png" width="20" height="20"/></strong></h6>
						    <p class="card-text">
						    	<p class="text-left">
						    		<span style="font-size:12px;">2019-03-00</span>
						    		<img src="/third_prj/resources/images/no_profile.png" width="50" height="60" style="float:right;"/>
						    	</p>
					    	</p>
	      		</div>
      		</div>
      	</div> -->
      </div>
    </main>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>