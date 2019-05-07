<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 - 문의사항</title>

<!-- Bootstrap core CSS -->
<link href="/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/third_prj/resources/css/font.css" />
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
	
	<c:if test="${ qDeleteFlag }">
		alert("문의사항글이 삭제되었습니다.")
	</c:if>
	
	$("#search").change(function() {
		$("#searchFrm").submit();
	})
	
});//ready	
</script>
</head>

<body>
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"/>
	<!-- navbar 끝 -->
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp"/>
	
	<div class="container-fluid">
		<div class="row">

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<form action="question_mng.do?searchCondition=${searchCondition}" method="get" id="searchFrm">
			<div class="row justify-content-between" style="margin-top: 40px; margin-bottom: 10px;">
				<div class="col-10">
					<h1 class="h2">문의사항</h1>
				</div>
				<div class="col-2 justify-content-right" style="padding-top: 15px;">
					<select class="form-control" name="searchCondition" id="search" style="font-size: 12px;">
						<option ${param.searchCondition eq  ""?"selected='selected'":"" }>--분류--</option>
						<option ${param.searchCondition eq  "회원정보"?"selected='selected'":"" }>회원정보</option>
						<option ${param.searchCondition eq  "스터디"?"selected='selected'":"" }>스터디</option>
						<option ${param.searchCondition eq  "홈페이지"?"selected='selected'":"" }>홈페이지</option>
						<option ${param.searchCondition eq  "기타"?"selected='selected'":"" }>기타</option>
					</select>
				</div>
			</div>
			</form>

			<div class="table-responsive">
				<table class="table table-striped table-sm border-bottom">
					<thead>
						<tr class="text-center">
							<th width="100">번호</th>
							<th width="100">문의자</th>
							<th width="100">분류</th>
							<th width="400">제목</th>
							<th width="100">답변여부</th>
							<th width="100">등록일</th>
						</tr>
					</thead>
					<tbody>
					
						<c:if test="${empty qList}">
							<td colspan="6" align="center">
                                 	 조회결과가 없습니다.
                     		</td>
						</c:if>
						<c:forEach var="qList" items="${qList }">
						<c:set var="i" value="${i+1 }"/>
							<tr>
								<!--qNum, name, category, subject, answerFlag, inputDate -->
								<td class="text-center"><c:out value="${(totalCount-(currPage-1)*pageScale-i)+1}"/></td>
								<td class="text-center"><c:out value="${qList.name }"/></td>
								<td class="text-center"><c:out value="${qList.category}"/></td>
								<td class="text-center"><a href="answer.do?currPage=${currPage}&qNum=${qList.qNum}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}&allStudy=${param.allStudy}
									&searchCondition=${searchCondition}&searchWord=${searchWord}&answerFlag=${qList.answerFlag}" style="color: black"
									><c:out value="${qList.subject }"/></a></td>
								<td class="text-center">${qList.answerFlag eq "N"?"<div style='color: #e74c3c'>답변예정</div>":"<div style='color: #3498db'>답변완료</div>" }</td>
								<td class="text-center"><c:out value="${qList.inputDate }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="paginate_button page-item previous ${ forwardFlag ? '' : 'disabled' }" id="dataTable_previous">
							<a href="question_mng.do?currPage=${ startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
						</li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
							<li class="paginate_button page-item ${ currPage == i ? 'active' : '' }">
								<a href="question_mng.do?currPage=${ i }&searchCondition=${searchCondition}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
									<c:out value="${ i }"/>
								</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item next ${ backwardFlag ? '' : 'disabled' }" id="dataTable_next">
							<a href="question_mng.do?currPage=${ endPage+1 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
						</li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>
