<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자</title>

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
		<c:if test="${ sDeleteFlag }">
		alert("정상적으로 삭제처리 되었습니다");
		</c:if>
	});//ready
</script>
</head>

<body>
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"></c:import>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp">
				<c:param name="weekUser" value="${param.weekUser}"></c:param>
				<c:param name="weekStudy" value="${param.weekStudy}"></c:param>
				<c:param name="allUser" value="${param.allUser}"></c:param>
				<c:param name="allStudy" value="${param.allStudy}"></c:param>
				<c:param name="activeFlag" value="${requestScope.activeFlag}"></c:param>
	</c:import>
	<!-- sidebar 끝 -->

	<div class="container-fluid">
		<div class="row">

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<form action="study_mng.do?searchCondition=${param.condition}&searchWord=${param.word}" method="get">
			<div class="row justify-content-between" style="margin-top: 40px; margin-bottom: 10px;">
				<div class="col-8">
					<h1 class="h2">스터디 정보 관리</h1>
				</div>
				<div class="col-2" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<select class="form-control" name="searchCondition" style="font-size: 12px;">
						<option ${param.searchCondition eq  ""?"selected='selected'":"" }>--검색조건--</option>
						<option ${param.searchCondition eq  "스터디명"?"selected='selected'":"" } value="스터디명">스터디명</option>
						<option ${param.searchCondition eq  "아이디"?"selected='selected'":"" } value="아이디">아이디</option>
						<option ${param.searchCondition eq  "닉네임"?"selected='selected'":"" } value="닉네임">닉네임</option>
					</select>
				</div>
				<div class="col-1" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<input type="text" name="searchWord" class="form-control form-control-sm" />
				</div>
				<div class="col-1" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<button type="submit" id="searchBtn" class="btn btn-sm btn-secondary">검색</button>
				</div>
			</div>
			</form>

			<div class="table-responsive">
				<table class="table table-striped table-sm border-bottom">
					<thead>
						<tr class="text-center">
							<th width="50">번호</th>
							<th width="50">아이디</th>
							<th width="50">닉네임</th>
							<th width="200">스터디명</th>
							<th width="50">분류</th>
							<th width="50">지역</th>
							<th width="100">생성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty sList}">
							<td colspan="7" align="center">
                                  조회결과가 없습니다.
                     		</td>
						</c:if>
						<c:forEach var="sList" items="${sList }">
						<c:set var="i" value="${i+1 }"/>
							<tr>
								<td class="text-center"><c:out value="${(totalCount-(currPage-1)*pageScale-i)+1}"/></td>
								<td class="text-center"><c:out value="${sList.id }"/></td>
								<td class="text-center"><c:out value="${sList.nick }"/></td>
								<td class="text-center"><a href="study_detail.do?currPage=${currPage}&sNum=${sList.sNum}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}&allStudy=${param.allStudy}
									&searchCondition=${searchCondition}&searchWord=${searchWord}" style="color: black"
									><c:out value="${sList.studyName}"/></a></td>
								<td class="text-center"><c:out value="${sList.category }"/></td>
								<td class="text-center"><c:out value="${sList.loc }"/></td>
								<td class="text-center"><c:out value="${sList.inputDate }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="paginate_button page-item previous ${ forwardFlag ? '' : 'disabled' }" id="dataTable_previous">
							<a href="study_mng.do?currPage=${ startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
						</li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
							<li class="paginate_button page-item ${ currPage == i ? 'active' : '' }">
								<a href="study_mng.do?currPage=${ i }&searchCondition=${searchCondition}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
									<c:out value="${ i }"/>
								</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item next ${ backwardFlag ? '' : 'disabled' }" id="dataTable_next">
							<a href="study_mng.do?currPage=${ endPage+1 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
						</li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>
