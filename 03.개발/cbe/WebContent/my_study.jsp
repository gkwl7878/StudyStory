<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">

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
<!-- Custom styles for this template -->
<link href="./Resources/css/jumbotron.css" rel="stylesheet">

</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>

	<!-- 페이지 타이틀 -->
	<div class="col-sm-1 col-md-12 p-4 bg-light mb-4 border-bottom">
		<p class="h3" style="text-align: center;">내 스터디</p>
	</div>

	<!-- body -->
	<main role="main">

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="card" style="width: 18rem;">
					<img src="http://localhost:8080/third_prj/Resources/images/no_img.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">사용자의 상태</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">프로필 관리</a>
					</div>
				</div>
			</div>

			<div class="col-md-9">
				<div class="container">
					<div class="border rounded w-auto p-2 bg-light mb-3">

						<div class="container">
							<div class="row">
								<div class="col-md-4">
									total
								</div>							
								<div class="col-md-8">
									<form class="" action="">
										<select id="locSelect">
											<option value="#">지 역</option>
										</select> <select id="sortSelect">
											<option value="#">분 류</option>
										</select> <input type="button" class="btn" value="적용">
									</form>
								</div>							
							</div>
						</div>
					</div>
				</div>

				<div class="container">
					<div class="row">
				    	<!-- 1번째 줄 시작 -->
						<div class="col-md-4">
				          <div class="card mb-4 shadow-sm">
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">이미지</text></svg>
				            <div class="card-body">
				              <p class="card-text">제목부분</p>
				              <p class="card-text">간략한 내용...(25자 이상 ...으로)</p>
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary">버튼1</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary">버튼2</button>
				                </div>
				                <small class="text-muted">날짜</small>
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="col-md-4">
				          <div class="card mb-4 shadow-sm">
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				            <div class="card-body">
				              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
				                </div>
				                <small class="text-muted">9 mins</small>
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="col-md-4">
				          <div class="card mb-4 shadow-sm">
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				            <div class="card-body">
				              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
				                </div>
				                <small class="text-muted">9 mins</small>
				              </div>
				            </div>
				          </div>
						</div>
						<!-- 1번째 줄 끝 -->
				    	<!-- 2번째 줄 시작 -->
						<div class="col-md-4">
				          <div class="card mb-4 shadow-sm">
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">이미지</text></svg>
				            <div class="card-body">
				              <p class="card-text">제목부분</p>
				              <p class="card-text">간략한 내용...(25자 이상 ...으로)</p>
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary">버튼1</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary">버튼2</button>
				                </div>
				                <small class="text-muted">날짜</small>
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="col-md-4">
				          <div class="card mb-4 shadow-sm">
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				            <div class="card-body">
				              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
				                </div>
				                <small class="text-muted">9 mins</small>
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="col-md-4">
				          <div class="card mb-4 shadow-sm">
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				            <div class="card-body">
				              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
				                </div>
				                <small class="text-muted">9 mins</small>
				              </div>
				            </div>
				          </div>
						</div>
						<!-- 2번째 줄 끝 -->
					</div>
				</div>
				
			</div>
		</div>
	<!-- CONTAINER DIV -->		
	</div>

	</main>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>
</body>
</html>