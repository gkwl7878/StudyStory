<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Custom styles for this template -->
<link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="/third_prj/resources/js/popper.min.js"></script>
<script src="/third_prj/resources/js/bootstrap.min.js"></script>

<title>스터디 상세 정보</title>
<style>
.bigBtn {
	height: 50px;
}

.btn-adjust {
	height: 37px;
	width: 120px
}
</style>

<!-- CDN : jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		// 스터디 참여하기 버튼 클릭 시 동작.
		$("#study_join_btn").click(function() {
			$("#join_study_frm").submit(); // submit
		});

		// 댓글 달기 버튼 클릭 시 동작.
		$("#reply_btn").click(function() {
			var input_reply = $("#reply_inputBox").val();

			// 댓글을 입력하지 않고 댓글달기 버튼을 눌렀을 경우.
			if (input_reply == "") {
				alert("먼저 댓글을 입력해 주세요.");
				return;
			}// end if

			// 댓글을 100자 이상 입려한 경우.
			if (input_reply.length > 100) {
				alert("댓글을 100자 이상 입력하셨습니다.");
				return;
			}// end if

			// 정상입력된 경우 서브밋 하기.
			if (input_reply != "" && input_reply.length < 100) {
				
				// 쿼리스트링 만들기
				var query_string = "reply=" + input_reply + "&sNum=" + $("#ref_num").val();
				
				$.ajax({
					url : "../detail/add_reply.do",
					data : query_string,
					type : "post",
					dataType : "json",
					error : function(xhr) {
						alert("댓글 작성 실패");
						console.log(xhr.status + " / " + xhr.statusText);					
					}, 
					success : function( json ) {
						if( json.result ) {
							var date = new Date();
							
							var output = "";
							output += "<div class='media'>"
							output += "	<div style='width: 95px; height: 95px; background-color: #F0F0F0; margin-right: 10px; text-align: center;'>"
							output += "		<img src='http://localhost:8080/third_prj/study_img/" + json.img + "' class='w-100 h-100 align-self-start mr-3'>"
							output += "	</div>"
							output += "	<div class='col-lg-10' style='margin-top: 5px; padding-right: 0px;'>"
							output += "		<div style='overflow: hidden'>"
							output += "			<div class='mt-0' style='float: left;'>"+json.nick+"</div>"
							output += "			<div style='float: right;'>" + date.getFullYear() + "/0" +(date.getMonth()+1) + "/0" + date.getDate() + "</div>"
							output += "		</div>"
							output += "		<div style='margin-top: 15px;'>"+ input_reply +"</div>"
							output += "	</div>"
							output += "</div>"
							output += "<div class='my-3 border-bottom'></div>"
							var cnt = $("#sc_cnt").text();
							$("#sc_cnt").text(Number(cnt) + 1);
							$("#sComment_view").prepend(output);
						}// end if
					}
				}); // ajax
			}// end if
		});
	}); // ready
