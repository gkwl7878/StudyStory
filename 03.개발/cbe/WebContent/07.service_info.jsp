<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>

	#wrap{margin:100px auto; width: 700px; min-height: 800px}
	.carousel-inner-1{position:relative;width:100%;overflow:hidden; height: 500px}
	.banner{ height: 500px; }
	.carousel-caption d-none d-md-block{ margin-top: 100px }
	.d-block w-100{ height: 500px; width: 100%}
	.intro{ width: 100%; height: 1500px; margin-bottom: 50px }
	
</style>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
  
	<title>서비스 소개</title>
  <!-- Custom styles for this template -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>

	
	
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
        <img src="http://localhost:8080/third_prj/Resources/images/std1.jpg" class="d-block w-100" alt="..." style="height: 500px;">
        <div class="carousel-caption d-none d-md-block">
          <h5>편리하게 공부해요!</h5>
          <p>책가방에서 스터디 플래너를 꺼내고 필통을 꺼내느라 바쁘시죠? 노트북, 모바일로 쉽게 관리해요 !</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="http://localhost:8080/third_prj/Resources/images/std2.jpg" class="d-block w-100" alt="..." style="height: 500px;">
        <div class="carousel-caption d-none d-md-block">
          <h5>함께 공부해요 !</h5>
          <p>아직도 혼자 공부하세요? 같은 목표를 가진 다양한 친구들과 함께라면 !</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="http://localhost:8080/third_prj/Resources/images/std3.jpg" class="d-block w-100" alt="..." style="height: 500px;">
        <div class="carousel-caption d-none d-md-block">
          <h5>함께 즐겁게 여유롭게 !</h5>
          <p>스터디 스토리는 당신의 목표를 응원합니다. 여유롭게 즐거운 스터디 성공을 응원합니다.</p>
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
	<img src="">

</div>

	
		<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="./Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="./Resources/js/popper.min.js" ></script>
  <script src="./Resources/js/bootstrap.min.js" ></script>
	

	
</body>
</html>