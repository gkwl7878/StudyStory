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

.font20bold {
	font-size: 20px;
	font-weight: bold;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">

<title>Bootstrap Template By Young</title>
<!-- Custom styles for this template -->

<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>


<script type="text/javascript">
  function schfile(){
	  document.getElementById("real_file").click();
	  document.getElementById("file_sub").value = document.getElementById("real_file").value;
	 }
  function previewFile() {
	  var preview = document.querySelector('#img');
	  var file    = document.querySelector('input[type=file]').files[0];
	  var reader  = new FileReader();

	  reader.addEventListener("load", function () {
	    preview.src = reader.result;
	  }, false);

	  if (file) {
	    reader.readAsDataURL(file);
	  }
	} 
  </script>

</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->


	<div class="container form-group" id="wrap">
		<div class="row">
			<div class="col-12 justify-content-left"
				style="margin-bottom: 20px; ">
				<strong style="font-size: 45px;">상세 스터디 정보</strong><img
					src="Resources/images/create.png"
					style="width: 150px; height: 120px; margin-left: 30px;">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<label>스터디명</label>
			</div>
			<div class="col-7 " style="margin-bottom: 10px;">
				<label>스터디명스터디명</label>
			</div>
		</div>

		<div class="row">
			<div class="col-3 font20bold">
				<strong>리더</strong>
			</div>
			<div class="col-7 ">
				<label>리더뽀로로</label>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>주제</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="password" class="form-control" placeholder="주제">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>지역</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" placeholder="지역">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>참여자 수</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" placeholder="참여자 수">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>생성일</strong>
			</div>
			<div class="col-7 font20bold">
				<input type="text" class="form-control" placeholder="생성일">
			</div>
		</div>

		<div class=" row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>스터디 썸네일</strong>
			</div>
			<div class="col-7 font20bold">
				<input type='file' name='file' id='real_file'
					onchange="previewFile()" style='display: none;' /> <input
					type="text" id='file_sub'
					style="width: 600px; border: 0px; display: none"> <a
					href="<?echo $PHP_SELF;?>" onclick="schfile(); return false;"><img
					width="440" height="300" id="img" src="Resources/images/Image.png"
					border="0" title='찾아보기' alt='찾아보기'></a>
			</div>
		</div>

		<div class=" row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>상세설명</strong>
			</div>
			<div class="col-7 font20bold">
				<textarea class="form-control" rows="3"
					style="resize: none; width: 440px; height: 300px;" name="contents"></textarea>
			</div>
		</div>
		<div class="row" style="margin-top: 30px;">
			<a class="btn btn-secondary btn" href="#void" role="button"
				style="margin-left: 180px;">목록으로</a> <a
				class="btn btn-secondary btn" href="#void" role="button"
				style="margin-left: 10px;">수정</a> <a class="btn btn-secondary btn"
				href="#void" role="button" style="margin-left: 10px;">탈퇴</a>
		</div>
	</div>
	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>



</body>
</html>