</script>

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<div class="container" style="min-height: 2000px">
		<div class="row">
			<div class="col-lg-10">
				<div class="row justify-content-center" style="padding: 50px; margin-bottom: 20px; margin-top: 20px">
					<!-- 스터디 제목 -->
					<h2>${ s_Info.studyName }</h2>
				</div>
				<div class="row">
					<div class="col-lg-8"></div>
					<div class="col-lg-4" style="font-size: 17px; font-weight: bold; margin-bottom: 20px">
						현재
						<c:out value="${ s_Info.favNum eq '0' ? '0' : s_Info.favNum }" />
						명이 이 스터디를 좋아합니다
					</div>
				</div>
				<div class="row" style="margin-bottom: 20px">
					<div class="col-lg-12">
						<!-- 스터디 이미지 -->
						<div style="height: 450px; background-color: #F0F0F0">
							<img src="/third_prj/study_img/${ s_Info.studyImg }" style="width: 100%; height: 100%;">
						</div>
					</div>
				</div>
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-3">
						<strong>상세 정보</strong>
					</div>
					<div class="col-lg-9">

						<div class="row">
							<!-- 스터디 지역 -->
							<div class="col-lg-6">
								지역 :
								<c:out value="${ s_Info.loc }" />
							</div>
							<!-- 스터디 모집 인원 -->
							<div class="col-lg-6">
								참여인원 :
								<c:out value="${ s_Info.memberNum }" />
							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">
								종류 :
								<c:out value="${ s_Info.category }" />
							</div>
							<div class="col-lg-6">
								등록일 :
								<c:out value="${ s_Info.inputDate }" />
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-3">
						<strong>스터디 소개</strong>
					</div>
					<!-- 스터디 소개. -->
					<div class="col-lg-9">
						<c:out value="${ s_Info.content }" escapeXml="false" />
					</div>
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
								<div style="width: 150px; height: 150px;">
									<img src="/third_prj/profile_img/${ s_Info.leaderImg }" class="card-img-top w-75 mx-auto d-block rounded-circle mt-3">
								</div>
							</div>
							<div class="col-lg-9" style="font-size: 20px; padding: 30px">
								<!-- 리더(스터디 개설자의 nick)-->
								<strong>${ s_Info.nick }</strong>
								<br/>
								<p style="font-size: 13px;">
									<c:out value="${ s_Info.introduce }" />
								</p>
							</div>
						</div>
					</div>
				</div>

				<!-- 댓글 -->
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-12">
						<div class="row" style="margin-bottom: 20px; font-weight: bold">
							<!-- 댓글의 총 갯수. -->
							<div class="col-lg-10">댓글 : <span id="sc_cnt"><c:out value="${scomment_cnt}"/></span>개</div>
						</div>
						<!-- 댓글 입력 폼 -->
						<div class="row">
							<div class="col-lg-10">
								<input id="reply_inputBox" type="text" class="form-control" maxlength="100" placeholder="댓글은 100자 까지 입력하실 수 있습니다." />
							</div>
							<div class="col-lg-2">
								<button id="reply_btn" type="button" class="btn btn btn-secondary btn-adjust">댓글달기</button>
							</div>
							<input type="hidden" id="ref_num" value=${ param.sNum }>
						</div>
						<!-- 댓글 입력 폼 -->

						<!-- 댓글 읽기  -->
						<div class="row">
							<div class="col-lg-12" style="margin-top: 60px">
								<div id="sComment_view">
									<c:forEach var="s_comment" items="${ sCommentList }">
										<div class="media">
											<div style="width: 95px; height: 95px; background-color: #F0F0F0; margin-right: 10px; text-align: center;">
												<img src="/third_prj/study_img/${ s_comment.img }" class="w-100 h-100 align-self-start mr-3">
											</div>
											<div class="col-lg-10" style="margin-top: 5px; padding-right: 0px;">
												<div style="overflow: hidden">
													<div class="mt-0" style="float: left;">${ s_comment.nick }</div>
													<div style="float: right;">${ s_comment.input_date }</div>
												</div>
												<div style="margin-top: 15px;">${ s_comment.s_comment }</div>
											</div>
										</div>
										
										<div class="my-3 border-bottom"></div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 댓글 읽기  -->
					</div>
				</div>
				<!-- 댓글 -->
			</div>

			<!-- 따라다니는 사이드바 -->


			<div class="col-lg-2" style="position: fixed; margin-left: 940px; margin-top: 100px;">
				<div id="sidebar" style="width: 300px; min-height: 300px">
					<div class="row  border border-secondary" style="padding: 20px; margin-left: 10px; border-radius: 10px;">
						<div class="col-lg-12">

							<c:choose>
								<c:when test="${ leaderFlag }">
									<!-- 스터디장일 때 -->

									<div class="row">
										<div class="col-lg-12">
											<!-- 스터디명 -->
											<div style="font-size: 17px; text-align: center; font-weight: bold; height: 40px;">
												<c:out value="${ s_Info.studyName }" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="row">
												<div class="col text-center" style="margin-top: 30px">
													<button onclick="location.href='../study_notice/notice_list_leader.do?s_num=${ param.sNum }'" type="button" class="btn btn-secondary btn-sm">스터디 관리하기</button>
												</div>
											</div>
										</div>
									</div>

								</c:when>
								<c:when test="${ memberFlag }">
									<!-- 이미 가입된 멤버일때 -->

									<div class="row">
										<div class="col-lg-12">
											<!-- 스터디명 -->
											<div style="font-size: 17px; text-align: center; font-weight: bold; height: 40px;">
												<c:out value="${ s_Info.studyName }" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="row">
												<div class="col text-center" style="margin-top: 30px">
													<button onclick="location.href='../study_notice/notice_list.do?s_num=${ param.sNum }'" type="button" class="btn btn-secondary btn-sm">스터디 공지보기</button>
												</div>
											</div>
										</div>
									</div>

								</c:when>
								<c:when test="${ joinerFlag }">
									<!-- 신청자일 때 -->

									<div class="row">
										<div class="col-lg-12">
											<!-- 스터디명 -->
											<div style="font-size: 17px; text-align: center; font-weight: bold; height: 40px;">
												<c:out value="${ s_Info.studyName }" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12" style="font-size: 12px; text-align: center; margin-top: 10px; height: 40px">
											<p>
												스터디장의 수락을 기다리고 있습니다
												<br />
												수락 이후에 정상적인 활동이 가능합니다
											</p>
										</div>
									</div>

								</c:when>
								<c:otherwise>
									<!-- 가입한, 신청한, 리더가 아니라면 -->

									<div class="row">
										<div class="col-lg-12">
											<!-- 스터디명 -->
											<div style="font-size: 17px; text-align: center; font-weight: bold; height: 40px;">
												<c:out value="${ s_Info.studyName }" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12" style="font-size: 12px; text-align: center; margin-top: 10px; height: 40px">
											<p>
												<c:choose>
													<c:when test="${ s_Info.memberNum ne 20 and s_Info.recruitment eq 'Y' }">
														<c:out value="${ s_Info.favNum }" />명이 좋아하는 스터디!<br />
														<c:out value="${ 20 - s_Info.memberNum }" />명 더 가입가능한 상태입니다!<br />
													</c:when>
													<c:when test="${ s_Info.recruitment eq 'N' }">
													아쉽지만 모집이 마감되었습니다..<br />다음 기회에 가입해주세요<br />
													</c:when>
													<c:when test="${ s_Info.deactivation eq 'Y' }">
													활동이 종료된 스터디입니다.<br />다른 스터디를 이용해주세요<br />
													</c:when>
												</c:choose>
											</p>
										</div>
									</div>
									<c:if test="${ s_Info.recruitment eq 'Y' }">
										<div class="row">
											<div class="col-lg-12">
												<div class="row">
													<div class="col text-center" style="margin-top: 30px">
														<form id="join_study_frm" action="../study_info/study_req_join.do">
															<button id="study_join_btn" type="button" class="btn btn-secondary btn-sm">스터디 참여하기</button>
															<input type="hidden" name="sNum" value="${ param.sNum }">
														</form>
													</div>
												</div>
											</div>
										</div>
									</c:if>

								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

</body>
</html>