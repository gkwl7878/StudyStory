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
	st
}

.font17bold {
	font-size: 17px;
	font-weight: bold;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">

<title>문의 답변하기</title>
<!-- Custom styles for this template -->
<link href="/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/third_prj/resources/js/admin_dashboard.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>


<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			placeholder : '공지사항입니다  :)',
			tabsize : 2,
			height : 200,
			lang : 'ko-KR'
		});
	});
	
	$(function () {
		<c:if test="${ !loginSession }">
		location.replace("login.do");
		</c:if>
		<c:if test="${ qModifyFlag }">
			alert("답변이 등록되었습니다.");
		</c:if>
		
	});
	function delete_confirm(){
		return confirm("정말 이 문의사항을 삭제하시겠습니까?");
	}
</script>

</head>
<body>
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->
	
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
			<c:param name="weekUser" value="${param.weekUser}"></c:param>
			<c:param name="weekStudy" value="${param.weekStudy}"></c:param>
			<c:param name="allUser" value="${param.allUser}"></c:param>
			<c:param name="allStudy" value="${param.allStudy}"></c:param>
			<c:param name="activeFlag" value="${param.activeFlag}"></c:param>
	</c:import>

	<form action="create_request.jsp" name="createFrm">
		<div class="container form-group" id="wrap">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-9 justify-content-left" style="margin-bottom: 20px; margin-top: 20px;">
					<label style="font-size: 40px;"><strong>문의 답변하기</strong></label> <img alt="" src="resources/images/qa.png" style="width: 130px; height: 100px; margin-left: 0px;">
				</div>
			</div>
			<div class=" row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 50px;" class="font17bold"><strong>번호</strong> : </label> <label style="width: 200px;">${qNum}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>글쓴이</strong> : </label> <label>${name }</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>분류명</strong> : </label> <label>${category}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>등록시간</strong> : </label> <label>${inputDate} </label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>제목</strong> : </label> <label>${subject}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>문의내용</strong> : </label>
					<div class=" rounded-sm text-dark " style="min-height: 300px; margin-top: 10px; background-color:#E9ECEF; border: 1px solid #CED4DA; font-size: 17px; padding: 10px">
						<c:out value="${content}" escapeXml="false"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>답변 시간</strong> : </label> <label>${answerDate}</label>
				</div>
			</div>

			<div class=" row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<%-- <textarea class=" form-control" rows="3" style="resize: none; width: 580px; min-height: 380px;" name="answerContent" readonly="readonly">
					<c:out value="${answerContent}" escapeXml="false"/>
					</textarea> --%>
					<label class="font17bold"><strong>답변</strong> : </label>
					<div class=" rounded-sm text-dark " style="min-height: 300px; margin-top: 10px; background-color:#E9ECEF; border: 1px solid #CED4DA; font-size: 17px; padding: 10px">
					<c:out value="${answerContent}" escapeXml="false" />
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="question_mng.do?currPage=${param.currPage}&searchCondition=${param.searchCondition }" role="button" style="margin-left: 400px;">돌아가기</a> 
				<a class="btn btn-secondary btn " onclick="return delete_confirm();" href="del_question.do?currPage=${param.currPage}&searchCondition=${param.searchCondition}&qNum=${qNum}" role="button" style="margin-left: 10px;">삭제</a>
			</div>
		</div>
	</form>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>