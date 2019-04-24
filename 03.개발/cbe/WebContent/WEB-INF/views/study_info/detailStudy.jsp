<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/popper.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.min.js"></script>

<title>스터디 상세 정보</title>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.bigBtn {
	height: 50px;
}

.btn-adjust {
	height: 37px;
	width: 120px
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
	.title {
		width: 500px;
		margin: 0px auto;
		text-align: center;
	}
	.likeLabel {
		text-align: right;
	}
}
</style>

<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">

<!-- CDN : jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#study_join_btn").click(function() {
			$("#detail_study_frm").submit(); // submit
		});// click
	}); // ready
</script>

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<main role="main">


	<div class="container" style="min-height: 2000px">
		<div class="row">
			<div class="col-lg-10">
				<div class="row justify-content-center" style="padding: 100px; margin-bottom: 60px; margin-top: 60px">
					<!-- 스터디 제목 -->
					<h2>${ s_Info.studyName }</h2>
				</div>
				<div class="row">
					<div class="col-lg-8"></div>
					<div class="col-lg-4" style="font-size: 17px; font-weight: bold; margin-bottom: 20px">현재 00명이 이 스터디를 좋아합니다.</div>
				</div>
				<div class="row" style="margin-bottom: 20px">
					<div class="col-lg-12">
						<!-- 스터디 이미지 -->
						<div style="height: 450px; background-color: #F0F0F0">
							<img src="/third_prj/resources/images/${ s_Info.studyImg }">
						</div>
					</div>
				</div>
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-3">
						<strong>상세 정보</strong>
					</div>
					<div class="col-lg-9">

						<!-- private int favNum, memberNum; // 좋아요 갯수, 스터디 참여자 수. -->

						<div class="row">
							<!-- 스터디 지역 -->
							<div class="col-lg-6">지역: ${ s_Info.loc }</div>
							<!-- 스터디 모집 인원 -->
							<div class="col-lg-6">인원: 추가하기.</div>
						</div>

						<div class="row">
							<div class="col-lg-6">종류: ${ s_Info.category }</div>
							<div class="col-lg-6">등록일: ${ s_Info.inputDate }</div>
						</div>
					</div>
				</div>
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-3">
						<strong>스터디 소개</strong>
					</div>
					<!-- 스터디 소개. -->
					<div class="col-lg-9">${ s_Info.content }</div>
				</div>
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3" style="margin-bottom: 20px">
								<strong>리더 소개</strong>
							</div>
							<div class="col-lg-9"></div>
						</div>

						<div class="row">
							<div class="col-lg-3" style="padding-left: 18px;">
								<!-- 리더 이미지 -->
								<div style="width: 100px; height: 100px; background-color: #F0F0F0">
									<img src="http://localhost:8080/third_prj/resources/images/${ s_Info.leaderImg }">
								</div>
							</div>
							<div class="col-lg-9" style="font-size: 20px; padding: 30px">
								<!-- 리더(스터디 개설자의 nick)-->
								<strong>${ s_Info.nick }</strong>
							</div>
						</div>
						<div class="row" style="padding-bottom: 30px; padding-top: 20px">
							<div class="col-lg-3"></div>
							<!-- 리더 소개글. -->
							<div class="col-lg-9">${ s_Info.introduce }</div>
						</div>
					</div>
				</div>

				<!-- 댓글 -->
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-12">
						<div class="row" style="margin-bottom: 20px; font-weight: bold">
							<!-- 댓글의 총 갯수. -->
							<div class="col-lg-10">댓글 1</div>
							<div class="col-lg-2 text-right">내 댓글</div>
						</div>
						<div class="row">
							<div class="col-lg-10">
								<input type="text" class="form-control" maxlength="100" placeholder="댓글은 100자까지 입력하실 수 있습니다." />
							</div>
							<div class="col-lg-2">
								<button type="button" class="btn btn btn-secondary btn-adjust" id="searchZip">확인</button>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-12" style="margin-top: 60px">
								<ul class="list-unstyled">
									<c:forEach var="s_comment" items="${ sCommentList }">
										<!-- 댓글 하나 -->
										<li class="media" style="padding-bottom: 20px">
											<!-- 댓글을 쓴 사용자의 이미지 -->
											<div style="width: 100px; height: 100px; background-color: #F0F0F0; margin-right: 20px"></div>
											<div class="media-body row">
												<div class="col-lg-10">
													<!-- 댓글 쓴 사용자의 이름. -->
													<h5 class="mt-0 mb-1">${ s_comment.id }</h5>
													<!-- 댓글의 내용. -->
													<div>${ s_comment.s_comment }</div>
												</div>
												<!-- 댓글의 입력일 -->
												<div class="col-lg-2" style="font-size: 12px;">${ s_comment.input_date }</div>
											</div>
										</li>
										<!-- 댓글 하나 -->
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 댓글 -->
			</div>

			<!-- 따라다니는 사이드바 -->
			<div class="col-lg-2" style="position: fixed; margin-left: 940px;">
				<div id="sidebar" style="width: 300px; height: 300px">
					<div class="row  border border-secondary" style="padding: 30px; margin-left: 10px">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-12">
									<!-- 스터디명 -->
									<div style="font-size: 17px; font-weight: bold; height: 70px;">${ s_Info.studyName }</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12" style="font-size: 12px; margin-top: 10px; height: 60px">
									<!-- 스터디 참여인원 및 ... 생각해 보기. -->
									<div>현재 인원,</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="row">
										<div class="col-lg-2"></div>
										<div class="col-lg-8" style="margin-top: 40px">
											<form id="detail_study_frm" action="../study_info/study_req_join.do">
												<button id="study_join_btn" type="button" class="btn btn-secondary btn-sm">스터디 참여하기</button>
												<input type="hidden" name="sNum" value="${ param.sNum }">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	</main>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

</body>
</html>