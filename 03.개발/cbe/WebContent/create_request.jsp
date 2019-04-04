<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	margin: 100px auto;
	width: 800px;
	min-height: 800px;
	
}
/* #link{margin-left: 1000px; margin-top: 20px} */
#loginTitle {
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">

<title>요청 완료</title>
<!-- Custom styles for this template -->


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  -->



	<div id="wrap">
		<form>
			<label style="font-size: 60px; margin-top: 150px; text-align: center;">
				요청이 <strong>완료</strong>되었습니다.
			</label>
			<label style="font-size: 30px; margin-top: 100px; text-align: center;">
				빠른 시일 내에 승인요청 처리를 완료하겠습니다.
			</label>
			<label style="font-size: 40px; margin-top: 50px; text-align: left;">
				<strong>마이페이지</strong>에서 확인해주세요
			</label>
			<label style="font-size: 20px; margin-top: 50px; text-align: left;">
				궁금한 사항이 있으실 경우 <a id="" href="#void" class="link" target="_blank">자주묻는
					질문</a>을 확인해주세요. <br/>그 외 추가적인 문의사항은 <a id="" href="#void" class="link"
					target="_blank">관리자의 문의사항</a>을 이용해주세요.
			</label>

			<div class="row" style="margin-top: 50px; margin-left: 80px;">
			<a class="btn btn-secondary btn-lg" href="#void"
				role="button" >메인으로 가기</a> 
				<a class="btn btn-primary btn-lg"
				href="#void" role="button" style="margin-left: 30px;">마이페이지로 가기</a>
			</div>	
		</form>
	</div>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="./Resources/js/popper.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>



</body>
</html>