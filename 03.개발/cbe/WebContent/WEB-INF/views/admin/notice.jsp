<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자</title>

<!-- Bootstrap core CSS -->
<link href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script>
</head>

<body>
	<!-- navbar 시작 -->
	<c:import url="http://localhost:8080/third_prj/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<div class="container-fluid">
		
			<!-- sidebar 시작 -->
			<c:import url="http://localhost:8080/third_prj/admin/layout/sidebar.jsp"></c:import>
			<!-- sidebar 끝 -->

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<div class="row justify-content-between" style="margin-top: 40px; margin-bottom: 10px;">
				<div class="col-8">
					<h1 class="h2">공지사항</h1>
				</div>
				<div class="col-2 text-right" style="padding-left: 2px; padding-right: 15px; padding-top: 20px;">
					<strong>제목</strong>
				</div>
				<div class="col-1" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<input type="text" class="form-control form-control-sm" />
				</div>
				<div class="col-1" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<button type="button" class="btn btn-sm btn-secondary" style="width: 70px">검색</button>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table table-striped table-sm border-bottom">
					<thead>
						<tr class="text-center">
							<th style="width: 100px">번호</th>
							<th style="width: 500px">제목</th>
							<th style="width: 200px">등록일</th>
							<th style="width: 100px">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="10" step="1">
							<tr class="text-center">
								<td>123</td>
								<td class="text-left">스터디명 블라블라블라</td>
								<td>2019-03-00</td>
								<td>000</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row">
					<div class="col-11"></div>
					<div class="col-1" ><button type="button" class="btn btn-sm btn-secondary" style="width: 70px;">글쓰기</button></div>
				</div>
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
