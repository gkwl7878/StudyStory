<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

.font20bold {
	font-size: 20px;
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">

<title>상세 스터디 정보</title>
<!-- Custom styles for this template -->
<link href="http://211.63.89.144/resources/css/admin_dashboard.css" rel="stylesheet">
<script src="http://211.63.89.144/resources/js/jquery-3.3.1.slim.min.js"></script>
<script src="http://211.63.89.144/resources/js/bootstrap.bundle.min.js"></script>
<script src="http://211.63.89.144/resources/js/feather.min.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			tabsize : 2,
			height : 200,
			lang : 'ko-KR'
			
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ !loginSession }">
		location.replace("login.do");
		</c:if>
		$("#modifyBtn").click(function() {
			if($("#real_file").val()!=""){
				if(!($("#real_file").val().substr($("#real_file").val().lastIndexOf(".")+1).toLowerCase()=="png"||
						$("#real_file").val().substr($("#real_file").val().lastIndexOf(".")+1).toLowerCase()=="jpg"||
						$("#real_file").val().substr($("#real_file").val().lastIndexOf(".")+1).toLowerCase()=="jpeg"||
						$("#real_file").val().substr($("#real_file").val().lastIndexOf(".")+1).toLowerCase()=="gif")){
					alert("이미지 파일형식이 아닙니다");
					return;
				}
			}
			$("#studyDetailFrm").submit();
		})
		
	});
	<c:if test="${sModifyFlag }">
	alert("스터디 정보가 수정 되었습니다");
	</c:if>
	
	function delete_confirm(){
		return confirm("정말 이 스터디를 삭제하시겠습니까?");
	}
	
	
</script>


<script type="text/javascript">
	function schfile() {
		document.getElementById("real_file").click();
		document.getElementById("file_sub").value = document.getElementById("real_file").value;
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
	<!-- navbar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/navbar.jsp"/>
	<!-- navbar 끝 -->

	<!-- sidebar 시작 -->
	<c:import url="/WEB-INF/views/admin/layout/sidebar.jsp"/>
	<!-- sidebar 끝 -->
	
	<form id="studyDetailFrm" action="study_modify.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="sNum" value="${param.sNum }"/>
	<input type="hidden" name="currPage" value="${param.currPage}"/>
	<input type="hidden" name="searchCondition" value="${param.searchCondition}"/>
	<input type="hidden" name="searchWord" value="${param.searchWord}"/>
	<div class="container form-group" id="wrap">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-10 justify-content-left" style="margin-bottom: 20px;">
				<strong style="font-size: 45px;">상세 스터디 정보 </strong><img src="../resources/images/create.png" style="width: 150px; height: 120px; margin-left: 30px;">
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<label>스터디명</label>
			</div>
			<div class="col-7 " style="margin-bottom: 10px;">
				<label>${studyName}</label>
			</div>
		</div>

		<div class="row">
			<div class="col-3 font20bold">
				<strong>리더</strong>
			</div>
			<div class="col-7 ">
				<label>${id }(${nick })</label>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>주제</strong>
			</div>
			<div class="col-7 font20bold">
				<select class="form-control" id="category" name="category">
					<option ${category eq  "언어"?"selected='selected'":"" } value="언어">언어</option>
					<option ${category eq  "취업"?"selected='selected'":"" } value="취업">취업</option>
					<option ${category eq  "취미"?"selected='selected'":"" } value="취미">취미</option>
					<option ${category eq  "기타"?"selected='selected'":"" } value="기타">기타</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>지역</strong>
			</div>
			<div class="col-7 font20bold">
				<select class="form-control" id="loc" name="loc">
					<option ${loc eq  "신촌"?"selected='selected'":"" } value="신촌">신촌</option>
					<option ${loc eq  "홍대"?"selected='selected'":"" } value="홍대">홍대</option>
					<option ${loc eq  "종각"?"selected='selected'":"" } value="종각">종각</option>
					<option ${loc eq  "건대"?"selected='selected'":"" } value="건대">건대</option>
					<option ${loc eq  "노원"?"selected='selected'":"" } value="노원">노원</option>
					<option ${loc eq  "강남"?"selected='selected'":"" } value="강남">강남</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>참여자 수</strong>
			</div>
			<div class="col-7 ">
				<label>${memberNum} 명 </label>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>생성일</strong>
			</div>
			<div class="col-7 ">
				<label>${inputDate}</label>

			</div>
		</div>

		<div class=" row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<div><strong>스터디 썸네일</strong></div>
				<div style="font-size: 12px; color: #FF0000"><strong>*이미지를 클릭해서 변경</strong></div>
			</div>
			<div class="col-7 font20bold">
				<input type='file' name='file' accept=".png,.jpg,.jpeg,.gif" id='real_file' onchange="previewFile()" style='display: none;' /> 
				<input type="text" id='file_sub' style="width: 600px; border: 0px; display: none"> 
				<a href="<?echo $PHP_SELF;?>" onclick="schfile(); return false;">
				<img width="440" height="300" id="img" src="../study_img/${img}" border="0" title='찾아보기' alt='찾아보기'>
				</a>
			</div>
		</div>

		<div class=" row" style="margin-top: 10px;">
			<div class="col-3 font20bold">
				<strong>상세설명</strong>
			</div>
			<div class="col-7 font20bold" style="width: 440px; height: 300px">
				<!-- <input type="text" class="form-control" id="summernote" /> -->
				<textarea name="content" class="content" id="summernote" ><c:out value="${content }" escapeXml="false"/></textarea>
			</div>
		</div>
		<div class="row" style="margin-top: 30px;">
			<a class="btn btn-secondary btn" href="study_mng.do?currPage=${param.currPage}&searchCondition=${param.searchCondition }&searchWord=${param.searchWord}" role="button" style="margin-left: 250px;">목록으로</a> 
			<input type="button" class="btn btn-secondary btn" value="수정" id="modifyBtn" style="margin-left: 10px;" />
			<a class="btn btn-secondary btn" onclick="return delete_confirm();" href="remove_study_page.do?sNum=${param.sNum}&currPage=${param.currPage}&searchCondition=${param.searchCondition }&searchWord=${param.searchWord}&studyName=${studyName}" role="button" style="margin-left: 10px;">삭제</a>
		</div>
	</div>
	</form>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://211.63.89.144/resources/js/popper.min.js"></script>
	<script src="http://211.63.89.144/resources/js/bootstrap.min.js"></script>

</body>
</html>