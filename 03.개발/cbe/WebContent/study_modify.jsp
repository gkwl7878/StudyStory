<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
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

  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>

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

	
	
	<div id="wrap" >
		<form action="create_request.jsp" name="createFrm">
		 <br/>
		 <br/>
		<label id="title"><strong>내 스터디 수정하기</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="Resources/images/create.png" style="width: 150px; height: 120px;">
		<br/>
		<br/>
		 <br/>
 <div class="form-group row">
    <img alt="" src="Resources/images/subject.png" style="width: 30px; height: 30px;">&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>이름</strong></label>
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="스터디명" style="width: 610px;">
    </div>
  </div>		
 <br/>

  <div class="row">
    <div class="col">
    <img alt="" src="Resources/images/loc.png" style="width: 30px; height: 30px; ">&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>지역</strong></label>
      <input type="text" class="form-control" placeholder="지역" style="width: 200px;" />
    </div>
    <div class="col">
    <img alt="" src="Resources/images/sub.png" style="width: 30px; height: 30px;">&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" style="font-size: 20px;"><strong>주제</strong></label>
      <input type="text" class="form-control" placeholder="주제" style="width: 450px;">
    </div>
  </div>



<br/>
<br/>
<br/>
  <div class="form-group">
    <img alt="" src="Resources/images/detail.png" style="width: 30px; height: 30px;">&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" style="font-size: 20px;">어떤 <span style="font-weight: bold;">주제</span>와  <span style="font-weight: bold;">규칙</span> 으로 변경하시겠습니까?</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="width: 700px; height: 200px;" class="form_control"  name="contents" id="summernote" placeholder="스터디의 상세설명을 입력해주세요"></textarea>
  </div>
	<br/>
	<br/>
	<br/>
	
  <div class="form-group">
    <label for="exampleFormControlTextarea1" style="font-size: 20px;">어떤&nbsp;<strong>대표이미지</strong>로 변경하시겠습니까?</label>
	<div class="input-group mb-3">
  <input type='file' name='file' id='real_file' onchange="previewFile()"  style='display:none; ' />
	<input type="text" id='file_sub' style="width:700px; border:0px; display: none" readonly="readonly" ;>

<a href="<?echo $PHP_SELF;?>" onclick="schfile(); return false;"><img  width="700" height="300" id="img" src="Resources/images/Image.png" border="0" title='찾아보기' alt='찾아보기'></a>
</div>
  </div>
  <br/>
	<br/>
	<br/>
	 <a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 250px;" >취소</a> 
	<a class="btn btn-primary btn-lg" href="#void" role="button" id="request" style="right: 100">수정</a>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>