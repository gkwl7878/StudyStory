<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 800px;
	min-height: 800px
}
/* #link{margin-left: 1000px; margin-top: 20px} */
#loginTitle {
	text-align: center;
	st
}

.font17bold {
	font-size: 17px;
	font-weight: bold;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">

<title>문의 답변하기</title>
<!-- Custom styles for this template -->

<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>

<script type="text/javascript">
	 $(function() {
          $('#summernote').summernote({
                placeholder: '공지사항입니다  :)',
                tabsize: 2,
                height: 200,
                lang: 'ko-KR'
          });
        }); 
</script>

</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->

	<form action="create_request.jsp" name="createFrm">
		<div class="container form-group" id="wrap">
			<!-- <div class="row">
				<div class="col-12 justify-content-left"
					style="margin-bottom: 20px; margin-top: 20px;">
					<label style="font-size: 40px;"><strong>문의 답변하기</strong></label>
					<img alt="" src="resources/images/qa.png"
				style="width: 130px; height: 100px; margin-left: 0px;">
				</div>
			</div> -->
			 <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">문의 답변하기</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->
			
			<div class=" row">
				<div class="col-9" style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 50px;" class="font17bold"><strong>번호</strong>
						: </label> <label style="width: 200px;">1</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>글쓴이</strong> : </label> <label>홍길동</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>분류명</strong> : </label> <label>회원정보
						관련 문의</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>등록시간</strong> : </label> <label>2019
					</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label class="font17bold"><strong>제목</strong> : </label> <label>회원정보
						문의합니다. </label>
				</div>
			</div>
			<div class="row">
				<div style="margin-top: 10px; margin-left: 115px;">
					<label class=" font17bold"><strong>문의내용 </strong> : </label>
				</div>
				<div class="col-7" style="margin-top: 10px;">
					<textarea class=" form-control" rows="3"
						style="resize: none; width: 480px; height: 180px;" name="contents"
						readonly="readonly"></textarea>
				</div>
			</div>


			<div class=" row">
				<div class="col-9" style="margin-top: 30px; margin-left: 100px;">
					<input type="text" class="form-control" id="summernote">
				</div>
			</div>
			<div class="row" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="#void" role="button"
					style="margin-left: 400px;">돌아가기</a> <a
					class="btn btn-secondary btn" href="#void" role="button"
					style="margin-left: 10px;">답변등록</a> <a
					class="btn btn-secondary btn " href="#void" role="button"
					style="margin-left: 10px;">삭제</a>
			</div>
		</div>
	</form>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://localhost:8080/third_prj/resources/js/popper.min.js"></script>
	<script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js"></script>



</body>
</html>