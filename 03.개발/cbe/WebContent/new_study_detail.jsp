<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 600px; min-height: 800px}
	/* #link{margin-left: 1000px; margin-top: 20px} */
	#loginTitle{text-align: center; st}
	#request{left: 300px;}
	#title{font-size: 45px;}
	#sub_title{}

</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>Bootstrap Template By Young</title>
  <!-- Custom styles for this template -->



  <link href="../Resources/summernote/bootstrap.css" rel="stylesheet">
  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="../Resources/summernote/bootstrap.js"></script>
  
  
  
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script> -->
  
 <!-- include summernote css/js -->
 <!-- include summernote css/js -->


  <script type="text/javascript">
/* $(function() {
	  $('#summernote').summernote({
		  	placeholder: '이벤트를 작성해주세요.',
	        tabsize: 2,
	        height: 150,
	        width: 390,
	        lang: 'ko-KR'
	  });
	}); */
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
	  var preview = document.querySelector('img');
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

	
	
	<div id="wrap" >
		<form action="create_request.jsp" name="createFrm">
		 <br/>
		 <br/>
		<label id="title"><strong>새 스터디 상세 정보</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="Resources/images/create.png" style="width: 150px; height: 120px;">
		<br/>
		<br/>
		 <br/>
 <div class="form-group row">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>번호</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="번호" style="width: 500px;" readonly="readonly">
    </div>
  </div>		
 <div class="form-group row">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>리더</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="리더" style="width: 500px;" readonly="readonly">
    </div>
  </div>		
 <div class="form-group row">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>주제</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="주제" style="width: 500px;" readonly="readonly">
    </div>
  </div>		
 <div class="form-group row">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>지역</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="지역" style="width: 500px;" readonly="readonly">
    </div>
  </div>		
 <div class="form-group row">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>스터디명</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="스터디명" style="width: 500px;" readonly="readonly">
    </div>
  </div>		
 <div class="form-group row">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>생성일</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="생서일" style="width: 500px;" readonly="readonly">
    </div>
  </div>		
  <br/>
 <div class="form-group row">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>대표썸네일</strong></label>&nbsp;
	<div class="col-sm-10">
  <input type='file' name='file' id='real_file' onchange="previewFile()"  style='display:none; ' />
	<input type="text" id='file_sub' style="width:600px; border:0px; display: none" readonly="readonly" ;>

<a href="<?echo $PHP_SELF;?>" onclick="schfile(); return false;"><img  width="500" height="300" id="img" src="Resources/images/Image.png" border="0" title='찾아보기' alt='찾아보기'></a>
</div>
  </div>
<br/>
<br/>
 <div class="form-group row">
   <label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>상세설명</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
    
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="width: 500px; height: 300px;" class="form_control"  name="contents" id="summernote" placeholder="스터디의 상세설명을 입력해주세요"></textarea>
  </div>



  <br/>
	<br/>
	<br/>
	 <a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 200px;" >목록으로</a> 
	<a class="btn btn-secondary btn-lg" href="#void" role="button" id="request" style="margin: 0px auto; ">수락</a>
	<a class="btn btn-secondary btn-lg" href="#void" role="button" id="request" style="; ">거절</a>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>