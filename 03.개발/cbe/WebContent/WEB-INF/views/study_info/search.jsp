<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 폰트 CSS -->
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css" />
<!-- Custom styles for this template -->
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
<link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>

<title>Bootstrap Template By Young</title>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<!-- CDN -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		// 찾기 버튼 눌렀을 때.
		$("#search_btn").click(function() {
			alert("aaaaaa");
			$("#search_frm").submit();
		});//click

		// 정렬이 바뛰었을 때.
		$("#order_select").change(function() {
			alert("bbbbbb");
			$("#search_frm").submit();
		});//change
		
		// 검색어 초기화.
		$("#word_search_reset_btn").click(function() {
			location.href = "../search/search.do";
		}); // click

	}); // ready
</script>

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<!-- body -->
	<div role="main" style="min-height: 900px">

		<!-- 점보트론 : 전광판 -->
		<section class="text-center bg-white mb-0" style="margin-top: 30px; margin-bottom: 20px;">
			<div class="container">
				<h1 class="jumbotron-heading">스터디 찾기</h1>
			</div>
		</section>
		<div style="height: 20px;"></div>
		<!-- 점보트론 : 전광판 -->

		<!-- CONTAINER DIV -->
		<div class="container-fluid">
			<!-- row -->
			<div class="row justify-content-center">
				<div class="col-auto" style="width: 1000px;">

					<c:if test="${ not empty inputWord }">
						<div class="row" style="height: 3em;">
							<div class="row px-2 mx-3 w-100 border-top align-items-center">
								<div class="mr-auto">
									검색어 : <c:out value="${ inputWord }"/>
								</div>
								<input id="word_search_reset_btn" type="button" class="btn btn-sm btn-secondary ml-1" value="초기화"/>
							</div>
						</div>
					</c:if>
					<!-- 정렬바 row -->
					<div class="row mb-3" style="height: 4em;">
						<div class="row mx-3 w-100 border-top border-bottom align-items-center">
							<!-- 필터검색 폼 -->
							<form id="search_frm" class="form-row w-100" action="../search/search.do" method="get">
								<div class="col-auto mr-auto">
									<select id="order_select" name="order_select" class="form-control-sm">
										<option value="최신순"${param.order_select eq '최신순'?"selected='selected'":""}>최신순</option>
										<option value="인기순"${param.order_select eq '인기순'?"selected='selected'":""}>인기순</option>
									</select>
								</div>

								<div class="col-auto">
									<select id="loc_select" name="loc_select" class="form-control-sm">
										<option value="none">지 역</option>
										<option value="신촌"${param.loc_select eq '신촌'?"selected='selected'":""}>신 촌</option>
										<option value="홍대"${param.loc_select eq '홍대'?"selected='selected'":""}>홍 대</option>
										<option value="종각"${param.loc_select eq '종각'?"selected='selected'":""}>종 각</option>
										<option value="건대"${param.loc_select eq '건대'?"selected='selected'":""}>건 대</option>
										<option value="노원"${param.loc_select eq '노원'?"selected='selected'":""}>노 원</option>
										<option value="강남"${param.loc_select eq '강남'?"selected='selected'":""}>강 남</option>
									</select>
								</div>

								<div class="col-auto">
									<select id="kind_select" name="kind_select" class="form-control-sm">
										<option value="none">종 류</option>
										<option value="언어"${param.kind_select eq '언어'?"selected='selected'":""}>언 어</option>
										<option value="취업"${param.kind_select eq '취업'?"selected='selected'":""}>취 업</option>
										<option value="취미"${param.kind_select eq '취미'?"selected='selected'":""}>취 미</option>
										<option value="기타"${param.kind_select eq '기타'?"selected='selected'":""}>기 타</option>
									</select>
								</div>
								<c:if test="${ not empty inputWord }">
									<input type="hidden" name="search_inputBox" value="${ inputWord }"/>
								</c:if>
								<input id="search_btn" type="button" class="btn btn-sm btn-secondary ml-1" value="찾기" />
							</form>
							<!-- 필터검색 폼 -->
						</div>
					</div>
					<!-- 정렬바 row -->

					<!-- 썸네일 row -->
					<div class="row">

						<c:if test="${ empty thumbnail_list }">
							조회할 수 있는 썸네일이 없습니다.
						</c:if>

						<!-- 썸네일 시작 - 썸네일은 한 줄에 3개씩 채워진다. -->
						<c:forEach var="thumbnail" items="${ thumbnail_list }">
							<div class="col-md-4">
								<div class="card mb-4 shadow-sm">
									<!-- 썸네일 클릭시 상세 페이지로 이동하는 a 태그. - 나중에 div노드로 변경하기. -->
									<a href="../detail/detail_study.do?sNum=${ thumbnail.s_num }"> <!-- 썸네일 스터디 이미지 --> <img class="card-img-top"
										src="/third_prj/study_img/${ thumbnail.img }" style="height: 200px;" />
										<div class="card-body text-center p-3">
											<div class="d-flex justify-content-end align-items-center mb-3">
												<div class="mr-5">
													<!-- 썸네일 들록일 -->
													<small class="text-muted">${ thumbnail.input_date }</small>
												</div>
												<!-- 썸네일 모집상태 - 진행중. -->
												<small class="pr-1">모집상태</small>
											</div>
											<div class="px-3 border-bottom">
												<p class="card-text pb-3">
													<!-- 썸네일 제목부분 -->
													<strong>${ thumbnail.study_name }</strong>
												</p>
											</div>
											<div class="d-flex justify-content-between align-items-center mt-3 px-2">

												<div class="border border-light rounded-circle" style="width: 45px; height: 45px;">
													<!-- 썸네일 리더의 이미지 -->
													<img src="/third_prj/profile_img/${ thumbnail.user_img }" class="card-img-top w-100 rounded-circle" style="width: 40px; height: 50px;">
												</div>

												<div class="border-right p-2">
													<!-- 썸네일 리더의 닉네임 - 3자 이상 일 때 ... 으로 표시. -->
													<small>${ thumbnail.nick }</small>
												</div>

												<div class="border-right p-2">
													<!-- 썸네일 리더의 닉네임 -->
													<small>${ thumbnail.loc }</small>
												</div>

												<div class="p-2">
													<!-- 썸네일 리더의 닉네임 -->
													<small>${ thumbnail.category }</small>
												</div>

												<!-- 토글버튼 : 좋아요를 누르면  .active를 주세요. -->
												<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="button">좋아요</button>
											</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
						<!-- 썸네일 시작 - 썸네일은 한 줄에 3개씩 채워진다. -->
					</div>
					<!-- 썸네일 row -->
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- CONTAINER DIV -->


		<!-- 페이지네이션 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<!-- 이전 페이지 -->
				<li class="page-item">
					<a class="page-link" href="${ responseURL }&currentPage=${currentPage - 1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<!-- 이전 페이지 -->

				<!-- 페이지 번호 -->
				<c:forEach begin="1" end="${ totalPage }">
					<c:set var="i" value="${ i + 1 }" />
							<li class="page-item">
								<a class="page-link" href="${ responseURL }&currentPage=${i}">
									<c:out value="${ i }" />
								</a>
							</li>
				</c:forEach>
				<!-- 페이지 번호 -->

				<!-- 다음 페이지 -->
				<li class="page-item">
					<a class="page-link" href="${ responseURL }&currentPage=${currentPage + 1}" aria-label="Previous">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
				<!-- 다음 페이지 -->
			</ul>
		</nav>
		<!-- 페이지네이션 -->

	</div>
	<!-- DIV ROLE MAIN -->

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

</body>
</html>