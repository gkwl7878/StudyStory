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


	<!--  -->



	<main role="main"> 
	
	<div class="jumbotron"><!-- 점보트론 -->
		<div class="container">
			<h1 class="display-1">Hello, world!</h1>
		</div>
	</div>
	
	<div class="container"><!-- 정렬 바 -->
		<div class="border rounded w-auto p-2 bg-light mb-3">
			<form class="" action="">
				<select id="align_select">
					<option>정 렬</option>
					<option>최신순</option>
					<option>인기순</option>
				</select>
				<select id="loc_select">
					<option value="#">지 역</option>
					<option value="#">신 촌</option>
					<option value="#">홍 대</option>
					<option value="#">종 각</option>
					<option value="#">건 대</option>
					<option value="#">노 원</option>
					<option value="#">강 남</option>
				</select> 
				<select id="sort_select">
					<option value="#">종 류</option>
					<option value="#">언 어</option>
					<option value="#">취 업</option>
					<option value="#">취 미</option>
					<option value="#">기 타</option>
				</select>
				<input type="button" class="btn" value="적용">
			</form>
		</div>
	</div>

	<div class="container"><!-- 바디 : 썸네일 만들어 지는 곧 -->
		<div class="row">
			<!-- 1번째 줄 시작 -->
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">이미지</text>
					</svg>
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
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
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
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
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
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
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
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
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
					<svg class="bd-placeholder-img card-img-top" width="100%"
						height="225" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
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
		</div><!-- row -->
	</div><!-- /container -->

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			
			<!-- 페이지 번호 -->
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<!-- 페이지 번호 -->
			
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>

	</main>



	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>
</body>
</html>