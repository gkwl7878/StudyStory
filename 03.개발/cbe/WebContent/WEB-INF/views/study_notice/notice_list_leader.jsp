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
	<title>스터디 공지 리스트</title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://211.63.89.144/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://211.63.89.144/resources/js/popper.min.js" ></script>
  <script src="http://211.63.89.144/resources/js/bootstrap.min.js" ></script>
  <style type="text/css">
  	.select-card:hover {
  		background-color:#F1F3F4;
  	}
  </style>
  <script type="text/javascript">
  	window.onload = function() {
	  	<c:if test="${ recruitChanged }">
	  		alert("모집상태가 변경되었습니다");
	  	</c:if>
	  	<c:if test="${ snAddSuccessFlag }">
	  		alert("새로운 스터디 공지를 추가했습니다");
	  	</c:if>
	  	<c:if test="${ snAddFailFlag }">
	  		alert("스터디 공지 등록에 실패했습니다. 잠시 후에 다시 시도해주세요");
	  	</c:if>
	  	<c:if test="${ snModifySuccessFlag }">
	  		alert("스터디 공지 수정에 성공했습니다");
	  	</c:if>
	  	<c:if test="${ snModifyFailFlag }">
	  		alert("스터디 공지 수정에 실패했습니다. 잠시 후에 다시 시도해주세요");
	  	</c:if>
	  	
	  	$("#recruitChangeBtn").click(function() {
	  		$("#recruitChangeFrm").submit();
	  	});
  	}
  	
  	function createSn() {
  		if (confirm("새 공지사항을 추가하시겠습니까?")){
  			location.href = "wrtie.do?s_num=${ param.s_num }";
  		}
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
        <h1 class="jumbotron-heading"><c:out value="${ study_name }"/></h1>
     </div>
  </section>
  <div style="height:20px;"></div>
  <!-- 점보트론 : 전광판 -->

  <div class="row justify-content-center">
  <div class="col-lg-8 border-top border-bottom" style="padding:15px;">
  	<a href="../study_group/new_joiner.do?s_num=${ param.s_num }">신청자 보기</a>&nbsp;&nbsp;
  	<a href="../study_group/show_participants.do?s_num=${ param.s_num }">참여자 보기</a>&nbsp;&nbsp;

  	<a href="../study_group/modify_study.do?sNum=${ param.s_num }">스터디 수정하기</a>&nbsp;&nbsp;
  	<a href="../study_group/end_study.do?sNum=${ param.s_num}">스터디 활동종료</a>&nbsp;&nbsp;
  	<div style="float:right;">
  	<form id="recruitChangeFrm" action="change_recruit.do" method="post">
	    <select name="status">
	    	<option value="Y" ${ recruitment eq 'Y' ? "selected" : "" }>모집중</option>
	    	<option value="N" ${ recruitment eq 'Y' ? "" : "selected" }>모집종료</option>
	    </select>
	  	<input type="hidden" name="s_num" value="${ param.s_num }"/>
	    <button type="button" class="btn btn-sm btn-outline-secondary" id="recruitChangeBtn">모집상태 변경</button>
    </form>
    </div>
  </div>
  </div>
  <div class="container-fluid" style="min-height:500px; width:450px;">
	<div class="row col-sm justify-content-center" style="margin-top:20px;">
 		<a href="wrtie.do?s_num=${ param.s_num }">+새 공지 추가하기</a>
	</div>
  	<div class="row col-sm justify-content-center">
  	<c:if test="${ empty snList }">
   	<div class="card select-card border-dark m-3 p-2 text-center" style="width:300px; height:80px;" onclick="createSn()">
   		<div class="card-body">
   			 <h6 class="card-title"><strong>등록된 스터디 공지가 없습니다</strong></h6>
   		</div>
 		</div>
  	</c:if>
  	<c:forEach items="${ snList }" var="studyNotice">
   	<div class="card select-card border-dark m-3 p-2" style="width:300px; min-height:150px;">
   		<div class="card-body">
   			 <div style="float:left;" class="card-title">
   			 	<a href="javascript:location.href='notice_detail.do?sn_num=${ studyNotice.snNum }&s_num=${ param.s_num }'"><strong>${ studyNotice.subject }</strong></a>&nbsp;&nbsp;
   			 	<span style="color:#E36539">
   			 		<c:out value="${ studyNotice.commentNum eq '0' ? '' : studyNotice.commentNum}"/>
   			 	</span>
   			 </div>
   			 <div style="float:right;"><a href="javascript:location.href='../study_notice/modify.do?sn_num=${ studyNotice.snNum }&s_num=${ param.s_num }'"><img src="http://211.63.89.144/resources/images/setting.png" width="20" height="20"/></a></div>
   			 <br/>
		    <p class="card-text">
		    	<p class="text-left">
		    		<span style="font-size:12px;"><c:out value="${ studyNotice.inputDate }"/></span>
		    		<img src="http://211.63.89.144/profile_img/${ studyNotice.img }" width="50" height="60" style="float:right;"/>
		    	</p>
	    	</p>
   		</div>
 		</div>
 		</c:forEach>
 		
  	</div>
  </div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>