<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>
<style type="text/css">
#wrap {
	margin: 100px auto;
	width: 800px;
	min-height: 650px
}
.font17bold {
	font-size: 17px;
	font-weight: bold;
}
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<title>관리자에게 문의하기</title>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>

	<form action="add_question.do" id="questionFrm" method="post">
		<div class="container form-group" id="wrap">
    <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">관리자에게 문의하기</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->

			<div class="row" style="margin-top: 30px;">
				<div class="col-5" style="margin-left: 100px;">
					<label class="font17bold"><strong>문의 제목 </strong> </label>
				</div>
				<div class="col-4">
					<label class="font17bold"><strong>문의 분류 </strong> </label>
				</div>
			</div>

			<div class="row">
				<div class="col-5" style="margin-left: 100px;">
					<input type="text" class="form-control" 
						id="subject" name="subject" maxlength="100" placeholder="제목을 입력해주세요(100자 이내)">
				</div>
				<div class="col-4">
					<select class="custom-select" name="category">
						<option selected value="none">분류 선택</option>
						<option value="회원정보">회원정보 관련</option>
						<option value="스터디">스터디 관련</option>
						<option value="홈페이지">홈페이지 관련</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<label class=" font17bold"><strong>문의내용 </strong> </label>
				</div>
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					 <textarea name="content" id="summernote" ></textarea>
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="javascript:history.back()" 
					role="button" style="margin-left: 300px;">돌아가기</a>
				<a class="btn btn-secondary btn" href="#" 
					role="button" style="margin-left: 10px;" id="askBtn">문의하기</a>
			</div>
		</div>
	</form>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
	<script type="text/javascript">
		$('#summernote').summernote({
			placeholder : '문의하실 내용을 입력해주세요  :)',
			tabsize : 2,
			height : 300,
			lang : 'ko-KR'
		});
	</script>
	<script type="text/javascript">
		$(function(){
			
			<c:if test="${ askFailFlag }">
				alert("문의 등록에 실패했습니다. 다시 시도해주세요");
			</c:if>
			
			$("#askBtn").click(function() {
				
				var subject = $("#subject").val();
				
				if (subject == "") {
					alert("제목을 입력해주세요");
					$("#subject").focus();
					return;
				}
				
				var category = $("[name='category']").val();
				
				if (category == 'none') {
					alert("문의 분류를 선택해주세요");
					$("[name='category']").focus();
					return;
				}
				
				var content = $("#summernote").val();
				
				if(content == "") {
					alert("내용을 입력해주세요");
					return;
				}
				
				$("#questionFrm").submit();
			});
		});
	</script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://211.63.89.144/resources/js/popper.min.js"></script>
	<script src="http://211.63.89.144/resources/js/bootstrap.min.js"></script>
</body>
</html>