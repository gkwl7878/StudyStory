<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"  href="http://localhost:8080/html_prj/common/css/main_v190130.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
</script>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 	<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css">
  
	<title>스터디 상세 정보</title>
 <style>
   .bd-placeholder-img {
     font-size: 1.125rem;
     text-anchor: middle;
     -webkit-user-select: none;
     -moz-user-select: none;
     -ms-user-select: none;
     user-select: none;
   }
   .bigBtn{
  		height: 50px;
  	}
  	.btn-adjust {
  		height:37px; width: 120px
  	}

  	
   @media (min-width: 768px) {
    .bd-placeholder-img-lg {
       font-size: 3.5rem;
    }
    
    .title{width:500px; margin:0px auto; text-align: center;}
    .likeLabel{text-align: right;}
    
    
 </style>
  <!-- Custom styles for this template -->
  <link href="http://localhost:8080/third_prj/resources/css/jumbotron.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
<main role="main">
  
  
  <div class="container" style="min-height: 2000px">
	  <div class="row">
		  <div class="col-lg-10">
				<div class="row justify-content-center" style="padding: 100px; margin-bottom: 60px; margin-top: 60px">
					<h2>영어 같이 해봐요! 노하우 만땅 리더의 특급모임</h2>
				</div> 
			  	<div class="row">
			  		<div class="col-lg-8"></div>
			  		<div class="col-lg-4" style="font-size:17px; font-weight:bold; margin-bottom: 20px">현재 00명이 이 스터디를 좋아합니다.</div>
			  	</div>
			  	<div class="row" style="margin-bottom: 20px">
			  		<div class="col-lg-12">
			  			<div style="height:450px ;background-color:#F0F0F0">이미지</div>
			  		</div>
			  	</div>
			  	<div class="row" style="padding: 50px;border:1px solid #F0F0F0" >
			  		<div class="col-lg-3"><strong>상세 정보</strong></div>
			  		<div class="col-lg-9">
			  		
			  		<div class="row">
				  		<div class="col-lg-6">지역: 건대</div>
				  		<div class="col-lg-6">인원: 10</div>
			  		</div>
			  		
			  		<div class="row">
				  		<div class="col-lg-6">종류: 언어</div>
				  		<div class="col-lg-6">등록일: 2019/03/26</div>
			  		</div>
			  		</div>
			  	</div>
			  	<div class="row" style="padding: 50px;border:1px solid #F0F0F0" >
			  		<div class="col-lg-3"><strong>스터디 소개</strong></div>
			  		<div class="col-lg-9">
				  		*****주의 그리고 또 주의*****<br/>
				  		우리모두</br>
						동해물과백두산이<br/>
						마르고닳도록하느님이보우하사 우리나라만세<br/>
						우리모두</br>
						동해물과백두산이<br/>
						마르고닳도록하느님이보우하사 우리나라만세<br/>
				  </div>
			  </div>
			  <div class="row" style="padding: 50px;border:1px solid #F0F0F0" >
			  		<div class="col-lg-12" >
				  		<div class="row">
					  		<div class="col-lg-3" style="margin-bottom: 20px"><strong>리더 소개</strong></div>
					  		<div class="col-lg-9"></div>
				  		</div>
				  		
				  		<div class="row">
				  			<div class="col-lg-3" style="padding-left: 18px;">
				  				<div style="width: 100px; height: 100px ;background-color: #F0F0F0">이미지</div>
				  			</div>
				  			<div class="col-lg-9" style="font-size: 20px;padding:30px">
				  				<strong>한지민</strong>
				  			</div>
				  		</div>
				 		<div class="row" style="padding-bottom: 30px; padding-top: 20px">
					  		<div class="col-lg-3"></div>
					  		<div class="col-lg-9">
							  	스터디 리더장입니다. 안녕하세요.</br>
							  	동해물과백두산이<br/>
							  	마르고닳도록하느님이보우하사 우리나라만세<br/>
							  	동해물과백두산이<br/>
							  	마르고닳도록하느님이보우하사 우리나라만세<br/>
					  		</div>
				  		</div>
			  		</div>
			  </div>
			  <div class="row" style="padding: 50px;border:1px solid #F0F0F0" >
			  	<div class="col-lg-12">
				  	<div class="row" style="margin-bottom: 20px; font-weight: bold">
					  	<div class="col-lg-10">댓글 3</div>
					 	 <div class="col-lg-2 text-right">내 댓글</div>
				  	</div>
				  	<div class="row">
				  		<div class="col-lg-10">
					  		<input type="text" class="form-control" maxlength="100" placeholder="댓글은 100자까지 입력하실 수 있습니다."/>
				  		</div>
				  		<div class="col-lg-2">
					  		<button type="button" class="btn btn btn-secondary btn-adjust" id="searchZip" >확인</button>
				  		</div>
				  	</div>
				  	
				  	<div class="row">
				  		<div class="col-lg-12" style="margin-top:60px">
				  		<ul class="list-unstyled">
							  <li class="media" style="padding-bottom: 20px">
							  	<div style="width: 100px;height: 100px;background-color: #F0F0F0; margin-right: 20px"></div>
							    <div class="media-body row">
							    <div class="col-lg-10">
							      <h5 class="mt-0 mb-1">백두산</h5>
							      스터디 리더장입니다. 안녕하세요.
							  	 동해물과백두산이
							  	 마르고닳도록하느님이보우하사 우리나라만세
							  	 스터디 리더장입니다. 안녕하세요.
							  	 동해물과백두산이
							  	 마르고닳도록하느님이보우하사 우리나라만세
							    </div>
							    <div class="col-lg-2" style="font-size: 12px;">2019/04/02</div>
							    </div>
							  </li>
							  <li class="media" style="padding-bottom: 20px">
							  	<div style="width: 100px;height: 100px;background-color: #F0F0F0; margin-right: 20px"></div>
							    <div class="media-body row">
							    <div class="col-lg-10">
							      <h5 class="mt-0 mb-1">백두산</h5>
							      스터디 리더장입니다. 안녕하세요.
							  	 동해물과백두산이
							  	 마르고닳도록하느님이보우하사 우리나라만세
							  	 스터디 리더장입니다. 안녕하세요.
							  	 동해물과백두산이
							  	 마르고닳도록하느님이보우하사 우리나라만세
							    </div>
							    <div class="col-lg-2" style="font-size: 12px">2019/04/02</div>
							    </div>
							  </li>
							  <li class="media" style="padding-bottom: 20px">
							  	<div style="width: 100px;height: 100px;background-color: #F0F0F0; margin-right: 20px"></div>
							    <div class="media-body row">
							    <div class="col-lg-10">
							      <h5 class="mt-0 mb-1">백두산</h5>
							      스터디 리더장입니다. 안녕하세요.
							  	 동해물과백두산이
							  	 마르고닳도록하느님이보우하사 우리나라만세
							  	 스터디 리더장입니다. 안녕하세요.
							  	 동해물과백두산이
							  	 마르고닳도록하느님이보우하사 우리나라만세
							    </div>
							    <div class="col-lg-2" style="font-size: 12px">2019/04/02</div>
							    </div>
							  </li>
							</ul>
				  		</div>
				  	</div>
				  </div>
			  </div>
		  </div> 
		  
	  <!-- 따라다니는 사이드바 -->
		<div class="col-lg-2" style="position: fixed; margin-left: 940px;">
			<div id="sidebar" style="width: 300px; height: 300px">
				<div class="row  border border-secondary" style="padding: 30px; margin-left: 10px">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-12">
					  	<div style="font-size: 17px; font-weight: bold; height: 70px;">영어 같이 해봐요! 노하우 만땅 리더의 특급모임</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12" style="font-size: 12px; margin-top: 10px; height: 60px">
					  	<div>호주, 뉴질랜드,영국,미국,인도,필리핀, 영어까지 한번에 정복!!</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-2" ></div>
								<div class="col-lg-8" style="margin-top: 40px">
							  	<button type="button" class="btn btn btn-secondary btn-adjust2" id="searchZip" style="width: 140px; height: 37px" >참가 신청하기</button>
								</div>
							</div>
						</div>
					</div>
			 	</div>
			 </div>
			</div>
		</div>
		
	</div>
  </div>
  	
</main>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/resources/js/bootstrap.min.js" ></script>
  
</body>
</html>