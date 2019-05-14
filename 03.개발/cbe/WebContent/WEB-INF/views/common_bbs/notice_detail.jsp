<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>
<style type="text/css">
#wrap {
	margin: 100px auto;
	width: 800px;
	min-height: 800px
}
.content {
	margin-top: 10px;
	margin-left: 100px;
	margin-top: 20px;
	min-height:200px;
	padding-top:15px;
	border-radius: 10px;
	border:1px solid #C0C0C0;
}
</style>
<title>세부 공지사항</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	<c:if test="${ empty detailNotice }">
		alert("서버로부터 공지사항 데이터를 가져오지 못했습니다");
		history.back();
	</c:if>
	
	<c:choose>
		<c:when test="${ empty currPage }">
			$("#backBtn").prop("href","javascript:history.back()");
		</c:when>
		<c:otherwise>
			$("#backBtn").prop("href","notice.do?currPage=${ currPage }");
		</c:otherwise>
	</c:choose>
});
</script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<div class="container form-group" id="wrap">
   <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
      <div class="container">
         <h1 class="jumbotron-heading">세부 공지사항</h1>
      </div>
   </section>
   <div style="height:20px;"></div>
		

		<div class="row">
			<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
				<label style="font-size: 25px;"><c:out value="${ detailNotice.subject }"/></label>
			</div>
		</div>
		<div class="row">
			<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
				<label style="width: 50px;">등록일</label> 
				<label style="width: 200px; margin-left: 30px;"><c:out value="${ detailNotice.input_date }"/></label> 
				<label style="width: 50px; margin-left: 20px;">조회수</label> 
				<label style="width: 100px; margin-left: 30px;"><c:out value="${ detailNotice.view_cnt }"/></label>
			</div>

		</div>
		<div class=" row">
				<div class="col-9 content">
					<c:out value="${ detailNotice.content }" escapeXml="false"/>
				</div>
			</div>

		<div class="row justify-content-center" style="margin-top: 30px;">
				<a id="backBtn" class="btn btn-secondary btn"
					role="button" style="margin-top: 15px;">목록으로</a>
		</div>
	</div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://211.63.89.144/resources/js/popper.min.js"></script>
	<script src="http://211.63.89.144/resources/js/bootstrap.min.js"></script>
</body>
</html>