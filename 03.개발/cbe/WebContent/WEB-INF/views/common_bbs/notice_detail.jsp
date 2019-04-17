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
	
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">

<title>세부 공지사항</title>
<!-- Custom styles for this template -->

<script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>

<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			placeholder : '공지사항입니다  :)',
			tabsize : 2,
			height : 300,
			lang : 'ko-KR'
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
					style="margin-bottom: 20px;">
					<label style="font-size: 40px;"><strong>세부 공지사항</strong></label>
					<img alt="" src="resources/images/notice.png"
				style="width: 100px; height: 100px; margin-left: 15px; margin-bottom: 30px;">
				</div>
			</div> -->
			  <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">세부 공지사항</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->
    
			

			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="font-size: 25px;">제목제목</label>
				</div>
			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<label style="width: 50px;">등록일</label> 
					<label style="width: 200px; margin-left: 30px;">2019</label> 
					<label style="width: 50px; margin-left: 20px;">조회수</label> 
					<label style="width: 100px; margin-left: 30px;">0000</label>
				</div>

			</div>
			<div class="row">
				<div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
					<input type="text" class="form-control" id="summernote">
				</div>
			</div>

			<div class="row justify-content-center" style="margin-top: 30px;">
				<a class="btn btn-secondary btn" href="#void" role="button">목록으로</a>
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