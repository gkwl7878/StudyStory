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
	<title>스터디 공지 작성</title>
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
  <!-- summernote 관련 library 시작 -->
	<!-- jQuery 순서 중요 -->
	<!-- include libraries(jQuery, bootstrap) -->
	<script src="http://localhost:8080/third_prj/resources/summernote/jquery.js"></script> 
	<script src="http://localhost:8080/third_prj/resources/summernote/bootstrap.js"></script> 

	<!-- include summernote css/js, font깨짐으로 CDN이용해서 summernote 사용 -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
	<script>
		$(document).ready(function() {
		  $('#summernote').summernote({
		    lang: 'ko-KR', 
	    	placeholder: '공지 내용을 입력해주세요.',
	      tabsize: 2,
	      height: 300
		  });
		});
  </script>
  <!-- include summernote-ko-KR -->
	<script src="http://localhost:8080/third_prj/resources/summernote/summernote-ko-KR.js"></script>
	<!-- summernote 관련 library 끝 -->
  
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
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->
	
  <!-- 점보트론 : 전광판 -->
  <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
     <div class="container">
        <h1 class="jumbotron-heading">스터디 공지 작성</h1>
     </div>
  </section>
  <div style="height:20px;"></div>
  <!-- 점보트론 : 전광판 -->

	<div class="container col-10" style="margin:0px auto;">
    <div class="row">
   		<div class="col-3 font20bold text-center">제목</div>
			<div class="col-9 form-group">
				<input type="text" class="form-control" placeholder="공지명을 입력해주세요(최대100자)">
			</div>
  	</div>	
	  <div class="row" style="margin-top:30px;">
	   	<div class="col-3 font20bold text-center" style="min-height:200px;">내용</div>
	  	<div class="col-9">
	  		<div id="summernote"></div>
	  	</div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	  	<div class="col-3 font20bold text-center">과제</div>
	  	<div class="col-2 form-group">
	  		<select class="form-control form-control-sm" style="font-size:10px; padding-left:0px;">
	  			<option>스터디원</option>
	   		</select>
	  	</div>
   		<div class="col-6" style="padding-left:0px; padding-right:0px;">
   			<input type="text" class="form-control form-control-sm font12bold" placeholder="과제내용"/>
   		</div>
   		<div class="col-1" style="padding-right:10px; padding-left:5px;">
   			<button type="button" class="btn btn-secondary btn-sm" style="width:100%; font-size:12px;">추가</button>
   		</div>
   	</div>
	  <div class="row" style="margin-top:30px;">
	   	<div class="col-3"></div><!-- 추가시 공백칼럼 -->
	   	<div class="col-2 text-center">
	   		<span class="font12bold">스터디원1</span>
	   	</div>
	   	<div class="col-6">
	   		<span class="font12bold">이런거 해오세요~</span>
	   	</div>
	   	<div class="col-1 text-center">
	   		<a href="#"><images src="http://localhost:8080/third_prj/resources/images/minus.png" style="width:20px; height:20px;"/></a>
	   	</div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	    <div class="col-3 font20bold text-center">장소</div>
	    <div class="col-7" style="padding-right:0px;">
	    	<input type="text" class="form-control" placeholder="주소명"/>
	    </div>
	    <div class="col-2" style="padding-right:10px; padding-left:5px;">
	    	<button type="button" class="btn btn-secondary btn-sm" style="width:100%; font-size:12px;">주소 검색</button>
	    </div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	    <div class="col-3 font20bold text-center">장소</div>
	    <div class="col-9">
	    	<div id="map" style="width:100%;height:400px;"></div>
	    </div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	   	<div class="col-3 font20bold text-center">시간</div>
	   	<div class="col-9">
	   		<input type="text" class="form-control" placeholder="모임 시간을 입력해주세요"/>
	   	</div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	   	<div class="col-3 font20bold text-center">댓글</div>
	   	<div class="col-2 text-center">
	   		<span class="font12bold">스터디원1</span>
	    </div>
	   	<div class="col-5">
	   		<span class="font12bold">이런거 해오세요~</span>
	   	</div>
	   	<div class="col-2 font12bold text-center">
	   		2019-03-02 PM 02:11
	   	</div>
	   	<div class="col-3"></div><!-- 추가될때마다 공백칼럼 넣어줘야 함 -->
	   	<div class="col-2 text-center">
	   		<span class="font12bold">스터디원1</span>
	   	</div>
	   	<div class="col-5">
	   		<span class="font12bold">이런거 해오세요~</span>
	    </div>
	   	<div class="col-2 font12bold text-center">
	   		2019-03-02 PM 02:11
	   	</div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	   	<div class="col-3"></div><!-- 마지막 줄은 댓글창 공백칼럼 넣어줘야 함 -->
	   	<div class="col-2 text-center">
	   		<span class="font12bold">내 닉네임</span>
	   	</div>
	   	<div class="col-5" style="padding-left:0px; padding-right:0px;">
	   		<input type="text" placeholder="내용을 입력해주세요." class="form-control"/>
	   	</div>
	   	<div class="col-2 text-center">
	    	<button type="button" class="btn btn-secondary btn-sm" style="font-size:12px; width:80%">댓글달기</button>
	   	</div>
	   </div>
	   <div class="row justify-content-center" style="min-height:100px; margin-top:30px;">
	   	<span style="padding-right:10px;"><button type="button" class="btn btn-secondary" style="height:40px; width:120px;">취소</button></span>
	   	<button type="button" class="btn btn-secondary" style="height:40px; width:120px;">작성</button>
	   </div>
		</div>
	</div>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>
</body>
</html>