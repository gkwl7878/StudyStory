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
/* #link{margin-left: 1000px; margin-top: 20px} */
#loginTitle {
	text-align: center;
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

<title>새 스터디 상세 정보</title>
<!-- Custom styles for this template -->
<link href="/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/third_prj/resources/js/admin_dashboard.js"></script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ !loginSession }">
		location.replace("login.do");
		</c:if>
	});//ready
</script>

</head>

<body>
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
				<c:param name="weekUser" value="${param.weekUser}"></c:param>
				<c:param name="weekStudy" value="${param.weekStudy}"></c:param>
				<c:param name="allUser" value="${param.allUser}"></c:param>
				<c:param name="allStudy" value="${param.allStudy}"></c:param>
				<c:param name="activeFlag" value="${param.activeFlag}"></c:param>
	</c:import>
	<!-- sidebar 끝 -->

	<div class="container form-group" id="wrap">
		<div class="row">
			<div class="col-12 justify-content-left" style="margin-bottom: 20px;">
				<strong style="font-size: 45px;">새 스터디 상세 정보</strong><img src="../resources/images/create.png" style="width: 150px; height: 120px; margin-left: 30px;">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>번호</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly" value="${param.sNum }">
			</div>
		</div>

		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>리더</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly" value="${requestScope.id }">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>주제</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly" value="${requestScope.category }">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>지역</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly" value="${requestScope.loc }">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>스터디명</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly" value="${requestScope.studyName }">
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>생성일</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" readonly="readonly" value="${requestScope.inputDate }">
			</div>
		</div>

		<div class=" row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>스터디 썸네일</strong></label>&nbsp;
			</div>
			<div class="col-7 font20bold">
				<img width="440" height="300" id="img" src="../resources/images/${requestScope.img }" border="0" title='찾아보기' alt='찾아보기'>
				
			</div>
		</div>

		<div class=" row" style="margin-top: 15px;">
			<div class="col-3 font20bold">
				<strong>상세설명</strong>
			</div>
			<div class="col-7 ">
				<div class=" rounded-sm text-dark " style="min-height: 300px; margin-top: 20px; background-color:#E9ECEF; border: 1px solid #CED4DA; font-size: 17px; padding: 10px">
					<c:out value="${requestScope.content}" escapeXml="false" />
				</div>
				<%-- <textarea class="form-control" rows="3" style="resize: none; width: 440px; height: 300px; margin-top: 20px;" 
				name="contents" readonly="readonly" >${requestScope.content}</textarea> --%>
			</div>
		</div>
		<div class="row" style="margin-top: 30px; margin-left: 116px">
			<a class="btn btn-secondary btn" href="new_study.do?currPage=${param.currPage}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}
									&allStudy=${param.allStudy}"  role="button" style="margin-left: 180px;">목록으로</a> 
			<!--알람: id,subject, category, content  -->
			<a class="btn btn-secondary btn" href="ns_accept.do?sNum=${param.sNum}&currPage=${param.currPage}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}
									&allStudy=${param.allStudy}
				&id=${requestScope.id }&studyName=${requestScope.studyName }" role="button" style="margin-left: 10px;">수락</a> 
			<a class="btn btn-secondary btn" href="study_reject.do?sNum=${param.sNum}&currPage=${param.currPage}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}
									&allStudy=${param.allStudy}&id=${requestScope.id }&studyName=${requestScope.studyName }" role="button" style="margin-left: 10px;">거절</a>
		</div>
	</div>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>

</body>
</html>