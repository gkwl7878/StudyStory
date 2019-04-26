<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 800px;
	min-height: 800px
}

.font20bold {
	font-size: 20px;
	font-weight: bold;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
<title>세부 알림보기</title>
<!-- Custom styles for this template -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ empty detailAlarm }">
			alert("서버로부터 알림데이터를 가져오지 못했습니다");
			history.back();
		</c:if>
	});
</script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<div class="container form-group" id="wrap">
		   <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:90px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">세부 알림보기</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->

		<div class="row" style="margin-top: 30px;">
			<div class="col-3 font20bold">
				<strong style="float: right;">제목 </strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" value="${ detailAlarm.subject }" readonly="readonly">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong style="float: right;">분류 </strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" value="${ detailAlarm.category }" readonly="readonly">
			</div>
		</div>
		<div class=" row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong style="float: right;">내용 </strong>
			</div>
			<div class="col-7 font20bold">
				<textarea class="form-control" rows="3" style="resize: none; 
					height: 300px;" name="contents" readonly="readonly"><c:out value="${ detailAlarm.content }"/></textarea>
			</div>
		</div>

		<div class=" row" style="margin-top: 10px;">
			<div class="col-3 font20bold"></div>
			<div class="col-7 ont20bold">
				<label>날짜 : <c:out value="${ detailAlarm.input_date }"/></label>
			</div>
		</div>
		<c:choose>
			<c:when test="${ empty currPage }">
				<a class="btn btn-secondary btn" href="javascript:history.back()"
					role="button" style="margin-left: 340px; margin-top: 15px;">목록으로</a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-secondary btn" href="alarm.do?currPage=${ currPage }"
					role="button" style="margin-left: 340px; margin-top: 15px;">목록으로</a>
			</c:otherwise>
		</c:choose>
	</div>


	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>



</body>
</html>