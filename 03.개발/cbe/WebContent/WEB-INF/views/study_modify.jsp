<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 700px;
	min-height: 800px
}
/* #link{margin-left: 1000px; margin-top: 20px} */
#loginTitle {
	text-align: center;
	st
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">

<title>내 스터디 수정하기</title>
<!-- Custom styles for this template -->

<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			placeholder : '공지사항입니다  :)',
			tabsize : 2,
			height : 200,
			lang : 'ko-KR'
		});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#request").click(function() {
			if ($("#subject").val() == "") {
				alert("주제를 선택해주세요.");
				$("#subject").focus();
				return;
			}//end if
			if ($("#loc").val() == "") {
				alert("지역을 선택해주세요.");
				$("#loc").focus();
				return;
			}//end if
			if ($("#name").val() == "") {
				alert("스터디 이름을 입력해주세요.");
				$("#name").focus();
				return;
			}//end if
			if ($("#detail").val() == "") {
				alert("스터디의 상세설명을 입력해주세요.");
				$("#detail").focus();
				return;
			}//end if

		});//click
	});//ready
</script>
<script type="text/javascript">
	function schfile() {
		document.getElementById("real_file").click();
		document.getElementById("file_sub").value = document
				.getElementById("real_file").value;
	}
	function previewFile() {
		var preview = document.querySelector('#img');
		var file = document.querySelector('input[type=file]').files[0];
		var reader = new FileReader();

		reader.addEventListener("load", function() {
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

	<div id="wrap">

		<div class="row" >
			<div class="col-12 justify-content-left" style="margin-bottom: 20px; margin-top:15px;  padding: 0px;">
				<strong style="font-size: 45px;">내 스터디 수정하기</strong><img
					src="Resources/images/create.png"
					style="width: 150px; height: 120px; margin-left: 30px;">
			</div>
		</div>

		<div class="row" style="margin-top: 30px;">
			<img alt="" src="Resources/images/name.png"
				style="width: 35px; height: 33px; margin-right: 12px;"><label
				style="font-size: 20px; margin-right: 20px;"><strong>이름</strong></label>
			<div class="col-sm-10">
				<input type="text" class="form-control" style="margin-bottom: 30px;">
			</div>
		</div>

		<div class="row">
			<!--margin top주기  -->
			<table>
				<tr>
					<td><img src="Resources/images/loc.png"
						style="width: 33px; height: 33px; "></td>
					<td><label
						style="font-size: 20px; width: 70px; margin-left: 10px; margin-top: 7px;"><strong>지역</strong></label>
					</td>
					<td><select class="form-control" id="subject"
						style="width: 180px;">
							<option value="언어">언어</option>
							<option value="취업">취업</option>
							<option value="취미">취미</option>
							<option value="기타">기타</option>
					</select></td>
					<td><img alt="" src="Resources/images/sub.png"
						style="width: 33px; height: 33px; margin-left: 30px;"></td>
					<td><label
						style="font-size: 20px; margin-left: 10px; margin-top: 7px;"><strong>주제</strong></label>
					</td>
					<td><select class="form-control" id="loc"
						style="width: 250px; margin-left: 30px;">
							<option value="신촌">신촌</option>
							<option value="홍대">홍대</option>
							<option value="종각">종각</option>
							<option value="건대">건대</option>
							<option value="노원">노원</option>
							<option value="강남">강남</option>
					</select></td>
				</tr>
			</table>
		</div>

		<div class="row" style="margin-top: 50px;">
		<img src="Resources/images/Image.png"
				style="width: 35px; height: 35px; margin-right: 10px; margin-bottom: 10px;">
			<label style="font-size: 20px;">어떤 <strong>대표이미지</strong>로
				변경하시겠습니까?
			</label>
			<div class="font20bold">
				<input type='file' name='file' id='real_file'
					onchange="previewFile()" style='display: none;' /> <input
					type="text" id='file_sub'
					style="width: 700px; border: 0px; display: none"> <a
					href="<?echo $PHP_SELF;?>" onclick="schfile(); return false;"><img
					width="700" height="300" id="img" src="Resources/images/preview_Image.png"
					border="0" title='찾아보기' alt='찾아보기'></a>
			</div>
		</div>

		<div class="row" style="margin-top: 50px;">
			<img src="Resources/images/detail.png"
				style="width: 30px; height: 30px; margin-right: 10px; margin-bottom: 10px;"><label
				style="font-size: 20px; margin-bottom: 20px;">어떤 <strong>주제</strong>와
				<strong>규칙</strong> 으로 변경하시겠습니까?
			</label>
			<div class="" style="width: 700px; height: 300px">
				<input type="text" class="form-control" id="summernote">
			</div>
		</div>



		<div class="row" style="margin-top: 30px;">
			<a class="btn btn-secondary btn-lg" href="#void" role="button"
				style="margin-left: 250px;">취소</a> <a class="btn btn-primary btn-lg"
				href="#void" role="button" id="request" style="right: 100; margin-left: 10px;">수정</a>
		</div>
	</div>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>



</body>
</html>