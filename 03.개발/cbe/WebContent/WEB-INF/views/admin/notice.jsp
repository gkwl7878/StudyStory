<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 - 공지사항</title>

<!-- Bootstrap core CSS -->
<link href="/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="/third_prj/resources/css/font.css" />
<style type="text/css">
#mouseOver:hover {
	color: #3498db
}
</style>
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.bundle.min.js"></script>
<script src="/third_prj/resources/js/feather.min.js"></script>
<script type="text/javascript">
$(function() {
	<c:if test="${ !loginSession }">
	location.replace("login.do");
	</c:if>
	
	<c:if test="${ nDeleteFlag }">
	alert("공지사항 글이 삭제되었습니다.")
	</c:if>
	
	<c:if test="${ nInsertFlag }">
	alert("공지사항 글이 등록되었습니다.")
	</c:if>
	
	$("#search").click(function() {
		$("#searchFrm").submit();
	})
});//ready	
	
</script>
</head>

<body>
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->
	
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
	</c:import>

	<div class="container-fluid">

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<form action="notice_mng.do?searchWord=${searchWord}" method="get" id="searchFrm">
			<div class="row justify-content-between" style="margin-top: 40px; margin-bottom: 10px;">
				<div class="col-8">
					<h1 class="h2">공지사항</h1>
				</div>
				<div class="col-2 text-right" style="padding-left: 2px; padding-right: 15px; padding-top: 20px;">
					<strong>제목</strong>
				</div>
				<div class="col-1" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<input type="text" name="searchWord" class="form-control form-control-sm" />
				</div>
				<div class="col-1" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<button type="button" id="search" class="btn btn-sm btn-secondary" style="width: 70px">검색</button>
				</div>
			</div>
			</form>

			<div class="table">
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
						<c:if test="${empty nList}">
							<td colspan="4" align="center">
                                 	 조회결과가 없습니다.
                     		</td>
						</c:if>
						<c:forEach var="nList" items="${nList }">
						<c:set var="i" value="${i+1 }"/>
							<tr id="mouseOver" onclick="location.href='notice_detail.do?currPage=${currPage}&nNum=${nList.nNum}&searchWord=${searchWord}'" style="cursor:pointer; " >
								<td class="text-center"><c:out value="${(totalCount-(currPage-1)*pageScale-i)+1}"/></td>
								<td class="text-center"><c:out value="${nList.subject }"/></td>
								<td class="text-center"><c:out value="${nList.inputDate }"/></td>
								<td class="text-center"><c:out value="${nList.viewCnt}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row">
					<div class="col-11"></div>
					<div class="col-1" >
					<a class="btn btn-sm btn-secondary" href="write_notice_page.do?currPage=${currPage}&searchWord=${param.searchWord}
									" role="button" style="margin-left: 10px;">글쓰기</a>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="paginate_button page-item previous ${ forwardFlag ? '' : 'disabled' }" id="dataTable_previous">
							<a href="notice_mng.do?currPage=${ startPage-1 }&searchWord=${param.searchWord}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
						</li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
							<li class="paginate_button page-item ${ currPage == i ? 'active' : '' }">
								<a href="notice_mng.do?currPage=${ i }&searchWord=${param.searchWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
									<c:out value="${ i }"/>
								</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item next ${ backwardFlag ? '' : 'disabled' }" id="dataTable_next">
							<a href="notice_mng.do?currPage=${ endPage+1 }&searchWord=${param.searchWord}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
						</li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>
