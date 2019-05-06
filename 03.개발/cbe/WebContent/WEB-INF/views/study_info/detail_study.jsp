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
		});// click

		// 댓글 달기 버튼 클릭 시 동작.
		$("#reply_btn").click( function() {
					var input_reply = $("#reply_inputBox").val();

					// 댓글을 입력하지 않고 댓글달기 버튼을 눌렀을 경우.
					if (input_reply == "") {
						alert("먼저 댓글을 입력해 주세요.");
						return;
					}// end if
					
					
					
					// 댓글을 입력된 경우.
					if (input_reply != "") {
						
						$.ajax({
							//var query_string = "sNum=" + $("[name='ref_num']").val() + "&reply=" + input_reply;
							
							url : "../detail/add_reply.do?",
							data : "sNum=" + $("[name='ref_num']").val() + "&reply=" + input_reply,
							type : "get",
							dataType : "json", // 응답 받을 데이터.
							error : function(xhr) {
								alert("댓글 작성 실패" + $("[name='num_ref']").val() );
								console.log(xhr.status + " / " + xhr.statusText);
							},
							success : function(json) {
								if (json.result) {
									alert("댓글이 정상적으로 동록 되었습니다.");
									
									// 첫 번쨰 리플의 태그를 가져오기.
									var new_reply = $("#reply_row1").html();
									
									// new_reply.find("#writer").text("${ sessionScope.nick }");
									// new_reply.find("#content").text(input_reply);
									$("#reply_list").prepend("<li id='reply_row' class='media' style='padding-bottom: 20px'>" + new_reply + "</li>");
								}// end if
							}// success
						}); // ajax

					}// end if

				}); // click

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
						현재 <c:out value="${ s_Info.favNum eq '0' ? '0' : s_Info.favNum }"/>명이 이 스터디를 좋아합니다
					</div>
				</div>
				<div class="row" style="margin-bottom: 20px">
					<div class="col-lg-12">
						<!-- 스터디 이미지 -->
						<div style="height: 450px; background-color: #F0F0F0">
							<img src="/third_prj/study_img/${ s_Info.studyImg }" style="width:100%; height:100%;">
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
							<div class="col-lg-6">지역 : <c:out value="${ s_Info.loc }"/></div>
							<!-- 스터디 모집 인원 -->
							<div class="col-lg-6">참여인원 : <c:out value="${ s_Info.memberNum }"/></div>
						</div>

						<div class="row">
							<div class="col-lg-6">종류 : <c:out value="${ s_Info.category }"/></div>
							<div class="col-lg-6">등록일 : <c:out value="${ s_Info.inputDate }"/></div>
						</div>
					</div>
				</div>
				<div class="row" style="padding: 50px; border: 1px solid #F0F0F0">
					<div class="col-lg-3">
						<strong>스터디 소개</strong>
					</div>
					<!-- 스터디 소개. -->
					<div class="col-lg-9">
						<c:out value="${ s_Info.content }" escapeXml="false"/>
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
									<img src="/third_prj/profile_img/${ s_Info.leaderImg }"class="card-img-top w-75 mx-auto d-block rounded-circle mt-3">
								</div>
							</div>
							<div class="col-lg-9" style="font-size: 20px; padding: 30px">
								<!-- 리더(스터디 개설자의 nick)-->
								<strong>${ s_Info.nick }</strong>
								<br/>
								<p style="font-size:13px;">
									<c:out value="${ s_Info.introduce }"/>
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
							<div class="col-lg-10">댓글 1</div>
						</div>
						<!-- 댓글 입력 폼 -->
						<div class="row">
							<div class="col-lg-10">
								<input id="reply_inputBox" type="text" class="form-control" maxlength="100" placeholder="댓글은 100자 까지 입력하실 수 있습니다." />
							</div>
							<div class="col-lg-2">
								<button id="reply_btn" type="button" class="btn btn btn-secondary btn-adjust">댓글달기</button>
							</div>
							<input type="hidden" name="ref_num" value=${ param.sNum }>
						</div>
						<!-- 댓글 입력 폼 -->

						<!-- 댓글 읽기  -->
						<div class="row">
							<div class="col-lg-12" style="margin-top: 60px">
								<ul id="reply_list" class="list-unstyled">
									<c:forEach var="s_comment" items="${ sCommentList }">
									<c:set var="i" value="${ i + 1 }"/>
										<!-- 댓글 하나 -->
										<li id="reply_row${ i }" class="media" style="padding-bottom: 20px">
											<!-- 댓글을 쓴 사용자의 이미지 -->
											<div style="width: 100px; height: 100px; background-color: #F0F0F0; margin-right: 20px">
												<img id="writer_img" alt="" src="">
											</div>
											<div class="media-body row">
												<div class="col-lg-10">
													<!-- 댓글 쓴 사용자의 이름. -->
													<h5 id="writer" class="mt-0 mb-1">${ s_comment.id }</h5>
													<!-- 댓글의 내용. -->
													<div id="content">${ s_comment.s_comment }</div>
												</div>
												<!-- 댓글의 입력일 -->
												<div id="w_date" class="col-lg-2" style="font-size: 12px;">${ s_comment.input_date }</div>
											</div>
										</li>
										<!-- 댓글 하나 -->
									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- 댓글 읽기  -->
					</div>
				</div>
				<!-- 댓글 -->
			</div>

			<!-- 따라다니는 사이드바 -->

	
			<div class="col-lg-2" style="position: fixed; margin-left: 940px; margin-top:100px;">
				<div id="sidebar" style="width: 300px; height: 300px">
					<div class="row  border border-secondary" style="padding: 20px; margin-left: 10px; border-radius:10px;">
						<div class="col-lg-12">
							
						<c:choose>
							<c:when test="${ leaderFlag }"><!-- 스터디장일 때 -->
						
								<div class="row">
									<div class="col-lg-12">
										<!-- 스터디명 -->
										<div style="font-size: 17px; text-align:center; font-weight: bold; height: 40px;">
											<c:out value="${ s_Info.studyName }"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="row">
											<div class="col text-center" style="margin-top: 30px">
												<button onclick="location.href='../study_notice/notice_list_leader.do?sNum=${ param.sNum }'" type="button" class="btn btn-secondary btn-sm">스터디 관리하기</button>
											</div>
										</div>
									</div>
								</div>
							
							</c:when>
							<c:when test="${ memberFlag }"><!-- 이미 가입된 멤버일때 -->
							
								<div class="row">
									<div class="col-lg-12">
										<!-- 스터디명 -->
										<div style="font-size: 17px; text-align:center; font-weight: bold; height: 40px;">
											<c:out value="${ s_Info.studyName }"/>
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
							<c:when test="${ joinerFlag }"><!-- 신청자일 때 -->
							
								<div class="row">
									<div class="col-lg-12">
										<!-- 스터디명 -->
										<div style="font-size: 17px; text-align:center; font-weight: bold; height: 40px;">
											<c:out value="${ s_Info.studyName }"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" style="font-size: 12px;  text-align:center; margin-top: 10px; height: 40px">
										<p>
											스터디장의 수락을 기다리고 있습니다<br/>
											수락 이후에 정상적인 활동이 가능합니다
										</p>
									</div>
								</div>
							
							</c:when>
							<c:otherwise><!-- 가입한, 신청한, 리더가 아니라면 -->
								
								<div class="row">
									<div class="col-lg-12">
										<!-- 스터디명 -->
										<div style="font-size: 17px; text-align:center; font-weight: bold; height: 40px;">
											<c:out value="${ s_Info.studyName }"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" style="font-size: 12px;  text-align:center; margin-top: 10px; height: 40px">
										<p>
											<c:out value="${ s_Info.favNum }"/>명이 좋아하는 스터디!<br/>
											<c:if test="${ s_Info.memberNum ne 20 }">
												<c:out value="${ 20 - s_Info.memberNum }"/>명 더 가입가능한 상태입니다!
											</c:if>
											<c:if test="${ s_Info.recruitment eq 'N' }">
												아쉽지만 모집이 마감되었습니다..<br/>다음 기회에 가입해주세요
											</c:if>
											<c:if test="${ s_Info.deactivation eq 'Y' }">
												활동이 종료된 스터디입니다.<br/>다른 스터디를 이용해주세요
											</c:if>
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