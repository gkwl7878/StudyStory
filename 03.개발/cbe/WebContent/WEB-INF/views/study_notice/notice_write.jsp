<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>
	<title>스터디 공지 작성</title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://211.63.89.144/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://211.63.89.144/resources/js/popper.min.js" ></script>
  <script src="http://211.63.89.144/resources/js/bootstrap.min.js" ></script>
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
	<script src="http://211.63.89.144/resources/summernote/bootstrap.js"></script> 
	<!-- include summernote css/js, font깨짐으로 CDN이용해서 summernote 사용 -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
  <!-- daum map api -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=556561d449900c23e674c88c88f33ce6&libraries=services"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript">
		window.onload=function(){
			document.getElementById("addrBtn").addEventListener("click", execPostcode);
			setMap("제주특별자치도 제주시 첨단로 242");
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
              /* document.getElementById('zipcode').value = data.zonecode; */
              document.getElementById("addr").value = roadAddr;
              setMap(roadAddr); // 지도에 마커 처리
             // document.getElementById("jibunAddr").value = data.jibunAddress;
          }
      }).open();
	  }
	  
	  function setMap(roadAddr) {
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
			geocoder.addressSearch(roadAddr, function(result, status) {
			
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
	  }
  </script>
  <script type="text/javascript">
  	$(function() {
  		nickArr = new Array(); // 전역변수화
  		workloadArr = new Array();
  		var i = 0;
  		
  		$("#writeBtn").click(function() {
  			
  			var subject = $("#subject").val();
  			
  			if (subject == "") {
  				alert("공지제목을 입력해주세요");
  				$("#subject").focus();
  				return;
  			}
  			
  			var content = $("#summernote").val();
  			
  			if (content == "") {
	  			alert("공지 내용을 입력해주세요");	
  				return;
  			}
  			
  			// 과제는 필수아님
  			
  			var addr = $("#addr").val();
  			
  			if (addr == "") {
  				alert("주소를 검색해주세요");
  				$("#addrBtn").focus();
  				return;
  			}
  			
  			var meeting_info = $("#meeting_info").val();
  			
  			if (meeting_info == "") {
  				alert("모임장소에 대한 상세정보를 입력해주세요");
  				$("#meeting_info").focus();
  				return;
  			}
  			
  			var sendingNick = new Array();
  			var sendingWorkload = new Array();
  			var k = 0;
  			for(var j=0; j<nickArr.length; j++) {
  				if(nickArr[j] != "") {
  					sendingNick[k] = nickArr[j];
  					sendingWorkload[k] = workloadArr[j];
  					k++;
  				}
  			}
  			
  			$("[name='hwNick']").val(sendingNick);
  			$("[name='hwWorkload']").val(sendingWorkload);
  			
  			$("#writeFrm").submit();
  		});
  		
  		
  		$("#hwBtn").click(function() {
  			var nick = $("#hwNick").val();
  			
  			if (nick == "none") {
  				alert("스터디원을 선택해주세요");
  				$("#hwNick").focus();
  				return;
  			}
  			
  			for(var j=0; j<nickArr.length; j++) {
  				if(nickArr[j] == nick) {
  					alert("이미 과제를 등록하신 스터디원입니다");
  					return;
  				}
  			}
  			
  			var workload = $("#workload").val();
  			
  			if (workload == "") {
  				alert("과제내용을 입력해주세요");
  				$("#workload").focus();
  				return;
  			}
  			
  			$("#hwTab:last").append(
  					"<tr><td width='100' style='text-align:center;'><span class='font12bold'>"+nick+"</span></td>"
  		  		+"<td width='400'><span class='font12bold' style='padding-left:20px;'>"+workload+"</span></td>"
  		  		+"<td width='100' style='text-align:right;'><a href='#'><img onclick='deleteHw(this)' src='http://211.63.89.144/resources/images/minus.png' style='width:20px; height:20px;'/></a></td></tr>"
  			);
  			
  			nickArr[i] = nick;
  			workloadArr[i] = workload;
  			i++;
  			$("#workload").val('');
  		});
  	});
  	
		function deleteHw(imgTag) {
 			deleteNick = $(imgTag).closest("tr").children('td:first').text();
 			
 			for(var j=0; j<nickArr.length; j++) {
 				if (nickArr[j] == deleteNick) {
 					nickArr[j] = "";
 					workloadArr[j] = "";
 				}
 			}
 			$(imgTag).closest("tr").remove();
 		}
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->
	
  <!-- 점보트론 : 전광판 -->
  <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
     <div class="container">
        <h1 class="jumbotron-heading">스터디 공지 작성</h1>
     </div>
  </section>
  <div style="height:20px;"></div>
  <!-- 점보트론 : 전광판 -->

	<form action="wrtie_process.do" method="post" id="writeFrm">
	<input type="hidden" name="hwNick"/>
	<input type="hidden" name="hwWorkload"/>
	<input type="hidden" name="s_num" value="${ param.s_num }"/>
	
	<div class="container col-10" style="margin:0px auto; width:800px;">
    <div class="row">
   		<div class="col-3 font20bold text-center">제목</div>
			<div class="col-9 form-group">
				<input id="subject" name="subject" type="text" class="form-control" placeholder="공지명을 입력해주세요(최대100자)">
			</div>
  	</div>	
	  <div class="row" style="margin-top:30px;">
	   	<div class="col-3 font20bold text-center" style="min-height:200px;">내용</div>
	  	<div class="col-9">
	  		<textarea name='content' id="summernote"></textarea>
	  	</div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	  	<div class="col-3 font20bold text-center">과제</div>
	  	<div class="col-2 form-group">
	  		<select id="hwNick" class="form-control form-control-sm" style="font-size:10px; padding-left:0px;">
	  			<option value="none">--스터디원--</option>
	  			<c:forEach var="member" items="${ nickAndIdList }">
	  				<option value="${ member.nick }"><c:out value="${ member.nick }"/></option>
	  			</c:forEach>
	   		</select>
	  	</div>
   		<div class="col-6" style="padding-left:0px; padding-right:0px;">
   			<input id="workload" type="text" class="form-control form-control-sm font12bold" placeholder="과제내용"/>
   		</div>
   		<div class="col-1" style="padding-right:10px; padding-left:5px;">
   			<button id="hwBtn" type="button" class="btn btn-secondary btn-sm" style="width:100%; font-size:12px;">추가</button>
   		</div>
   	</div>
   	
   	
   	
	  <div class="row" style="margin-top:10px;">
	  	<div class="col-3"></div>
	  	<div class="col-9">
	  	<table id="hwTab">
	  	</table>
	  	</div>
	  </div>
	  
	  
	  
	  <div class="row" style="margin-top:30px;">
	    <div class="col-3 font20bold text-center">장소</div>
	    <div class="col-7" style="padding-right:0px;">
	    	<input id="addr" name="addr" readonly="readonly" type="text" class="form-control form-control-sm" placeholder="주소명"/>
	    </div>
	    <div class="col-2" style="padding-right:10px; padding-left:5px;">
	    	<button id="addrBtn" type="button" class="btn btn-secondary btn-sm" style="width:100%; font-size:12px;">주소 검색</button>
	    </div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	    <div class="col-3"></div>
	    <div class="col-9">
	    	<div id="map" style="width:100%;height:400px;"></div>
	    </div>
	  </div>
	  <div class="row" style="margin-top:30px;">
	   	<div class="col-3 font20bold text-center">시간</div>
	   	<div class="col-9">
	   		<input id="meeting_info" name="meeting_info" type="text" class="form-control" placeholder="모임 시간을 입력해주세요"/>
	   	</div>
	  </div>
	   <div class="row justify-content-center" style="min-height:100px; margin-top:30px;">
	   	<span style="padding-right:10px;">
	   		<button type="button" class="btn btn-secondary" 
	   			style="height:40px; width:120px;" 
	   			onclick="location.href='notice_list_leader.do?s_num=${ param.s_num }'">취소</button>
	   	</span>
	   	<button id="writeBtn" type="button" class="btn btn-secondary" style="height:40px; width:120px;">작성</button>
	   </div>
		</div>
	</form>
	

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
	<script src="http://211.63.89.144/resources/summernote/summernote-ko-KR.js"></script>
	<script>
	  $('#summernote').summernote({
	    lang: 'ko-KR', 
    	placeholder: '공지 내용을 입력해주세요.',
      tabsize: 2,
      height: 300
	  });
  </script>
</body>
</html>