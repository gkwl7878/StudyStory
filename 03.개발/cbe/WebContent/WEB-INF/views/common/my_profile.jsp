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
<title>프로필 관리</title>
<style>
/* 프로필 작성 */
.profile_wrap {
	margin: 0px auto;
	width: 1000px;
}
.img_subscript {
	width: 280px;
}
.ta_subscript {
	margin-left: 90px
}
/* 프로필 작성 */
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	<c:if test="${ changeFlag }">
		alert("프로필 정보가 변경되었습니다");
	</c:if>
	
	var nickChangeFlag = false;
	
	$("#uploadImgBtn").click(function() { //이미지 업로드
		window.open("upload_img.do?prevImg=${ prevProfile.img }","uploadImg","width=500,height=200,top=200,left=500");
	});
	
	$("#nick").keyup(function() {
		
		var nick = $("#nick").val();
		var queryString = "nick="+nick;
		
		
		$.ajax({
			url:"check_dup_nick.do",
			data:queryString,
			type:"get",
			async:"true",
			dataType:"json",
			error:function(xhr) {
				alert("에러코드 : "+xhr.status+" 에러 메시지 : "+xhr.statusText);
			},
			success:function(json) {
				if (json.dupFlag) {
					if (nick == "${ prevProfile.nick }") {
						nickChangeFlag = false;
						$("#nickCheck").css("color","#0F68B1");
						$("#nickCheck").text("기존 닉네임과 동일합니다");
					} else {
						nickChangeFlag = true;
						$("#nickCheck").css("color","#FF0000");
						$("#nickCheck").text(json.msg);
					}
				}	else {
					nickChangeFlag = false;
					$("#nickCheck").css("color","#0F68B1");
					$("#nickCheck").text(json.msg);
				}
			}
		});
	});
	
	$("#modifyBtn").click(function() {
		var nick = $("#nick").val();
		if (nick == "") {
			alert("닉네임은 필수 입력항목입니다");
			$("#nick").focus();
			return;
		}
		
		if (nickChangeFlag) {
			alert("중복된 닉네임으로는 변경이 불가능합니다");
			$("#nick").val("");
			$("#nick").focus();
			return;
		}
		
		$("#profileFrm").submit();
	});
});	
</script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<!-- body -->
	<div role="main" style="min-height: 750px">

		<!-- 점보트론 : 전광판 -->
		<section class="text-center bg-white mb-0" style="margin-top: 90px; margin-bottom: 20px;">
			<div class="container">
				<h1 class="jumbotron-heading">프로필 관리</h1>
			</div>
		</section>
		<div style="height: 30px;"></div>
		<!-- 점보트론 : 전광판 -->


		<!-- CONTAINER DIV -->
		<div class="container">
			<!-- row -->
			<div class="row border-top border-bottom pt-4 pb-4 justify-content-center">

				<!-- 왼쪽 사용자 이미지-->
				<div class="col-auto">
					<div class="card border-0 pr-0" style="width: 260px;">
						<img style="width: 200px; height: 200px;" id="img" src="/third_prj/profile_img/${ prevProfile.img }" class="card-img-top mx-auto d-block rounded-circle mt-3" alt="...">
						<div class="card-body text-center pt-0">
							<h5 class="card-title text-center m-4">프로필 사진</h5>
							<a href="#" class="btn btn-sm btn-primary mb-4" id="uploadImgBtn">이미지 변경</a>
							<p class="text-left text-muted">
								<small>사이즈는 가로 200px, 세로 200px에 최적화 되어 있으며 jpg, gif, png파일을 지원합니다.</small>
							</p>
						</div>
					</div>
				</div>
				<!-- 왼쪽 사용자 이미지-->


				<!-- 오른쪽-->
				<div class="col-auto" style="width: 600px;">
					<!-- 입력란 row -->
					<div class="row h-100 border-left align-items-center">
						<div class="row mr-3 ml-5 p-4 w-100 rounded">

							<form class="w-100" id="profileFrm" action="profile_process.do" method="post">
								<div class="form-group row mb-4">
									<label for="nickname" class="col-2">닉네임</label>
									<div class="col-5">
										<input id="nick" name="nick" type="text" maxlength="10" class="form-control" value="${ prevProfile.nick }">
									</div>
									<div class="col-4" style="padding-left:0px;">
										<span class="align-middle" style="font-size:13px;" id="nickCheck"></span>
									</div>
								</div>

								<div class="form-group row">
									<label for="introduce" class="col-2 pr-0 col-form-label">자기소개</label>
									<div class="col-9">
										<textarea class="form-control" id="introduce" name="introduce" 
											rows="11" maxlength="100"><c:out value="${ prevProfile.introduce }"/></textarea>
										<p class="mt-2 text-muted">
											<small> * 자기소개는 100자 까지 입력할 수 있습니다.</small>
										</p>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- 입력란 row -->
				</div>
				<!-- 오른쪽-->
			</div>
			<!-- row -->

			<!-- 등록하기 버튼 row -->
			<div class="row mt-5 justify-content-center">
				<div class="col-auto">
					<button class="btn btn-primary" id="modifyBtn">변경하기</button>
				</div>
			</div>
			<!-- 등록하기 버튼 row -->

		</div>
		<!-- CONTAINER DIV -->
	</div>
	<!-- DIV ROLE MAIN -->


	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>