<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>

	.wrap{background-color: #120C01}
	.carousel-inner-1{position:relative;width:100%;overflow:hidden; height: 500px}
	.banner{ height: 500px;margin-bottom: 30px }
	.carousel-caption d-none d-md-block{ margin-top: 100px; font-size: 24px }
	.d-block w-100{ height: 500px; width: 100%}
	.intro{ width: 100%; height: 1700px; margin-bottom: 30px }
	.intro-num{ width: 100%; height: 500px}
	.img-frm{ width: 960px; height: 500px ;float: left; margin-bottom: 20px ;margin: 20px }
	.text-1{ color: white; margin-right: 180px;margin-top: 100px }
	
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
	<title>서비스 소개</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>

	
	<div class="wrap">
	<div class="banner">
		<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner-1">
      <div class="carousel-item active">
        <img src="http://localhost:8080/third_prj/resources/images/std1.jpg" class="d-block w-100" alt="..." style="height: 500px;">
        <div class="carousel-caption d-none d-md-block">
          <h2>편리하게 공부해요!</h2>
          <h5>책가방에서 스터디 플래너를 꺼내고 필통을 꺼내느라 바쁘시죠? 노트북, 모바일로 쉽게 관리해요 !</h5>
        </div>
      </div>
      <div class="carousel-item">
        <img src="http://localhost:8080/third_prj/resources/images/std2.jpg" class="d-block w-100" alt="..." style="height: 500px;">
        <div class="carousel-caption d-none d-md-block">
          <h2>함께 공부해요 !</h2>
          <h5>아직도 혼자 공부하세요? 같은 목표를 가진 다양한 친구들과 함께라면 !</h5>
        </div>
      </div>
      <div class="carousel-item">
        <img src="http://localhost:8080/third_prj/resources/images/std3.jpg" class="d-block w-100" alt="..." style="height: 500px;">
        <div class="carousel-caption d-none d-md-block">
          <h2>함께 즐겁게 여유롭게 !</h2>
          <h5>스터디 스토리는 당신의 목표를 응원합니다. 여유롭게 즐거운 스터디 성공을 응원합니다.</h5>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>

<div class="intro">
	<div class="intro-num">
	<img src="http://localhost:8080/third_prj/resources/images/notebook.jpg" class="img-frm" style="margin-left: 50px">
		<div class="text-1" style="float: right; text-align: right;">
          <h3>01. 손끝에서 만들어나가는 미래</h3>
          <p> 현대인들이 선정한 내 일을 망치는 방해요인 1순위 = '스마트폰/스마트기기' <br/>
          멀리하고싶지만 없어서는 안되는 골칫덩어리 스마트폰 !<br/>
          스마트기기를 더욱 더 스마트하게! 사람에게 좀 더 이롭게!<br/>
          스터디 스토리 개발팀은 스마트한 스터디 플랫폼을 만들고자 하였습니다.
          </p>
		</div>
     </div>
	<div class="intro-num">
	<img src="http://localhost:8080/third_prj/resources/images/book.jpg"  class="img-frm" style="float: right; margin-right: 50px">
		<div class="text-1" style="float: left; text-align: left; margin-left: 100px">
          <h3>02. 스터디를 만들어가고 완성시켜주는 플랫폼.</h3>
          <p>스터디 스토리는 스토리를 만들어가고 완성시켜주는 자율 스터디 플랫폼입니다. <br/>
				스터디 개설을 원하는, 스터디에 참여하고 싶은 누구에게든<br/>
				스터디 스토리는 당신의 이야기를 만들어드립니다.
		</div>
     </div>
	<div class="intro-num">
	<img src="http://localhost:8080/third_prj/resources/images/fist.jpg"  class="img-frm"style="margin-left: 50px">
		<div class="text-1" style="float: right; text-align: right;">
          <h3>03. 나와 함께 발전해나가는 스터디 스토리  </h3>
          <p>스터디 스토리는 현재 서울시의 신촌, 홍대, 종각, 건대, 노원, 강남을 범위로 시범 운영중입니다.<br/>
				사용자의 의견을 적극 수렴, 반영하여 함께 발전해나가는  더 나은 서비스를 만들어 나가겠습니다. <br/>
				
          </p>
		</div>
     </div>
	
	
	

	</div>
</div>
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>