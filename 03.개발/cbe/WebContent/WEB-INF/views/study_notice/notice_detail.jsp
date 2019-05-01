<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
	<title>스터디 공지 리스트</title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
  <style type="text/css">
  
  .font20bold {
  	font-size:20px;
  	font-weight: bold;
  }
  
  .font12bold {
  	font-size:12px;
  	font-weight: bold;
  }
  
  
  </style>
  
  
  <!-- daum map api -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=556561d449900c23e674c88c88f33ce6"></script>
  <script type="text/javascript">
  $(function() {
	  var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	  var options = { //지도를 생성할 때 필요한 기본 옵션
	  	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	  	level: 3 //지도의 레벨(확대, 축소 정도)
	  };
	
	  var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	  
		// 마커가 표시될 위치입니다 
	  var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

	  // 마커를 생성합니다
	  var marker = new daum.maps.Marker({
	      position: markerPosition
	  });

	  // 마커가 지도 위에 표시되도록 설정합니다
	  marker.setMap(map);
  })
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->

		<!-- 점보트론 : 전광판 -->
  <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
     <div class="container">
        <h1 class="jumbotron-heading">영어공부스터뒹</h1><!--스터디 이름 띄어오기. sn_num을 받아서 스터디명?  -->
     </div>
  </section>
  <div style="height:20px;"></div>
  <!-- 점보트론 : 전광판 -->
	

	    <main role="main" class="col-lg-10 px-4" style="margin:0px auto;">
      <hr>
      
      <div class="container" style="min-height:500px;">
	      <div class="row">
	      	<div class="col-3 font20bold">스터디 공지</div>
	   			<div class="col-6">
	   				${ snDetailList.subject }
	   			</div>
	     		<div class="col-3 text-right">
	     			${ snDetailList.input_date }
	     		</div>
	     	</div>	
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3">
	     			${ snDetailList.nick }<br/>
	     			<img src="http://localhost:8080/third_prj/resources/images/${ snDetailList.img }" width="50" height="60"/>
	     		</div>
	     		<div class="col-9">
	     			<textarea style="width:100%;" readonly="readonly" >"${ snDetailList.content }"</textarea>
	     		</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold">과제</div>
					   	 <c:if test="${ empty hwList  }">
					     <div	style="text-align: center; ">
					      	<strong>등록된 과제가 없습니다.</strong>
					      	</div>
					      </c:if>
	      	<c:forEach var="hwdata" items="${hwList }">
	      	<div class="col-2" style="font-size: 26px">
	      		<span class="font12bold">${hwdata.id}</span>
	      	</div>
	      	<div class="col-6">
	      		<span class="font16bold">${hwdata.workload}</span>
	      	</div>
	      	<div class="col-1 form-check">
	      		<input type="checkbox" class="form-check-input"/>
	      	</div>
	      	<div class="col-3"></div><!-- 추가시 공백칼럼 -->
	      	</c:forEach>
	      	<!-- <div class="col-2">
	      		<span class="font12bold">스터디원1</span>
	      	</div>
	      	<div class="col-6">
	      		<span class="font12bold">이런거 해오세요~</span>
	      	</div>
	      	<div class="col-1 form-check">
	      		<input type="checkbox" class="form-check-input"/>
	      	</div> -->
	      </div>
	      <div class="row" style="margin-top:30px;">
		      <div class="col-3 font20bold">장소</div>
		      <div class="col-9">
		      	<div id="map" style="width:100%;height:400px;"></div>
		      </div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold">시간</div>
	      	<div class="col-9">${ snDetailList.meetingInfo }</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold">댓글</div>
	      	
	      	<c:forEach var="sncmtList" items="${snCmt }">
	      	
	      	<div class="col-2">
	      		<span class="font12bold">${sncmtList.nick}<!-- 스터디원1 --></span>
	      	</div>
	      	<div class="col-5">
	      		<span class="font12bold">${sncmtList.snComment}<!-- 이런거 해오세요~ --></span>
	      	</div>
	      	<div class="col-2 font12bold text-center">
	      		${sncmtList.inputDate}<!-- 2019-03-02 PM 02:11 -->
	      	</div>
	      	<div class="col-3"></div><!-- 추가될때마다 공백칼럼 넣어줘야 함 -->
	      	</c:forEach>
	      	<!-- <div class="col-2">
	      		<span class="font12bold">스터디원1</span>
	      	</div>
	      	<div class="col-5">
	      		<span class="font12bold">이런거 해오세요~</span>
	      	</div>
	      	<div class="col-2 font12bold text-center">
	      		2019-03-02 PM 02:11
	      	</div> -->
	      	<div class="col-3"></div><!-- 마지막 줄은 댓글창 공백칼럼 넣어줘야 함 -->
	      	<div class="col-2">
	      		<span class="font12bold">내닉넴<!--????  --></span>
	      	</div>
	      	<div class="col-5" style="padding-right:0px;">
	      		<input type="text" placeholder="내용을 입력해주세요." class="form-control form-control-sm" size="25"/>
	      	</div>
	      	<div class="col-2 justify-content-center">
		      	<button type="button" class="btn btn-secondary btn-sm" style="font-size:12px; width:80%">댓글달기</button>
	      	</div>
	      </div>
	      <div class="row justify-content-center" style="min-height:100px; margin-top:30px;">
	      	<button type="button" class="btn btn-secondary" style="height:40px;">목록으로</button>
	      </div>
	   	 </div>
      </div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>