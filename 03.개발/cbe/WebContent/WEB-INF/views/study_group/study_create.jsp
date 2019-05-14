<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#wrap {
		margin: 100px auto;
		width: 700px;
		min-height: 800px
	}
	#loginTitle {
		text-align: center;
		st
	}
	.font30 {
		font-size: 30px;
	}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>
<link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<title>스터디그룹 개설하기</title>
<script src="http://211.63.89.144/resources/js/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript">
	$(function() {
		var nameFlag= true;
		
		<c:if test="${ createFailFlag }">
			alert("스터디 생성에 실패했습니다. 잠시 후에 다시 시도해주세요");
		</c:if>
		
		$("#study_name").keyup(function(){
			var queryString = "study_name="+$("#study_name").val();
			
			$.ajax({
				url:"check_dup_study_name.do",
				data:queryString,
				dataType:"json",
				type:"get",
				async:true,
			  error:function(xhr) {
           alert("문제발생 "+xhr.status);
        },
        success:function(json_obj){
	       	 if(json_obj.dupFlag) {
	       		$("#dupStudyNameMsg").html("<span style='color:#FF0000'>"+json_obj.msg+"</span>");
	       		nameFlag = true;
	       	 } else {
	       		$("#dupStudyNameMsg").html("<span style='color:#0F68B1'>"+json_obj.msg+"</span>");
	       		nameFlag = false;
	       	 }
        }
			});//ajax
		});
		
		$("#createBtn").click(function() {
		
			var category=$("#category").val()
	
			if (category == "none") {
				alert("주제를 선택해주세요.");
				$("#category").focus();
				return;
			}//end if
			
			var loc = $("#loc").val();
			
			if (loc == "none") {
				alert("지역을 선택해주세요.");
				$("#loc").focus();
				return;
			}//end if
			
			var study_name = $("#study_name").val();
			
			if (study_name == "") {
				alert("스터디 이름을 입력해주세요.");
				$("#study_name").focus();
				return;
			}//end if
			
			var content = $("#summernote").val();
			
			if (content == "") {
				alert("스터디의 상세설명을 입력해주세요.");
				return;
			}//end if
			
			var file = $("#real_file").val();
			
			if (file == "") {
				alert("파일을 선택해주세요");
				return;
			}
			
			if (nameFlag) {
				alert("중복된 스터디명이 존재합니다. 변경해주세요");
				$("#study_name").focus();
				return;
			}
			
			$("#createFrm").submit();
		});//click
	});//ready
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
<!-- header -->
<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
<!--  -->
<form id="createFrm" action="create_study_process.do" method="post" enctype="multipart/form-data">	
	<div id="wrap">
		 <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">스터디 그룹 개설하기</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->
		
			<div class="form-group" style="margin-bottom: 70px; margin-top: 40px;" >

				<img alt="" src="http://211.63.89.144/resources/images/sub.png"
					style="width: 50px; height: 50px; margin-bottom: 20px; margin-right: 15px;">
				<label class="font30">어떤 <strong>주제</strong> 와 관련된 스터디인가요?
				</label> <select class="form-control" id="category" name="category">
					<option value="none">주제를 선택해주세요</option>
					<option value="언어" >언어</option>
					<option value="취업">취업</option>
					<option value="취미">취미</option>
					<option value="기타">기타</option>
				</select>
			</div>

			<div class="form-group" style="margin-bottom: 70px;">
				<img alt="" src="http://211.63.89.144/resources/images/loc.png" style="width: 50px; height: 50px; margin-bottom: 20px; margin-right: 15px;"> <label class="font30">새로운 스터디 그룹의 주 <strong>지역</strong>은 어디인가요?
				</label>
				<select class="form-control" id="loc" name="loc">
					<option value="none">지역을 선택해주세요</option>
					<option value="신촌">신촌</option>
					<option value="홍대">홍대</option>
					<option value="종각">종각</option>
					<option value="건대">건대</option>
					<option value="노원">노원</option>
					<option value="강남">강남</option>
				</select>
			</div>

			<div class="form-group" style="margin-bottom: 70px;">
				<img alt="" src="http://211.63.89.144/resources/images/name.png" style="width: 50px; height: 50px; margin-bottom: 20px; margin-right: 15px;"> <label class="font30">스터디의 <strong>이름</strong>을 정해주세요
				</label> <input type="text" class="form-control" maxlength="24" id="study_name" name="study_name" placeholder="스터디의 이름을 입력해주세요(24자까지 입력가능합니다.)">
				<span id="dupStudyNameMsg"></span>
			</div>

			<div class="form-group" style="margin-bottom: 70px;">
				<img alt="" src="http://211.63.89.144/resources/images/Image.png" style="width: 50px; height: 50px; margin-bottom: 20px; margin-right: 15px;"> <label for="exampleFormControlTextarea1" style="font-size: 30px;"> <strong>대표이미지</strong>를 선택해주세요
				</label>
				<div class="input-group mb-3">
					<input type='file' name='file' id='real_file' onchange="previewFile()" style='display: none;' /> <input type="text" id='file_sub' style="width: 700px; border: 0px; display: none" readonly="readonly"><a href="<?echo $PHP_SELF;?>" onclick="schfile(); return false;"><img width="700" height="300" id="img" src="http://211.63.89.144/resources/images/preview_Image.png" border="0" title='찾아보기' alt='찾아보기'></a>
				</div>
			</div>

			<div class="form-group" style="margin-bottom: 70px;">
				<img alt="" src="http://211.63.89.144/resources/images/detail.png" style="width: 50px; height: 50px; margin-bottom: 20px; margin-right: 15px;"> <label style="font-size: 26px;">스터디 <strong>주제</strong>와 이 방의 <strong>규칙</strong>등을 자세히 설명해주세요
				</label>
				<div style="resize: none; width: 700px; height: 300px;">
					<textarea name="content" class="form-control" id="summernote"></textarea>
				</div>
			</div>

			<div class="row" style="margin-bottom: 60px;">
			
				<a onclick="history.back()" class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 250px; margin-right: 10px;">취소</a> 
				<input type="button" value="승인요청" class="btn btn-primary btn-lg" id="createBtn" style="right: 100">
			</div>
	</div>
</form>
<!-- footer -->
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	
	
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="http://211.63.89.144/resources/js/popper.min.js"></script>
<script src="http://211.63.89.144/resources/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>

<script type="text/javascript">
	$('#summernote').summernote({
		placeholder : '공지사항입니다  :)',
		tabsize : 2,
		height : 200,
		lang : 'ko-KR',
	});
</script>
</body>
</html>







































