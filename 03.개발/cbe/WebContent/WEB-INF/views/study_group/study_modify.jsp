<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">

<title>내 스터디 수정하기</title>
<!-- Custom styles for this template -->

<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">

<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>

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
		
		<c:if test="${ param.info_changed or successFlag }">
		alert("회원정보가 변경되었습니다");
		</c:if>
		
		
		$("#modifyBtn").click(function() {
			
			if ($("#detail").val() == "") {
				alert("스터디의 상세설명을 입력해주세요.");
				$("#detail").focus();
				return;
			}//end if
			$("#modifyFrm").submit();
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
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
		  <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:100px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">내 스터디 수정하기</h1>
       </div>
    </section>
    <!-- 점보트론 : 전광판 -->
<form id="modifyFrm" action="modify_study_process.do" method="post" enctype="multipart/form-data">	
	<div id="wrap">
<input type="hidden" name="s_num" value="${ s_num }"/>
		<div class="row" style="margin-top: 0px;">
			<img alt="" src="/third_prj/resources/images/name.png" style="width: 35px; height: 33px; margin-right: 12px;"><label style="font-size: 20px; margin-right: 20px;"><strong>이름</strong></label>
			<div class="col-sm-10">
				<input id="name" name="name" type="text" class="form-control" style="margin-bottom: 30px;" readonly="readonly" value="${name}">
			</div>
		</div>

		<div class="row">
			<!--margin top주기  -->
			<table>
				<tr>
					<td>
						<img src="/third_prj/resources/images/loc.png" style="width: 33px; height: 33px;">
					</td>
					<td>
						<label style="font-size: 20px; width: 70px; margin-left: 10px; margin-top: 7px;"><strong>지역</strong></label>
					</td>
					<td>
					<input id="loc" name="loc" type="text" class="form-control" style="width: 180px;" readonly="readonly" value="${loc }">
						
					</td>
					<td>
						<img src="/third_prj/resources/images/sub.png" style="width: 33px; height: 33px; margin-left: 30px;">
					</td>
					<td>
						<label style="font-size: 20px; margin-left: 10px; margin-top: 7px;"><strong>주제</strong></label>
					</td>
					<td>
					<input id="category" name="category" type="text" class="form-control" style="width: 250px ;margin-left: 30px;" readonly="readonly" value="${category }">
						
					</td>
				</tr>
			</table>
		</div>

		<div class="row" style="margin-top: 50px;">
			<img src="/third_prj/resources/images/Image.png" style="width: 35px; height: 35px; margin-right: 10px; margin-bottom: 10px;"> <label style="font-size: 20px;">어떤 <strong>대표이미지</strong>로 변경하시겠습니까?
			</label>
			<div class="font20bold">
				<input type='file' name='file' id='real_file' onchange="previewFile()" style='display: none;' /> <input type="text" id='file_sub' style="width: 700px; border: 0px; display: none"> <a href="<?echo $PHP_SELF;?>" onclick="schfile(); return false;">
				<img width="700" height="300" id="img" src="http://localhost:8080/third_prj/study_img/${img }" border="0" title='찾아보기' alt='찾아보기'></a>
			</div>
		</div>

		<div class="row" style="margin-top: 50px;">
			<img src="/third_prj/resources/images/detail.png" style="width: 30px; height: 30px; margin-right: 10px; margin-bottom: 10px;"><label style="font-size: 20px; margin-bottom: 20px;">어떤 <strong>주제</strong>와 <strong>규칙</strong> 으로 변경하시겠습니까?
			</label>
			<div class="" style="width: 700px; height: 300px">
				<textarea class="form-control" id="summernote" name="content">${content }</textarea>
			</div>
		</div>



		<div class="row" style="margin-top: 30px;">
			<button type="button" class="btn btn-secondary btn-lg" onclick="location.href='notice_list_leader.do" style="margin-left: 250px;">취소</button> 
			<input value="수정" type="button" class="btn btn-primary btn-lg" id="modifyBtn" style="right: 100; margin-left: 10px;">
		</div>
	</div>
</form>
	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>



</body>
</html>