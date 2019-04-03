<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 800px; min-height: 800px}
	/* #link{margin-left: 1000px; margin-top: 20px} */
	#loginTitle{text-align: center; st}

.font17bold {
		font-size:17px;
		font-weight:bold;
	}
	
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>Bootstrap Template By Young</title>
  <!-- Custom styles for this template -->

  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>

	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script> 


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
  <script type="text/javascript">
  $(function() {
  	$("#request").click(function (){
  		if($("#subject").val()=="") {
  			alert("주제를 선택해주세요.");
  			$("#subject").focus();
  			return;
  		}//end if
  		if($("#loc").val()=="") {
  			alert("지역을 선택해주세요.");
  			$("#loc").focus();
  			return;
  		}//end if
  		if($("#name").val()=="") {
  			alert("스터디 이름을 입력해주세요.");
  			$("#name").focus();
  			return;
  		}//end if
  		if($("#detail").val()=="") {
  			alert("스터디의 상세설명을 입력해주세요.");
  			$("#detail").focus();
  			return;
  		}//end if
  	
  	});//click
  });//ready
  </script>
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
	
	<form action="create_request.jsp" name="createFrm">
	<div class="container form-group" id="wrap" >
		<div class="row">
			<div class="col-12 justify-content-left" style="margin-bottom: 20px;">
				<h2><strong >관리자에게 문의하기</strong></h2>
			</div>
		</div>

		
			
	  <div class="row" style="margin-top: 30px;">
    <div class="col-5" style="margin-left: 100px; ">
			<label class="font17bold" ><strong>문의 제목 </strong> </label>
    </div>
    <div class="col-4" >
			<label class="font17bold" ><strong>문의 분류 </strong> </label>
    </div>
  </div>
  
  <div class="row">
    <div class="col-5" style="margin-left: 100px;">
      <input type="text" class=" form-control"  name="contents"  placeholder="제목을 입력해주세요(100자 이내)">
    </div>
    <div class="col-4" >
     <select class="custom-select">
		  <option selected>분류 선택</option>
		  <option value="회원정보 관련">회원정보 관련</option>
		  <option value="스터디 관련">스터디 관련</option>
		  <option value="홈페이지 관련">홈페이지 관련</option>
		  <option value="기타">기타</option>
	</select>
    </div>
  </div>
			
		<div class="row">
		    <div class="col-9" style="margin-top: 10px; margin-left: 100px;">
				<label class=" font17bold" ><strong>문의내용 </strong> </label>
			</div>
		    <div class="col-9" >
    			<textarea style="margin-left: 100px; height: 200px;" class=" form-control" rows="3" name="contents" placeholder="자세한 내용을 입력해주세요"></textarea>
			</div>
  			</div>  
				
		
			 	<a class="btn btn-secondary btn" href="#void" role="button" style= "margin-top: 30px; margin-left: 300px;" >돌아가기</a> 
			 	<a class="btn btn-secondary btn" href="#void" role="button" style="margin-top: 30px; margin-left: 10px;" >문의하기</a> 
	</div>
</form>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>