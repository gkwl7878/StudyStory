<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>공지사항</title>
	
	<!-- Bootstrap core CSS -->
	<link href="/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="table-responsive col-6" style="margin-top: 90px; margin-bottom:50px;">
				<!-- 점보트론 : 전광판 -->
				<section class="text-center bg-white mb-0" style="margin-top: 30px; margin-bottom: 20px;">
					<div class="container">
						<h1 class="jumbotron-heading">공지사항</h1>
					</div>
				</section>
				<div style="height: 20px;"></div>
				<!-- 점보트론 : 전광판 -->
				
				<div class="row">
					<div class="col-8"></div>
					<div class="col-4 text-right">
						<strong>제목</strong>
						<input type="text" class="form-control-sm" style="width:90px;"/>
						<button type="button" class="btn btn-sm btn-secondary">검색</button>
					</div>	
				</div>

				<table class="table table-striped table-sm border-bottom" style="margin-top:10px;">
					<thead>
						<tr class="text-center">
							<th style="width: 100px">번호</th>
							<th style="width: 500px">제목</th>
							<th style="width: 100px">등록일</th>
							<th style="width: 100px">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty noticeList }">
							<tr class="text-center">
								<td colspan="5">조회된 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="notice" items="${ noticeList }">
							<tr class="text-center" onclick="location.href='detail_notice.do?n_num=${ notice.n_num }&currPage=${ currPage }'">
								<c:set var="i" value="${ i+1 }"/>
								<td><c:out value="${ (totalCnt-(currPage-1)*pageScale-i)+1 }"/></td>
								<td class="text-left"><c:out value="${ notice.subject }"/></td>
								<td><c:out value="${ notice.input_date }"/></td>
								<td><c:out value="${ notice.view_cnt }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-center" style="margin-top:30px;">
					<ul class="pagination">
						<li class="paginate_button page-item previous ${ forwardFlag ? '' : 'disabled' }" id="dataTable_previous">
							<a href="notice.do?currPage=${ startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
						</li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
							<li class="paginate_button page-item ${ currPage == i ? 'active' : '' }">
								<a href="notice.do?currPage=${ i }" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
									<c:out value="${ i }"/>
								</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item next ${ backwardFlag ? '' : 'disabled' }" id="dataTable_next">
							<a href="notice.do?currPage=${ endPage+1 }"  aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
						</li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
	
		<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>
