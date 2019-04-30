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

		$("#order_select").change(function() {

			//<option>정렬</option>
			//<option>최신순</option>
			//<option>인기순</option>

			var order_select = $("#order_select").val();
			
			$.ajax({
				url : "../search/search_order_process.do",
				data :"order=" + order_select,
				type : "get",
				dataType : "JSON", // 응답 받을 데이터.
				error : function(xhr) {
					alert("오류발생" + xhr.status + " / " + xhr.statusText);
					console.log(xhr.status + " / " + xhr.statusText);
				},
				success : function(json) {
					if (json.result) {
						alert("정상동작");
						alert(json);
					}// end if
				}// success
			}); // ajax
			
		});//change

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

					<!-- 정렬바 row -->
					<div class="row mb-3" style="height: 4em;">
						<div class="row mx-3 w-100 border-top border-bottom align-items-center">
							
							<!-- 필터검색 폼 -->
							<form class="form-row w-100" action="../search/search_process.do" method="get">
								<div class="col-auto mr-auto">
									<select id="order_select" class="form-control-sm">
										<option value="정렬">정렬</option>
										<option value="최신순">최신순</option>
										<option value="인기순">인기순</option>
									</select>
								</div>
								<div class="col-auto">
									<select id="loc_select" class="form-control-sm">
										<option>지 역</option>
										<option>신 촌</option>
										<option>홍 대</option>
										<option>종 각</option>
										<option>건 대</option>
										<option>노 원</option>
										<option>강 남</option>
									</select>
								</div>
								<div class="col-auto">
									<select id="kind_select" class="form-control-sm">
										<option>종 류</option>
										<option>언 어</option>
										<option>취 업</option>
										<option>취 미</option>
										<option>기 타</option>
									</select>
								</div>
								<input id="search_btn" type="button" class="btn btn-sm btn-secondary ml-1" value="필터 검색" />
							</form>
							<!-- 필터검색 폼 -->

						</div>
					</div>
					<!-- 정렬바 row -->

					<!-- 썸네일 row -->
					<div class="row">
						<!-- 썸네일 시작 - 썸네일은 한 줄에 3개씩 채워진다. -->
						<c:forEach var="thumbnail" items="${ thumbnail_list }">

							<div class="col-md-4">
								<div class="card mb-4 shadow-sm">

									<!-- 썸네일 클릭시 상세 페이지로 이동하는 a 태그. - 나중에 div노드로 변경하기. -->
									<a href="../detail/detail_study.do?sNum=${ thumbnail.sNum }"> <!-- 썸네일 스터디 이미지 --> <img class="card-img-top" src="http://localhost:8080/third_prj/resources/images/${ thumbnail.img }">
										<div class="card-body text-center p-3">
											<div class="d-flex justify-content-end align-items-center mb-3">
												<div class="mr-5">
													<!-- 썸네일 들록일 -->
													<small class="text-muted">${ thumbnail.inputDate }</small>
												</div>
												<!-- 썸네일 모집상태 - 진행중. -->
												<small class="pr-1">모집상태</small>
											</div>
											<div class="px-3 border-bottom">
												<p class="card-text pb-3">
													<!-- 썸네일 제목부분 -->
													<strong>${ thumbnail.studyName }</strong>
												</p>
											</div>
											<div class="d-flex justify-content-between align-items-center mt-3 px-2">

												<div class="border border-light rounded-circle" style="width: 45px; height: 45px;">
													<!-- 썸네일 리더의 이미지 -->
													<img src="http://localhost:8080/third_prj/resources/images/${ thumbnail.userImg }" class="card-img-top w-100 rounded-circle">
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
												<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="button" aria-pressed="false" autocomplete="off">좋아요</button>
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
				<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<!-- 페이지 번호 -->
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<!-- 페이지 번호 -->

				<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
		<!-- 페이지네이션 -->

	</div>
	<!-- DIV ROLE MAIN -->

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

</body>
</html>