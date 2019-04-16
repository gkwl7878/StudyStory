<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
	#wrap{margin:100px auto; width: 700px; min-height: 800px}
table{ width: 100%; text-align: center;  }
th,td{ text-align: center; }
div{margin: 0px auto;}
.info{border: 0 ; padding: 30px ;text-align: center; margin-bottom: 30px; margin-top: 30px; background-color: #E9ECEF; height: 80px ;width: 100%; font:x-large bolder;}
.form-control-1{width:100px;height:calc(1.5em + .75rem + 2px);padding:.375rem .75rem;font-size:1rem;font-weight:400;line-height:1.5;color:#495057;background-color:#fff;background-clip:padding-box;border:1px solid #ced4da;border-radius:.25rem;transition:border-color .15s ease-in-out,box-shadow .15s ease-in-out; margin-left: 20px}
/* form-control 부트스트랩 내용에서 width 100% 를 수정 */
/* .table td, .table th{ vertical-align: middle; } */

</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
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
		 <div style= "width: 920px; height: 1100px; border:1px solid #D7D7D7; padding:30px ; ">
		<!-- <h3><strong>스터디 참여 신청</strong></h3> -->
		<!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">스터디 참여 신청</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->
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
    <tr style="vertical-align: middle;">
      <td scope="row"><img src="http://localhost:8080/third_prj/resources/images/no_pic.png"><br/>한지민</td>
      <td style="vertical-align: middle;"><strong>영어 같이 해봐요! <br/>노하우 만땅 리더의 특급모임</strong></td>
      <td style="vertical-align: middle;">호주, 뉴질랜드, 영국, 미국, 인도, 필리핀 영어까지 한번에 정복!</td>
    </tr>
  </tbody>
</table>
		
		<h2 align="center" style="margin-top: 30px;"><strong>김신규( abcd123 )</strong>님 !</h2><br/>
		<h4 align="center">모임이 당신을 궁금해합니다!</h4>
		
		<div class="info">
		자기소개를 부탁드립니다.
		</div>
		
		
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="4" style="resize: none" placeholder="자기소개는 100자 이상 입력해주세요.";></textarea>
				
		<div class="info" >이 모임에 지원하게된 동기가 무엇인가요? </div>
		
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="4" style="resize: none" placeholder="지원동기는 100자 이상 입력해주세요.";></textarea>
				
  
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
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>