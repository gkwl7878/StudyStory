<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#wrap {
	padding-top:80px;
	margin: 100px auto;
	width: 800px;
	min-height: 400px;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
<title>요청 완료</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"></c:import>
	<!--  -->

	<div id="wrap">
		<div class="row">
			<div class="col text-center">
				<h2>요청이 <strong>완료</strong>되었습니다</h2><br/>
				<label>빠른 시일 내에 승인요청 처리를 완료하겠습니다</label><br/>
				<label>신청상태 확인은 <strong>마이페이지</strong>에서 확인해주세요</label><br/>
				<label>궁금한 사항이 있으실 경우 <a href="../common/faq.do" class="link" target="_blank">자주묻는
						질문</a>을 확인해주세요. <br/>그 외 추가적인 문의사항은 <a id="" href="../common_bbs/ask.do" class="link"
						target="_blank">관리자에게 문의하기</a>를 이용해주세요
				</label>
			</div>
		</div>
		<div class="row" style="margin-top: 50px;">
			<div class="col text-center">
				<a class="btn btn-secondary" href="../study_info/main.do" role="button" >메인으로 가기</a> 
				<a class="btn btn-primary" href="../study_group/study_i_made.do" role="button" style="margin-left: 30px;">내가 만든 스터디로 가기</a>
			</div>
		</div>	
	</div>

	<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="/third_prj/resources/js/popper.min.js"></script>
	<script src="/third_prj/resources/js/bootstrap.min.js"></script>
</body>
</html>