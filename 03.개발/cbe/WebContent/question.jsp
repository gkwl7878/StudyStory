<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>내 문의내역</title>

<!-- Bootstrap core CSS -->
<link href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script>
</body>
</head>
<body>

	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>

	<div class="container-fluid">
		<div class="row">

			<main role="main" class="col-md-9 col-lg-10 px-4" style="margin:0px auto;">
			
			<!-- 점보트론 : 전광판 -->
			<section class="text-center bg-white mb-0" style="margin-top: 30px; margin-bottom: 20px;">
				<div class="container">
					<h1 class="jumbotron-heading">내 문의내역</h1>
				</div>
			</section>
			<div style="height: 20px;"></div>
			<!-- 점보트론 : 전광판 -->

			<div class="table-responsive">
				<table class="table table-striped table-sm border-bottom">
					<thead>
						<tr class="text-center">
							<th style="width: 100px">번호</th>
							<th style="width: 150px">분류</th>
							<th style="width: 500px">제목</th>
							<th style="width: 150px">답변여부</th>
							<th style="width: 100px">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="10" step="1">
							<tr class="text-center">
								<td>123</td>
								<td>회원 관련</td>
								<td class="text-left">제목입니다 문의입니다 숑숑</td>
								<td>미답변</td>
								<td>2019-03-00</td>
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
