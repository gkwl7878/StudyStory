<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
	.form-control-1{display:block;width:100%;height:150px;padding:.375rem .75rem;font-size:1rem;font-weight:400;line-height:1.5;color:#495057;background-color:#fff;background-clip:padding-box;border:1px solid #ced4da;border-radius:.25rem;transition:border-color .15s ease-in-out,box-shadow .15s ease-in-out ; overflow: hidden;}
/* input type text 의 height을 변경해줌. */
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
  
  <title>스터디 탈퇴</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->

	
	
	<div id="wrap" >
		<form action="study_group/leave_study.do" method="post">
		 <br/><br/>
		 <div style="border:1px solid #D7D7D7; padding:40px"><br/><br/>
		<h1 ><Strong>정말 이 스터디를 탈퇴하시겠어요?</Strong></h1>
		<hr  color="gray" >
		<h5>이 스터디를 탈퇴하는 이유가 무엇인지 리더에게 알려주세요.</h5>
		<br/>
		  <div class="form-group">
		  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="reason"
				placeholder="내용을 입력해주세요.">
    <!-- <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" style="resize: none" placeholder="내용을 입력해주세요.";></textarea> -->
  </div>
	
  <a class="btn btn-secondary btn-lg" href="#void" role="button" >돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a class="btn btn-secondary btn-lg" href="#void" role="button">스터디 탈퇴</a>
  </div>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>