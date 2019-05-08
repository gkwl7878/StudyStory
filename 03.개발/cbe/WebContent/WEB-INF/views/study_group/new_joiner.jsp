<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>스터디 신청자 보기</title>

<!-- Bootstrap core CSS -->
<link href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/Chart
.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script>
</body>
</head>
<body>

	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>


	<div class="container-fluid">
		<div class="row">

			<main role="main" class="col-md-9 col-lg-10 px-4" style="margin:0px auto;">
			
			<!-- 점보트론 : 전광판 -->
			<section class="text-center bg-white mb-0" style="margin-top: 30px; margin-bottom: 20px;">
				<div class="container">
					<h1 class="jumbotron-heading">내 스터디</h1>
				</div>
			</section>
			<div style="height: 20px;"></div>
			<!-- 점보트론 : 전광판 -->

			<div class="table-responsive">
				<table class="table table-striped table-sm border-bottom">
					<thead>
						<tr class="text-center">
							<th style="width: 50px">번호</th>
							<th style="width: 100px">닉네임</th>
							<th style="width: 500px">지원동기</th>
							<th style="width: 100px">수락여부</th>
							<th style="width: 100px">신청일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty jb }">
						<tr class="text-center">	
							<td colspan="5">신청자가 없습니다.</td>
						</tr>
						</c:if> }
					
					<c:forEach var="jbList" items="${jb }">
							<tr class="text-center" onclick="location.href='req_detail.do?id=${jbList.id}&s_num=${s_num }'"><!--  보완-->
								<c:set var="i" value="${ i+1 }"/>
								<td><c:out value="${ (totalCnt-(currPage-1)*pageScale-i)+1 }"/></td>
								<td>
									<img src="/third_prj/profile_img/${jbList.img}" width="100" height="120" onerroalt="Card image cap" onerror="this.src='/third_prj/resources/images/not_find_image.png'" id="profile_img"/>
									<br />
								<div>
									<span class="text-center"><strong>${jbList.nick }</strong></span>
									</div>
								</td>
								<td class="text-left align-middle">${jbList.motive }</td>
								<td class="align-middle">${jbList.accept_flag=='N'?'대기':''}</td>
								<td class="align-middle">${jbList.input_date }</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="paginate_button page-item previous disabled" id="dataTable_previous ${ forwardFlag?'':'disabled' }"><a href="new_joiner.do?currPage=${ startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a></li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
						<li class="paginate_button page-item ${ currPage==i? 'active':''}">
							<a href="new_joiner.do?currPage=${ i }" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
								<c:out value="${ i }"/>
							</a></li>
						</c:forEach>
						<li class="paginate_button page-item next" id="dataTable_next ${ backwardFlag ?'':'disabled' }">
							<a href="new_joiner.do?currPage=${ endPage+1}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
						</li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>
