<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 - 새 스터디 관리</title>

<!-- Bootstrap core CSS -->
<link href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css" />
<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script>
<script type="text/javascript">
	$(function() {
		//location.href = "new_study.do";
	});
</script>
</head>
<body>

	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->
	
	<div class="container-fluid">
		<div class="row">

			<!-- sidebar 시작 -->
			<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
				<c:param name="weekUser" value="${requestScope.weekUser}"></c:param>
				<c:param name="weekStudy" value="${requestScope.weekStudy}"></c:param>
				<c:param name="allUser" value="${requestScope.allUser}"></c:param>
				<c:param name="allStudy" value="${requestScope.allStudy}"></c:param>
			</c:import>
			
			<%-- <c:import url="/WEB-INF/views/admin/layout/sidebar.jsp"></c:import> --%>
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
						<c:forEach begin="1" end="10" step="1">
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">아이디</td>
								<td>새로운 스터디명입니다</td>
								<td class="text-center">취업</td>
								<td class="text-center">강남</td>
								<td class="text-center">2019-03-00</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a></li>
						<li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a></li>
						<li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a></li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>
