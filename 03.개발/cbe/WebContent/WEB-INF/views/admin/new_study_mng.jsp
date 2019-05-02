<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 - 새 스터디 관리</title>

<!-- Bootstrap core CSS -->
<link href="/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/third_prj/resources/css/font.css" />
<!-- Custom styles for this template -->
<link href="/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="/third_prj/resources/js/feather.min.js"></script>
<script src="/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/third_prj/resources/js/admin_dashboard.js"></script>
<script type="text/javascript">
	$(function() {
		
		<c:if test="${ !loginSession }">
			location.replace("login.do");
		</c:if>
		
		<c:if test="${ acceptFlag }">
			alert("정상적으로 수락처리 되었습니다");
		</c:if>
		
		<c:if test="${ rejectFlag }">
			alert("정상적으로 거절처리 되었습니다");
		</c:if>
		
	});//ready
</script>
</head>
<body>

	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->
	
	<div class="container-fluid">
		<div class="row">

			<!-- sidebar 시작 -->
			<c:if test="${empty param.weekUser}">
			<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
				<c:param name="weekUser" value="${requestScope.weekUser}"></c:param>
				<c:param name="weekStudy" value="${requestScope.weekStudy}"></c:param>
				<c:param name="allUser" value="${requestScope.allUser}"></c:param>
				<c:param name="allStudy" value="${requestScope.allStudy}"></c:param>
				<c:param name="activeFlag" value="${requestScope.activeFlag}"></c:param>
			</c:import>
			</c:if>
			
			<c:if test="${not empty param.weekUser}">
			<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
				<c:param name="weekUser" value="${param.weekUser}"></c:param>
				<c:param name="weekStudy" value="${param.weekStudy}"></c:param>
				<c:param name="allUser" value="${param.allUser}"></c:param>
				<c:param name="allStudy" value="${param.allStudy}"></c:param>
				<c:param name="activeFlag" value="${requestScope.activeFlag}"></c:param>
			</c:import>
			</c:if>
			
			<!-- sidebar 끝 -->

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<div class="row justify-content-between" style="margin-top: 40px; margin-bottom: 10px;">
				<div class="col-12">
					<h1 class="h2">새 스터디 관리</h1>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table table-striped table-sm border-bottom">
					<thead>
						<tr class="text-center">
							<th width="50">번호</th>
							<th width="50">리더</th>
							<th width="320">스터디명</th>
							<th width="50">분류</th>
							<th width="50">지역</th>
							<th width="50">생성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nsList" items="${nsList }">
						<c:set var="i" value="${i+1 }"/>
							<tr>
								<td class="text-center"><c:out value="${(totalCount-(currPage-1)*pageScale-i)+1}"/></td>
								<td class="text-center"><c:out value="${nsList.id }"/></td>
								<c:if test="${empty param.weekUser}">
								<td><a href="ns_detail.do?currPage=${currPage}&sNum=${nsList.sNum}&weekUser=${requestScope.weekUser}
									&weekStudy=${requestScope.weekStudy}&allUser=${requestScope.allUser}
									&allStudy=${requestScope.allStudy}&activeFlag=${requestScope.activeFlag}" style="color: black">
									<c:out value="${nsList.studyName}"/></a></td>
								</c:if>
								<c:if test="${not empty param.weekUser}">
								<td><a href="ns_detail.do?currPage=${currPage}&sNum=${nsList.sNum}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}&activeFlag=${requestScope.activeFlag}
									&allStudy=${param.allStudy}" style="color: black"><c:out value="${nsList.studyName}"/></a></td>
								</c:if>
								<td class="text-center"><c:out value="${nsList.category }"/></td>
								<td class="text-center"><c:out value="${nsList.loc }"/></td>
								<td class="text-center"><c:out value="${nsList.inputDate }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<div class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="paginate_button page-item previous ${ forwardFlag ? '' : 'disabled' }" id="dataTable_previous">
							<a href="new_study.do?currPage=${ startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
						</li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
							<li class="paginate_button page-item ${ currPage == i ? 'active' : '' }">
								<a href="new_study.do?currPage=${ i }" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
									<c:out value="${ i }"/>
								</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item next ${ backwardFlag ? '' : 'disabled' }" id="dataTable_next">
							<a href="new_study.do?currPage=${ endPage+1 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
						</li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>
