<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>

<title>내가 만든 스터디</title>
<style>
a:hover {
	box-shadow: 0 4px 50px -3px rgba(0, 0, 0, 0.1);
}

.cross {
	background: #EAEAEA;
	height: 100px;
	position: relative;
	width: 20px;
}

.cross:after {
	background: #EAEAEA;
	content: "";
	height: 20px;
	left: -40px;
	position: absolute;
	top: 40px;
	width: 100px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".pending").hover(function() { 
		$(this).children("img:first").prop("src","/third_prj/resources/images/pending.png");
		$(this).children("img:first").show();
		$(this).children("div:first").hide();
	}, function() {
		$(this).children("img:first").hide();
		$(this).children("div:first").show();
	});
	
	$(".deactive").hover(function() {
		$(this).children("img:first").prop("src","/third_prj/resources/images/closed.png");
		$(this).children("img:first").show();
		$(this).children("div:first").hide();
	}, function() {
		$(this).children("img:first").hide();
		$(this).children("div:first").show();
	});
	
	$(".pending").click(function(){
		alert("수락대기 중인 스터디는 활동하실 수 없습니다");
	});
});

function moveToDetail(pendingFlag, sNum) {
	if (pendingFlag == "active") {
		location.href="../detail/detail_study.do?sNum="+sNum;
	}
}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<!-- body -->
	<div role="main" style="min-height: 900px">

		<!-- 점보트론 : 전광판 -->
		<section class="text-center bg-white mb-0" style="margin-top: 90px; margin-bottom: 20px;">
			<div class="container">
				<h1 class="jumbotron-heading">내가 만든 스터디</h1>
			</div>
		</section>
		<div style="height: 30px;"></div>
		<!-- 점보트론 : 전광판 -->

		<!-- CONTAINER DIV -->
		<div class="container-fluid">
			<!-- row -->
			<div class="row justify-content-center">

				<!-- 왼쪽 사용자 상태 -->
				<div class="col-auto">
					<div class="card" style="width: 250px;">
						<img src="/third_prj/profile_img/no_user_img.png" class="card-img-top w-75 mx-auto d-block rounded-circle mt-3">
						<div class="card-body text-center pt-0">
							<h6 class="card-title text-center my-3">
								<strong>닉네임</strong>
							</h6>
							<div class="border-top border-bottom my-4">
								<div class="d-flex flex-row p-2 border-bottom">
									<div class="mr-auto">
										<small>진행 중인 스터디</small>
									</div>
									<div class="text-right">
										<small><c:out value="${ openStudy }"/></small>
									</div>
									<div class="">
										<small> 건</small>
									</div>
								</div>
								<div class="d-flex flex-row p-2 border-bottom">
									<div class="mr-auto">
										<small>오픈 대기 스터디</small>
									</div>
									<div class="text-right">
										<small><c:out value="${ pendingStudy }"/></small>
									</div>
									<div class="">
										<small> 건</small>
									</div>
								</div>
								<div class="d-flex flex-row p-2">
									<div class="mr-auto">
										<small>종료 스터디</small>
									</div>
									<div class="text-right">
										<small><c:out value="${ closedStudy }"/></small>
									</div>
									<div class="">
										<small> 건</small>
									</div>
								</div>
							</div>
							<a href="../common/profile.do" class="btn btn-sm btn-primary">프로필 관리</a>
						</div>
					</div>
				</div>
				<!-- 왼쪽 사용자 상태 -->


				<!-- 오른쪽-->
				<div class="col-auto" style="width: 1000px;">

					<!-- 정렬바 row -->
					<div class="row mb-3" style="height: 4em;">
						<div class="row mx-3 w-100 border-top border-bottom align-items-center">

							<div class="col-auto mr-auto">
								<span>Total : <c:out value="${ total }"/>&nbsp;건</span>
							</div>

							<div class="col-auto">
								<form class="form-row align-item-center" action="study_i_made.do" id="conditionFrm" method="post">
									<div class="col-auto">
										<select class="form-control-sm" id="loc" name="loc">
											<option value="none" ${ selectedLoc eq 'none' ? 'selected' : '' }>지 역</option>
											<option value="신촌" ${ selectedLoc eq '신촌' ? 'selected' : '' }>신 촌</option>
											<option value="홍대" ${ selectedLoc eq '홍대' ? 'selected' : '' }>홍 대</option>
											<option value="종각" ${ selectedLoc eq '종각' ? 'selected' : '' }>종 각</option>
											<option value="건대" ${ selectedLoc eq '건대' ? 'selected' : '' }>건 대</option>
											<option value="노원" ${ selectedLoc eq '노원' ? 'selected' : '' }>노 원</option>
											<option value="강남" ${ selectedLoc eq '강남' ? 'selected' : '' }>강 남</option>
										</select>
									</div>
									<div class="col-auto">
										<select class="form-control-sm" id="category" name="category">
											<option value="none" ${ selectedCategory eq 'none' ? 'selected' : '' }>종 류</option>
											<option value="언어" ${ selectedCategory eq '언어' ? 'selected' : '' }>언 어</option>
											<option value="취업" ${ selectedCategory eq '취업' ? 'selected' : '' }>취 업</option>
											<option value="취미" ${ selectedCategory eq '취미' ? 'selected' : '' }>취 미</option>
											<option value="기타" ${ selectedCategory eq '기타' ? 'selected' : '' }>기 타</option>
										</select>
									</div>
									<input type="submit" class="btn btn-sm btn-secondary ml-1" value="필터 검색"/>
								</form>
							</div>
						</div>
					</div>
					<!-- 정렬바 row -->


					<div>
						<a> </a>
					</div>

					<!-- 썸네일 row -->
					<div class="row">

						<c:forEach var="study" items="${ studyIMadeList }">
						<div class="col-md-4" style="height:400px;">
							<div class="card mb-4 shadow-sm ${ study.accept_flag eq 'N' ? 'pending' : '' } ${ study.deactivation eq 'Y' ? 'deactive' : ''}"
								onclick="moveToDetail('${ study.accept_flag eq 'N' ? 'pending' : 'active' }','${ study.s_num }')">
								<img width="100%" height="350" style="display:none"/>
								<div>
									<img class="card-img-top" src="/third_prj/study_img/${ study.img }" width="100%" height="200">
									<div class="card-body text-center p-3" style="height:150px;">
	
										<div class="d-flex justify-content-end align-items-center mb-3">
											<div class="mr-5">
												<small class="text-muted"><c:out value="${ study.input_date }"/></small>
											</div>
											<small class="pr-1"><c:out value="${ study.recruitment eq 'Y' ? '모집중' : '모집종료' }"/></small>
										</div>
										<div class="px-3 border-bottom">
											<p class="card-text pb-3">
												<strong>${ study.study_name }</strong>
											</p>
										</div>
										<div class="d-flex justify-content-center align-items-center mt-1 px-2">
	
											<div class="border-right p-2 pr-4">
												<small>${ study.loc }</small>
											</div>
	
											<div class="p-2 pl-4">
												<small>${ study.category }</small>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
						<!-- 추가하기 버튼 -->
						<div class="col-md-4" style="min-height:400px;">
							<div class="roounded" style="height:350px; border: 1.5px dashed #EAEAEA; border-radius: 5px;">
								<button class="d-flex justify-content-center btn h-100 btn-outline-secondary btn-block text-center border-0" onclick="location.href='create_study.do'">+추가하기</button>
							</div>
						</div>
						<!-- 추가하기 버튼 -->
						<!-- 1번째 줄 시작 -->
					</div>
					<!-- 썸네일 row -->
				</div>
				<!-- 오른쪽-->
			</div>
			<!-- row -->
		</div>
		<!-- CONTAINER DIV -->
	</div>
	<!-- BODY CONTAINER DIV -->


	<!-- footer -->
	<footer>
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</footer>
	<!-- footer -->

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>