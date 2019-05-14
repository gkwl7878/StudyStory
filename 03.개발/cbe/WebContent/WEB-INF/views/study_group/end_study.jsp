<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 0px auto;
	width: 1000px;
	min-height: 800px
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css" />
<title>스터디 활동 종료</title>
<!-- Custom styles for this template -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	
	<c:if test="${failFlag}">
		alert("활동종료에 실패했습니다.");
	</c:if>
	
  	$("#endBtn").click(function() {
  		var reason=$("#reason").val();
  		
  		if(reason=="") {
  			alert("스터디 종료 이유를 입력해주세요");
  			$("#reason").focus();
  			return
  		}
  		if(confirm("정말 스터디 활동을 종료하시겠습니까?")) {
  			$("#endFrm").submit();
  		}
  	});
});
</script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  -->

	<div id="wrap">
		<form action="../study_group/end_study_process.do" method="post" id="endFrm" >

			<input type="hidden" value="${ param.sNum }" name="sNum"/>
			<br />
			<br />
			<div style="width: 920px; border: 1px solid #D7D7D7; padding: 40px;">
				<br />
				<br />
				<h1>
					<Strong>정말 이 스터디의 활동을 종료하시겠습니까?</Strong>
				</h1>
				<hr color="gray">
				<h5>스터디의 활동 종료 이유를 참여한 회원들에게 알려주세요.</h5>
				<br />
				<textarea id="reason" name="reason" class="form-control" rows="4" style="resize: none; height: 180px;" placeholder="내용을 입력해주세요."></textarea>
				<br />

				<br />
				<a class="btn btn-secondary btn-lg" href="#void" role="button" onclick="location.href='study_group/my_study.do'">돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button" class="btn btn-secondary btn-lg" id="endBtn" value="스터디 활동종료"/>
			</div>
		</form>
	</div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://211.63.89.144/resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="http://211.63.89.144/resources/js/popper.min.js"></script>
	<script src="http://211.63.89.144/resources/js/bootstrap.min.js"></script>



</body>
</html>