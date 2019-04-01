<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
table{ width: 100%; text-align: center;  }
th,td{  }
div{margin: 0px auto;}
.info{border: 1px solid #BFC8D0 ; padding: 50px ;text-align: center; margin-bottom: 50px; margin-top: 30px}
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
  <title>스터디 참여 신청</title>
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
		<form>
		 <div style= "width: 920px; height: 1400px; border:1px solid #D7D7D7; padding:40px ; ">
		<h3><strong>스터디 참여 신청</strong></h3>
		<div>
		</div>
		<hr  color="gray" >
		
		<table class="table"  style="border:1px solid #E9ECEF">
  <thead class="thead-light">
    <tr>
      <th scope="col"  >리더명</th>
      <th scope="col" >제목</th>
      <th scope="col" >간략소개</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><img src="http://localhost:8080/third_prj/Resources/images/no_pic.png"><br/>한지민</th>
      <td valign="middle"><strong>영어 같이 해봐요! <br/>노하우 만땅 리더의 특급모임</strong></td>
      <td>호주, 뉴질랜드, 영국, 미국, 인도, 필리핀 영어까지 한번에 정복!</td>
    </tr>
  </tbody>
</table>
		
		<h1 align="center" style="margin-top: 30px;"><strong>김신규</strong>님 !</h1><br/>
		<h3 align="center">모임이 당신을 궁금해합니다!</h3>
		
		<div class="info" ><h3>자기소개를 부탁드립니다. </h3></div>
		
		<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
				placeholder="자기소개는 100자 이상 입력해주세요." ;>
				
		<div class="info" ><h3>이 모임에 지원하게된 동기가 무엇인가요? </h3></div>
		
		<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
				placeholder="지원동기는 100자 이상 입력해주세요." ;>
				
		<div class="info" ><h3>연락가능한 연락처를 적어주세요! </h3></div>
		<span>연락처
		<input type="tel" class="form-control"  width="50px"></span>
  
  </div>
  <div>
  <a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 50%; margin-top: 15px">돌아가기</a>
  <a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin-left: 10px; margin-top: 15px">참여하기</a>
  </div>
</form>
	</div>
	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>