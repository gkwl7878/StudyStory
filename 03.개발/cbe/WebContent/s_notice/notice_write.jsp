<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="http://localhost:8080/third_prj/Resources/css/bootstrap.min.css">
	<title>스터디 공지 리스트</title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://localhost:8080/third_prj/Resources/js/jquery-3.3.1.slim.min.js" ></script>
  <script src="http://localhost:8080/third_prj/Resources/js/popper.min.js" ></script>
  <script src="http://localhost:8080/third_prj/Resources/js/bootstrap.min.js" ></script>
  <style type="text/css">
  
  .font20bold {
  	font-size:20px;
  	font-weight: bold;
  }
  
  .font12bold {
  	font-size:12px;
  	font-weight: bold;
  }
  
  </style>
</head>
<body>
	<!-- header -->
	<c:import url="http://localhost:8080/third_prj/layout/navbar.jsp"></c:import>
	<!--  header  끝 -->

	    <div class="container col-lg-6">
      <div class="row justify-content-left col-lg-6" style="margin-top:80px;">
        <h1 class="h2">OOO 스터디</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
      </div>
       <hr>
      
      <div class="container" style="min-height:500px;">
	      <div class="row">
	      	<div class="col-3 font20bold">스터디 공지</div>
	   			<div class="col-9 form-group">
	   				<input type="text" class="form-control" placeholder="공지명을 입력해주세요(최대100자)">
	   			</div>
	     	</div>	
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3">
	     			누군가
	     			<img src="http://localhost:8080/third_prj/Resources/img/no_profile.png" width="50" height="60"/>
	     		</div>
	     		<div class="col-9">
	     			<textarea rows="5" cols="55">summer노트 넣자구</textarea>
	     		</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold">과제</div>
	      	<div class="col-2 form-group">
	      		<select class="form-control form-control-sm" style="font-size:10px; padding-left:0px;">
	      			<option>스터디원</option>
	      		</select>
	      	</div>
	      	<div class="col-5" style="padding-left:0px; padding-right:0px;">
	      		<input type="text" class="form-control form-control-sm font12bold" placeholder="과제내용"/>
	      	</div>
	      	<div class="col-2" style="padding-right:0px;">
	      		<button type="button" class="btn btn-secondary btn-sm" style="font-size:10px;">추가</button>
	      	</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3"></div><!-- 추가시 공백칼럼 -->
	      	<div class="col-2">
	      		<span class="font12bold">스터디원1</span>
	      	</div>
	      	<div class="col-6">
	      		<span class="font12bold">이런거 해오세요~</span>
	      	</div>
	      	<div class="col-1">
	      		<input type="checkbox"/>
	      	</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
		      <div class="col-3 font20bold">장소</div>
		      <div class="col-9">다음지도 넣을거임~</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold">시간</div>
	      	<div class="col-9">어디어디 몇일 몇시 어디서 봅시다</div>
	      </div>
	      <div class="row" style="margin-top:30px;">
	      	<div class="col-3 font20bold">댓글</div>
	      	<div class="col-2">
	      		<span class="font12bold">스터디원1</span>
	      	</div>
	      	<div class="col-5">
	      		<span class="font12bold">이런거 해오세요~</span>
	      	</div>
	      	<div class="col-2 font12bold text-center">
	      		2019-03-02 PM 02:11
	      	</div>
	      	<div class="col-3"></div><!-- 추가될때마다 공백칼럼 넣어줘야 함 -->
	      	<div class="col-2">
	      		<span class="font12bold">스터디원1</span>
	      	</div>
	      	<div class="col-5">
	      		<span class="font12bold">이런거 해오세요~</span>
	      	</div>
	      	<div class="col-2 font12bold text-center">
	      		2019-03-02 PM 02:11
	      	</div>
	      	<div class="col-3"></div><!-- 마지막 줄은 댓글창 공백칼럼 넣어줘야 함 -->
	      	<div class="col-2">
	      		<span class="font12bold">내닉넴</span>
	      	</div>
	      	<div class="col-5">
	      		<input type="text" placeholder="내용을 입력해주세요." size="25"/>
	      	</div>
	      	<div class="col-2 justify-content-center">
		      	<button type="button" class="btn btn-secondary btn-sm" style="font-size:12px;">댓글달기</button>
	      	</div>
	      </div>
	      <div class="row justify-content-center" style="min-height:100px; margin-top:30px;">
	      	<button type="button" class="btn btn-secondary" style="height:40px;">목록으로</button>
	      </div>
	   	 </div>
      </div>

	<!-- footer -->
	<c:import url="http://localhost:8080/third_prj/layout/footer.jsp"></c:import>
</body>
</html>