<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>

<title>참여자 보기</title>
<style>
	#profile_img{ width: 200px ;height: 200px}
</style>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<!-- body -->
	<div role="main" style="min-height: 900px">


		<!-- 점보트론 : 전광판 -->
		<section class="text-center bg-white mb-0" style="margin-top: 90px; margin-bottom: 20px;">
			<div class="container">
				<h1 class="jumbotron-heading">참여자 보기</h1>
			</div>
		</section>
		<div style="height: 20px;"></div>
		<!-- 점보트론 : 전광판 -->

		<!-- CONTAINER DIV -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12 p-3 bg-light">

					<!-- 정렬바 row -->
					<div class="row" style="height: 3em;">
						<div class="row mr-3 ml-3 w-100 border-bottom align-items-center">
							<div class="col-auto mr-auto">
								<p class="h5">조회된 참여자들 : ${ total }건</p>
							</div>
						</div>
					</div>
					<!-- 정렬바 row -->
					<c:if test="${ empty mbwi }">
						가입된 회원이 없습니다.
					</c:if>
					
					<!-- 썸네일 row -->
					<div class="row p-3">
						<div class="col-12.5 bg-white">
							<!-- 썸네일 row -->
							<div class="row pt-3 bg-light">
								<!-- 1번째 줄 시작 -->
					<c:forEach var="mbwiList" items="${mbwi }">
								<div class="col-2.5">
									<div class="card mb-4 shadow-sm text-center " style="margin-left: 20px">
										<img class="card-img-top" src="http://211.63.89.144/profile_img/${mbwiList.img}" onerroalt="Card image cap" onerror="this.src='http://211.63.89.144/resources/images/not_find_image.png'" id="profile_img">
										<div class="card-body">
											<strong import!><p class="card-title">${ mbwiList.nick }</p></strong>
											<p class="card-text">${ mbwiList.tel }</p>
										</div>
									</div>
								</div>
								<!-- 1번째 줄 시작 -->
					</c:forEach>
							</div>
						</div>
					</div>
					<!-- 썸네일 row -->

				</div>
			</div>
			<!-- row -->
		</div>
		<!-- CONTAINER DIV -->
	</div>
	<!-- DIV ROLE MAIN -->

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://211.63.89.144/resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="http://211.63.89.144/resources/js/popper.min.js"></script>
	<script src="http://211.63.89.144/resources/js/bootstrap.min.js"></script>
</body>
</html>