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
<!-- 좋아요 -->
<script type="text/javascript">
	function likeProcess(sNum) {
		var add_flag = confirm("관심 스터디에 추가 하시겠습니까?");

		// '예' - 관심 스터디를 추가 할 경우.
		if (add_flag) {
			$.ajax({
				url : "../likeProcess/likeProcess.do?",
				data : "sNum=" + sNum,
				type : "get",
				dataType : "json", // 응답 받을 데이터.
				error : function(xhr) {
					console.log(xhr.status + " / " + xhr.statusText);
				},
				success : function(json) {
					// 정삭적으로 추가 되었다면 true가 반환된다.
					if(json.resultFlag) {
						$("#" + sNum + "_thumb").remove();

						var moveFlag = confirm("관심 페이지로 이동 하시겠습니까?");
						// '예'일 경우 이동하기.
						if(moveFlag){
							location.href = "../interest/show_interest_study.do";
						}// end if
					}// end if
				}// success
			}); // ajax
		}// end if
	}// likeProcess
</script>
<!-- 좋아요 -->
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

					<!-- 썸네일 시작 - 썸네일은 한 줄에 3개씩 채워진다. -->
					<c:forEach var="thumbnail" items="${ thumbnail_list }">
						<div id="${ thumbnail.s_num }_thumb" class="col-md-4">
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
											<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="button" autocomplete="off" onclick="likeProcess('${ thumbnail.s_num }')">좋아요</button>
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
	</main>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

</body>
</html>