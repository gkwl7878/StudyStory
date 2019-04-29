<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
<style type="text/css">
#wrap {
	margin: 100px auto;
	width: 800px;
	min-height: 800px
}
.font17bold {
	font-size: 17px;
	font-weight: bold;
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

<title>내 상세 문의</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ empty detailQuestion }">
			alert("서버로부터 문의데이터를 가져오지 못했습니다");
			history.back();
		</c:if>
		
		<c:choose>
		<c:when test="${ empty currPage }">
			$("#backBtn").prop("href","javascript:history.back()");
		</c:when>
		<c:otherwise>
			$("#backBtn").prop("href","question.do?currPage=${ currPage }");
		</c:otherwise>
	</c:choose>
	});
</script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<form action="create_request.jsp" name="createFrm">
		<div class="container form-group" id="wrap">
    <section class="text-center bg-white mb-0" style="margin-top:20px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">내 문의보기</h1>
       </div>
    </section>
    <div style="height:20px;"></div>

			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="font-size: 25px;"><c:out value="${ detailQuestion.subject }"/></label>
				</div>
			</div>
			<div class=" row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 80px;" class="font17bold"><strong>분류</strong></label>
					<label style="width: 200px; margin-left: 30px;"><c:out value="${ detailQuestion.category }"/></label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 80px;" class="font17bold"><strong>등록일</strong></label>
					<label style="width: 150px; margin-left: 30px;"><c:out value="${ detailQuestion.input_date }"/></label>
					<label style="width: 100px; margin-left: 20px;" class="font17bold">답변여부</label>
					<label style="width: 100px; margin-left: 50px;"><c:out value="${ detailQuestion.answer_flag eq 'N' ? '미답변' : '답변완료' }"/></label>
				</div>
			</div>
			<div class=" row">
				<div class="col-9 content">
					<c:out value="${ detailQuestion.content }" escapeXml="false"/>
				</div>
			</div>
			
			<c:if test="${ detailQuestion.answer_flag eq 'Y' ? true : false }">
				<hr>
				<div class="row">
					<div class="col-9" style="margin-left:100px;">
						<label style="width: 80px;" class="font17bold">답변일</label>
						<label style="width: 150px; margin-left: 30px;"><c:out value="${ detailQuestion.answer_date }"/></label>
					</div>
				</div>
				<div class=" row">
					<div class="col-9 content">
						<c:out value="${ detailQuestion.answer_content }" escapeXml="false"/>
					</div>
				</div>
				<br/>
			</c:if>
			
			<div class="row" style="margin-top: 30px;">
				<a id="backBtn" class="btn btn-secondary btn" role="button"
					style="margin-left: 290px;">목록으로</a>
				<a class="btn btn-secondary btn" href="/third_prj/common_bbs/ask.do" role="button"
					style="margin-left: 10px;">재문의하기</a>
			</div>
		</div>
	</form>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>