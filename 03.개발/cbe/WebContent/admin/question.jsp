<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>관리자 - 문의사항</title>

    <!-- Bootstrap core CSS -->
		<link href="http://localhost:8080/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="http://localhost:8080/third_prj/resources/css/font.css"/>
    <!-- Custom styles for this template -->
    <link href="http://localhost:8080/third_prj/resources/css/admin_dashboard.css" rel="stylesheet">
    <script src="http://localhost:8080/third_prj/resources/js/jquery-3.3.1.slim.min.js"></script>
		<script src="http://localhost:8080/third_prj/resources/js/bootstrap.bundle.min.js"></script>
    <script src="http://localhost:8080/third_prj/resources/js/feather-icons/4.9.0/feather.min.js"></script>
    <script src="http://localhost:8080/third_prj/resources/js/Chart.js/2.7.3/Chart.min.js"></script>
		<script src="http://localhost:8080/third_prj/resources/js/admin_dashboard.js"></script></body>
  </head>
  <body>
  
  
<!-- navbar 시작 -->
<c:import url="http://localhost:8080/third_prj/admin/layout/navbar.jsp"></c:import>
<!-- navbar 끝 -->

<div class="container-fluid">
  <div class="row">
  
    <!-- sidebar 시작 -->
    <c:import url="http://localhost:8080/third_prj/admin/layout/sidebar.jsp"></c:import>
		<!-- sidebar 끝 -->	

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="row justify-content-between" style="margin-top:40px; margin-bottom:10px;">
      	<div class="col-10">
        	<h1 class="h2">문의사항</h1>
        </div>
        <div class="col-2 justify-content-right" style="padding-top:15px;">
			    <select class="form-control" style="font-size:12px;">
			      <option>--분류--</option>
			      <option>회원정보</option>
			      <option>스터디</option>
			      <option>홈페이지</option>
			      <option>기타</option>
			    </select>
			  </div>
      </div>

      <div class="table-responsive">
        <table class="table table-striped table-sm border-bottom">
          <thead>
            <tr class="text-center">
              <th width="100">번호</th>
              <th width="100">문의자</th>
              <th width="100">분류</th>
              <th width="400">제목</th>
              <th width="100">답변여부</th>
              <th width="100">등록일</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach begin="1" end="10" step="1">
            <tr class="text-center">
              <td>123</td>
              <td>someId</td>
              <td>회원정보</td>
              <td class="text-left">스터디명 블라블라블라</td>
              <td>미완료</td>
              <td>2019-03-00</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
        <div class="d-flex justify-content-center">
        <ul class="pagination">
        	<li class="paginate_button page-item previous disabled" id="dataTable_previous">
        		<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전으로</a>
        	</li>
        		<li class="paginate_button page-item active">
        			<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
        		</li>
        		<li class="paginate_button page-item ">
        			<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
        		</li>
        		<li class="paginate_button page-item ">
        			<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
        		</li>
        		<li class="paginate_button page-item ">
							<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
						</li>
						<li class="paginate_button page-item ">
        			<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
        		</li>
        		<li class="paginate_button page-item ">
        			<a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>
        		</li>
        		<li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음으로</a>
        	</li>
        </ul>
        </div>
      </div>
    </main>
  </div>
</div>
</html>
