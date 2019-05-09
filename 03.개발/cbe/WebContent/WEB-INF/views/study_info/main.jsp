<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="/third_prj/resources/css/font.css" />

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/popper.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.min.js"></script>

<title>스터디 스토리</title>
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

.custom_jumbo {
	min-height: 350px;
	background-image:
		url('/third_prj/resources/images/main_page_jumbotron.jpg');
	background-position: center;
	background-repeat: no-repeat;
	background-size: 100%;
	color: #fff;
}

.red_heart {
	background: url("/third_prj/study_img/like_icon.png") no-repeat;
	background-size: 100%;
}

.gray_heart {
	background: url("/third_prj/study_img/dislike_icon.png") no-repeat;
	background-size: 100%;
}

.heart:hover {
	cursor: pointer;
}
</style>
<!-- Custom styles for this template -->
<link href="/third_prj/resources/css/jumbotron.css" rel="stylesheet">

<!-- CDN -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ joinReqSuccess }">
		alert("스터디 신청이 완료되었습니다");
		</c:if>
		<c:if test="${ joinReqFail }">
		alert("스터디 참여신청에 실패했습니다. 잠시 후에 다시 시도해주세요");
		</c:if>
	}); // ready
</script>

<!-- 상세페이지로 이동 -->
<script type="text/javascript">
	$(function() {

		$(".heart").click(function(event) {
			// 클릭된 썸네일의 하트 노트 가져오기.
			var heart_node = $(this);

			// 아이디와 클래스 속성 값 가져오기.
			var this_id = heart_node.attr("id");
			var this_class = heart_node.attr("class");

			// 아이디에서 sNum, 클래스에서 Color 얻기.
			var sNum = this_id.substring(0, this_id.lastIndexOf("_"));
			var Color = this_class.substring(0, this_class.lastIndexOf("_"));

			// 좋아요 해제인 경우 물어보기.
			if (Color == "red") {

				var removeFlag = confirm("이 스터디를 관심 스터디에서 제거 하시겠습니까?");

				// 취소
				if (!removeFlag) {
					return;
				}// end if

			}// end if

			$.ajax({
				url : "../heartProcess/heartProcess.do?",
				data : "sNum=" + sNum + "&Color=" + Color,
				type : "get",
				dataType : "json", // 응답 받을 데이터.
				error : function(xhr) {
					alert("오류발생")
					console.log(xhr.status + " / " + xhr.statusText);
				},
				success : function(json) {
					alert("응답받음.");
					alert(json.result);

					// 추가인 경우.
					if (json.result == "toI") {
						alert("추가성공");
						// 하트 색 바꿔 주기.
						heart_node.attr("class", "red_heart heart");

						/* var moveFlag = confirm("관심 스터디 보기 페이지로 이동 하시겠습니까?");

						// '예'인 경우.
						if (moveFlag) {
							location.href = "../interest/show_interest_study.do";
						}// end if

						// '아니오'인 경우. 
						if (!moveFlag) {
							location.reload();
						}// end if */

					}// end if

					// 해제인 경우.
					if (json.result == "toR") {
						// 하트 색 바꿔 주기.
						heart_node.attr("class", "gary_heart heart");
					}// end if

				}// success
			}); // ajax
		});

	}); // ready
</script>
<!-- 상세페이지로 이동 -->

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<section class="jumbotron custom_jumbo" style="min-height: 350px;">
		<div class="container">
			<div style="margin-left: 50px; margin-top: 280px;">
				<h2>스터디 스토리</h2>
				<h5>성공을 향해 나아가는 당신의 이야기.</h5>
			</div>
		</div>
	</section>

	<!-- CONTAINER DIV -->
	<div class="container-fluid">
		<!-- row -->
		<div class="row justify-content-center">
			<div class="col-auto" style="width: 1000px;">

				<!-- 썸네일 row -->
				<div class="row">
					<c:if test="${ empty thumbnail_list }">
							조회할 수 있는 썸네일이 없습니다.
						</c:if>

					<!-- 썸네일 시작 - 썸네일은 한 줄에 3개씩 채워진다. -->
					<c:forEach var="thumbnail" items="${ thumbnail_list }">
						<div id="${ thumbnail.s_num }_thumb" class="thumb col-md-4">
							<!-- 썸네일 클릭시 상세 페이지로 이동하는 a 태그. - 나중에 div노드로 변경하기. -->
							<div class="card mb-4 shadow-sm">
								<div class="card-body text-center p-0">

									<a href="../detail/detail_study.do?sNum=${ thumbnail.s_num }" style="color: #333; text-decoration: none;">
										<div>
											<!-- 썸네일 스터디 이미지 -->
											<img class="card-img-top" src="/third_prj/study_img/${ thumbnail.img }" style="width: 100%; height: 180px;" />
										</div>
										<div id="moveTo" class="px-3 pt-3">
											<div class="d-flex justify-content-end align-items-center mb-3">
												<div class="mr-5">
													<!-- 썸네일 들록일 -->
													<small class="text-muted">${ thumbnail.input_date }</small>
												</div>
												<!-- 썸네일 모집상태 - 진행중. -->
												<small class="pr-1">모집상태</small>
											</div>
											<div class="m-2 border-bottom">
												<p class="card-text pb-3">
													<!-- 썸네일 제목부분 -->
													<strong>${ thumbnail.study_name }</strong>
												</p>
											</div>
										</div>
									</a>

									<div class="d-flex justify-content-between align-items-center mb-3 px-3">
										<div class="border border-light rounded-circle" style="width: 45px; height: 45px;">
											<!-- 썸네일 리더의 이미지 -->
											<img src="/third_prj/profile_img/${ thumbnail.user_img }" class="card-img-top w-100 rounded-circle" style="width: 45px; height: 45px;">
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

										<!-- 토글버튼 : 좋아요를 누르면  .active를 주세요. -->
										<div id="heart_btn">
											<c:choose>
												<c:when test="${ thumbnail.favFlag eq true }">
													<div id="${ thumbnail.s_num }_btn" class="red_heart heart" style="width: 27px; height: 27px;"></div>
												</c:when>

												<c:when test="${ thumbnail.favFlag eq false }">
													<div id="${ thumbnail.s_num }_btn" class="gray_heart heart" style="width: 27px; height: 27px;"></div>
												</c:when>
											</c:choose>
										</div>
										<!-- 토글버튼 : 좋아요를 누르면  .active를 주세요. -->
									</div>
								</div>
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

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>