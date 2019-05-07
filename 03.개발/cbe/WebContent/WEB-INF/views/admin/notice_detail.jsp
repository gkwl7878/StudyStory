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
</style>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">

<title>세부 공지사항</title>
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
			height : 300,
			lang : 'ko-KR'
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ !loginSession }">
		location.replace("login.do");
		</c:if>
		$("#modifyBtn").click(function() {
			$("#noticeDetailFrm").submit();
		})
	});
	<c:if test="${nModifyFlag }">
	alert("스터디 정보가 수정 되었습니다");
	</c:if>
	
</script>
</head>
<body>

	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->
	
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
	</c:import>

	<form id="noticeDetailFrm" action="update_notice.do" method="get">
	<input type="hidden" name="nNum" value="${param.nNum }">  
	<input type="hidden" name="currPage" value="${param.currPage}">  
		<div class="container form-group" id="wrap">
			<div class="row">
				<div class="col-12 justify-content-left" style="margin-bottom: 20px;">
					<label style="font-size: 40px;"><strong>세부 공지사항</strong></label> <img alt="" src="resources/images/notice.png" style="width: 100px; height: 100px; margin-left: 15px; margin-bottom: 30px;">
				</div>
			</div>

			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<input type="text" name="subject" size="46"  style="font-size: 25px;" value="${subject }" />
					<%-- <label style="font-size: 25px;">${subject }</label> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 50px;">등록일</label> 
					<label style="width: 200px; margin-left: 30px;">${inputDate}</label> 
					<label style="width: 50px; margin-left: 20px;">조회수</label> 
					<label style="width: 100px; margin-left: 30px;">${viewCnt }</label>
				</div>

			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<textarea name="content" class="content" id="summernote" ><c:out value="${content }" escapeXml="false"/></textarea>
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="notice_mng.do?currPage=${param.currPage}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}
									&allStudy=${param.allStudy}&searchWord=${param.searchWord}" role="button" style="margin-left: 250px;">목록으로</a> 
			<input type="button" class="btn btn-secondary btn" value="수정" id="modifyBtn" style="margin-left: 10px;" />
			<a class="btn btn-secondary btn" href="del_notice.do?nNum=${param.nNum}&currPage=${param.currPage}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}
									&allStudy=${param.allStudy}&searchWord=${param.searchWord}" role="button" style="margin-left: 10px;">삭제</a>
			</div>
		</div>
	</form>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>

</body>
</html>