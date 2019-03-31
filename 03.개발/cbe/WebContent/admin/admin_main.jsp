<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>관리자 </title>
  <!-- Bootstrap core CSS -->
	<link href="http://localhost:8080/third_prj/Resources/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
    
  </style>
  <!-- Custom styles for this template -->
  <link href="http://localhost:8080/third_prj/Resources/css/admin_dashboard.css" rel="stylesheet">
  <script src="http://localhost:8080/third_prj/Resources/js/jquery-3.3.1.slim.min.js"></script>
	<script src="http://localhost:8080/third_prj/Resources/js/bootstrap.bundle.min.js"></script>
  <script src="http://localhost:8080/third_prj/Resources/js/feather-icons/4.9.0/feather.min.js"></script>
  <script src="http://localhost:8080/third_prj/Resources/js/Chart.js/2.7.3/Chart.min.js"></script>
<script src="http://localhost:8080/third_prj/Resources/js/admin_dashboard.js"></script></body>
</head>
<body>

	<!-- 상단 네비게이션  바 -->
	<c:import url="http://localhost:8080/third_prj/admin/layout/navbar.jsp"></c:import>
	
	<div class="container-fluid">
	  <div class="row">
  	<!-- 사이드바 -->
    <c:import url="http://localhost:8080/third_prj/admin/layout/sidebar.jsp"></c:import>





		<!-- 변경할 부분 메인 시작 ------------->
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">새 스터디 관리(타이틀)</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">정렬쪽</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">버튼등</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            	셀렉트?
          </button>
        </div>
      </div>

      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th width="50">번호</th>
              <th width="50">리더</th>
              <th width="250">스터디명</th>
              <th width="50">분류</th>
              <th width="50">지역</th>
              <th width="120">생성일</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach begin="1" end="10" step="1">
            <tr>
              <td>1</td>
              <td>아이디</td>
              <td>새로운 스터디명입니다</td>
              <td>취업</td>
              <td>강남</td>
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
    </main><!-- 변경할 부분 메인 끝 -->
    
    
    
    
	  </div><!-- div low -->
	</div><!-- div container-fluid -->
</body>
</html>
