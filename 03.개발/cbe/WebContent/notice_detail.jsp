<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 800px; min-height: 800px}
	/* #link{margin-left: 1000px; margin-top: 20px} */
	#loginTitle{text-align: center; st}


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
				<h2><strong>세부 공지사항</strong></h2>
			</div>
		</div>

		 <div class="row">
		    <div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
		       <label style="font-size: 25px;">제목제목</label>
		    </div>
		  </div>		
		<div class="row">
		    <div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
				<label style="width: 50px; ">등록일</label>
				<label style="width: 200px; margin-left: 30px;">2019</label>
				<label style="width: 100px; margin-left: 20px;">조회수</label>
				<label style="width: 100px; margin-left: 50px;">0000</label>
		    </div>
				
			</div>
		 <div class="row">
		    <div class="col-9 " style="margin-top: 10px; margin-left: 100px;">
		       <input type="text" class="form-control"  id="summernote">
		    </div>
		  </div>		
		
	
	 <a class="btn btn-secondary btn" href="#void" role="button" style="margin-left: 330px; margin-top: 30px;" >목록으로</a> 
	</div>
</form>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>