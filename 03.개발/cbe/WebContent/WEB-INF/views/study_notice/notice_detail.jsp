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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=556561d449900c23e674c88c88f33ce6&libraries=services"></script>
  <script type="text/javascript">
  $(function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${ snDetailList.addr }', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
			});    
	  });
	</script>
  <script type="text/javascript">
	  $(function() {
		  
		  $(".finishHw").click(function() {
			  
			  if (!$(this).is(":checked")) {
				  alert("이미 완료된 과제입니다");
				  $(this).prop('checked',true);
				  return;
			  }
			  
			  var mynick = '${ sessionScope.nick }';
			  var nick = $(this).parent().parent().children("td:first").first().text();
			  
			  alert(mynick +" "+nick);
			  
			  if (mynick != nick) {
				  $(this).attr('checked',false);
				  alert('회원님의 과제가 아닙니다');
				  return;
			  }
			  
			  // 과제수행 업데이트 처리
			  
			  $.ajax({
				  url:"finish_hw.do",
				  type:"post",
				  data:"sn_num="+'${ param.sn_num }'+"&id="+'${ sessionScope.id }',
				  dataType:"json",
				  error:function(xhr) {
					  console.log("에러코드 : "+xhr.status+", 에러 메시지 : "+xhr.statusText);
				  },
				  success:function(json) {
					  if (json.checkHw) {
						  alert("과제 완료 처리를 했습니다");
						  $(this).prop('checked', true);
					  }
				  }
			  });
			  
		  });
		  
		  $("#commentBtn").click(function(){
			  var comment=$("#comment").val();
			  
			  if(comment == ""){
				  alert("내용을 입력해주세요!");
				  $("#comment").focus();
				  return
			  }//end if
			  
			  $("#commentFrm").submit();
			  
		  });//click
	  })//ready
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->

		<!-- 점보트론 : 전광판 -->
  <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
     <div class="container">
        <h1 class="jumbotron-heading"><c:out value="${ study_name }"/></h1>
     </div>
  </section>
  <div style="height:20px;"></div>
  <!-- 점보트론 : 전광판 -->

      <hr>
      <div class="container" style="min-height:500px;">
	      <div class="row">
	      	<div class="col-3 font20bold text-center">스터디 공지</div>
	   			<div class="col-7 font20bold">
	   				<c:out value="${ snDetailList.subject }"/>
	   			</div>
	     		<div class="col-2 text-center" style="width:80%;">
	     			<c:out value="${ snDetailList.input_date }"/>
	     		</div>
	     	</div>	
	      <div class="row" style="margin-top:30px;  min-height:250px;">
	      	<div class="col-3 text-center">
	     			<c:out value="${ snDetailList.nick }"/><br/>
	     			<img src="/third_prj/profile_img/${ snDetailList.img }" width="50" height="60"/>
	     		</div>
	     		<div class="col-9">
	     			<c:out value="${ snDetailList.content}" escapeXml="false"/>
	     		</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold text-center">과제</div>
			   	<c:if test="${ empty hwList  }">
				    <div class="col-9">
				     	<strong>등록된 과제가 없습니다</strong> 
			     	</div>
			    </c:if>
	      	<table  class="col-9" style="width:780px;">
	      	<c:forEach var="hwdata" items="${ hwList }">
	      		<tr>
	      			<td style="padding-left:17px; width:80px;"><strong><c:out value="${ hwdata.nick }"/></strong></td>
	      			<td style="width:400px;"><c:out value="${ hwdata.workload }"/></td>
	      			<td style="width:100px;">
	      				<strong>완료여부</strong>&nbsp;&nbsp;&nbsp;
	      				<input class="finishHw" type="checkbox" ${ hwdata.finish_flag eq 'N' ? '' : 'checked="checked"' }/>
	      			</td>
	      		</tr>
	      	</c:forEach>
	      	</table>
	      </div>
	      <div class="row" style="margin-top:30px;">
		      <div class="col-3 font20bold text-center">장소</div>
		      <div class="col-9">
		      	<div id="map" style="width:96%;height:400px;"></div>
		      </div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold text-center">모임시간</div>
	      	<div class="col-9">${ snDetailList.meetingInfo }</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold text-center">댓글</div>
	      	
	      	<table  class="col-9" style="width:780px;">
	      	<c:forEach var="sncmtList" items="${ snCmt }">
	      		<tr>
	      			<td style="padding-left:17px; width:80px;"><strong><c:out value="${ sncmtList.nick }"/></strong></td>
	      			<td style="width:400px;"><c:out value="${ sncmtList.snComment }"/></td>
	      			<td style="width:100px;"><c:out value="${ sncmtList.inputDate }"/></td>
	      		</tr>
	      	</c:forEach>
	      	</table>
	   
	      	<div class="col-3"></div> 
	      	<form action="add_sn_comment.do" id="commentFrm" method="post" class="col-9" style="margin-top:20px;">
	      	<div class="font-weight-bold" style="float:left; width:100px;">
	      		<c:out value="${ sessionScope.nick }"/>
	      		<input type="hidden" name="id" value="${ sessionScope.id }"/>
	      		<input type="hidden" name="snNum" value="${ param.sn_num }"/>
	      		<input type="hidden" name="sNum" value="${ param.s_num }"/>
	      	</div>
	      	<div style="padding-right:0px; float:left; width:70%; margin-left:10px; ">
	      		<input type="text" placeholder="내용을 입력해주세요." name="snComment" id="comment" class="form-control form-control-sm" size="25" maxlength="100"/>
	      	</div>
	      	<div class="justify-content-center" style="float:left; margin-left:10px; width:100px;">
		      	<button type="button" id="commentBtn" class="btn btn-secondary" style="font-size:12px; width:100%">댓글달기</button>
	      	</div>
		      </form>
	      </div>
	      <div class="row justify-content-center" style="min-height:100px; margin-top:30px;">
	      	<button type="button" class="btn btn-secondary" style="height:40px; " onclick="location.href='${ leaderFlag ? 'notice_list_leader.do' : 'notice_list.do' }?s_num=${ param.s_num }'">목록으로</button>
	      </div>
   	 </div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>