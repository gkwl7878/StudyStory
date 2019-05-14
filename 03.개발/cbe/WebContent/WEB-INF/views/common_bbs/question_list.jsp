<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>내 문의내역</title>
	
	<!-- Bootstrap core CSS -->
	<link href="http://211.63.89.144/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="http://211.63.89.144/resources/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		$(function() {
			<c:if test="${ askSuccessFlag }">
				alert("새로운 문의가 정상적으로 등록되었습니다");
			</c:if>
		});
	</script>
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
						<h1 class="jumbotron-heading">내 문의내역</h1>
					</div>
				</section>
				<div style="height: 20px;"></div>
				<!-- 점보트론 : 전광판 -->

				<table class="table table-striped table-sm border-bottom">
					<thead>
						<tr class="text-center">
							<th style="width: 100px">번호</th>
							<th style="width: 150px">분류</th>
							<th style="width: 500px">제목</th>
							<th style="width: 100px">답변여부</th>
							<th style="width: 120px">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty questionList }">
							<tr class="text-center">
								<td colspan="5">조회된 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="question" items="${ questionList }">
							<tr class="text-center" onclick="location.href='detail_question.do?q_num=${ question.q_num }&currPage=${ currPage }'">
								<c:set var="i" value="${ i+1 }"/>
								<td><c:out value="${ (totalCnt-(currPage-1)*pageScale-i)+1 }"/></td>
								<td>[<c:out value="${ question.category }"/>]</td>
								<td class="text-left"><c:out value="${ question.subject }"/></td>
								<td>${ question.answer_flag eq 'N' ? '미답변' : '답변완료' }</td>
								<td><c:out value="${ question.input_date }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-center" style="margin-top:30px;">
					<ul class="pagination">
						<li class="paginate_button page-item previous ${ forwardFlag ? '' : 'disabled' }" id="dataTable_previous">
							<a href="question.do?currPage=${ startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
						</li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
							<li class="paginate_button page-item ${ currPage == i ? 'active' : '' }">
								<a href="question.do?currPage=${ i }" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
									<c:out value="${ i }"/>
								</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item next ${ backwardFlag ? '' : 'disabled' }" id="dataTable_next">
							<a href="question.do?currPage=${ endPage+1 }"  aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
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
