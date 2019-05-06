<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 - 회원정보 관리</title>

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
		
		<c:if test="${removeFlag }">
			alert("${param.id}님이 탈퇴처리 되었습니다");
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
	</c:import>
	<!-- sidebar 끝 -->

	<div class="container-fluid">
		<div class="row">

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<form action="user_mng.do?searchCondition=${param.condition}&searchWord=${param.word}">
			<div class="row justify-content-between" style="margin-top: 40px; margin-bottom: 10px;">
				<div class="col-8">
					<h1 class="h2">회원정보 관리</h1>
				</div>
				<div class="col-2" style="padding-left: 2px; padding-right: 2px; padding-top: 15px;">
					<select class="form-control" name="searchCondition" style="font-size: 12px;">
						<option ${param.searchCondition eq  ""?"selected='selected'":"" } value="--검색조건--">--검색조건--</option>
						<option ${param.searchCondition eq  "아이디"?"selected='selected'":"" } value="아이디">아이디</option>
						<option ${param.searchCondition eq  "이름"?"selected='selected'":"" } value="이름">이름</option>
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
							<th width="50">이름</th>
							<th width="100">연락처</th>
							<th width="100">이메일</th>
							<th width="100">가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty uList}">
							<td colspan="7" align="center">
                                  조회결과가 없습니다.
                     		</td>
						</c:if>
						<c:forEach var="uList" items="${uList }">
						<c:set var="i" value="${i+1 }"/>
							<tr>
								<td class="text-center"><c:out value="${(totalCount-(currPage-1)*pageScale-i)+1}"/></td>
								<td class="text-center"><a href="user_detail.do?currPage=${currPage}&id=${uList.id}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}&allStudy=${param.allStudy}
									&searchCondition=${searchCondition}&searchWord=${searchWord}" style="color: black"
									><c:out value="${uList.id }"/></a></td>
								<td class="text-center"><a href="user_detail.do?currPage=${currPage}&id=${uList.id}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}&allStudy=${param.allStudy}
									&searchCondition=${searchCondition}&searchWord=${searchWord}" style="color: black"
									><c:out value="${uList.nick }"/></a></td>
								<td class="text-center"><a href="user_detail.do?currPage=${currPage}&id=${uList.id}&weekUser=${param.weekUser}
									&weekStudy=${param.weekStudy}&allUser=${param.allUser}&allStudy=${param.allStudy}
									&searchCondition=${searchCondition}&searchWord=${searchWord}" style="color: black"
									><c:out value="${uList.name}"/></a></td>
								<td class="text-center"><c:out value="${uList.tel }"/></td>
								<td class="text-center"><c:out value="${uList.email }"/></td>
								<td class="text-center"><c:out value="${uList.regDate }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="paginate_button page-item previous ${ forwardFlag ? '' : 'disabled' }" id="dataTable_previous">
							<a href="user_mng.do?currPage=${ startPage-1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
						</li>
						<c:forEach var="i" step="1" begin="${ startPage }" end="${ endPage }">
							<li class="paginate_button page-item ${ currPage == i ? 'active' : '' }">
								<a href="user_mng.do?currPage=${ i }&searchCondition=${searchCondition}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
									<c:out value="${ i }"/>
								</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item next ${ backwardFlag ? '' : 'disabled' }" id="dataTable_next">
							<a href="user_mng.do?currPage=${ endPage+1 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
						</li>
					</ul>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>
