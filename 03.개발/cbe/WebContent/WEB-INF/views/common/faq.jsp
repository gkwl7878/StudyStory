<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head >
	<style type="text/css">
		#wrap{margin:100px auto; width: 700px; min-height: 800px; width:920px;}
		.info{border: 1px solid #BFC8D0 ; padding: 50px ;text-align: center; margin-bottom: 50px; margin-top: 30px}
		.card-header-1{padding: 10px;margin-bottom:0;background-color:white; }
	</style>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="/third_prj/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
  <title>자주묻는 질문</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
  
  </script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/layout/navbar.jsp"/>
	
	<div id="wrap" >
		 <div style= "width: 920px; border:1px solid #D7D7D7; padding:40px ; margin-bottom: 20px ">
		  <!-- 점보트론 : 전광판 -->
    <section class="text-center bg-white mb-0" style="margin-top:30px; margin-bottom:20px;">
       <div class="container">
          <h1 class="jumbotron-heading">자주묻는 질문</h1>
       </div>
    </section>
    <div style="height:20px;"></div>
    <!-- 점보트론 : 전광판 -->
		<hr>
		
		<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header-1" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          스토리에 기록된 내용은 영구 보관 되나요?
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
      스터디 스토리에 보관된 내용은 스터디 활동을 중단하여도 열람 가능합니다. 스터디가 종료되어도 이전 내역을 다시 확인해 볼 수 있습니다. 스터디 내용은 열람외에는 어떠한 용도로 사용되지 않습니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header-1" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          스터디 스토리는 무료 서비스인가요?
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
        스터디 스토리는 스터디를 희망하는 모든 회원들이 자유롭게 스터디를 개설하고 참여할 수 있는 무료 플랫폼입니다. 자유롭게 활동바랍니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header-1" id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          스터디 개설을 했는데 이용을 할 수가 없어요.
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        스터디를 처음 개설할 경우 관리자의 승인이 필요합니다. 24시간 이내 관리자 확인 후 스터디가 개설됩니다.  쾌적한 스터디 환경 조성을 위해 필요한 절차이니 양해 바랍니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header-1" id="headingFour">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
          스터디 운영을 포기하고 싶어요.
        </button>
      </h2>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        부득이한 경우 스터디 활동을 종료할 수 있습니다. 스터디 기록은 남아있어 얼마든지 열람 가능합니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header-1" id="headingFive">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
          스터디 장을 위임할 수 있나요?
        </button>
      </h2>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        스터디 장 위임 서비스는 아직 준비중에 있습니다. 
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header-1" id="headingSix">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseThree">
          스터디 규칙은 어떻게 정하나요?
        </button>
      </h2>
    </div>
    <div id="collapseSix" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        스터디 규칙은 스터디 회원들과 자유롭게 정할 수 있습니다. 적절한 스터디 규칙은 스터디 활성화를 위해 권장됩니다. 자율적으로 규칙을 정하여 효율적인 스터디 운영 바랍니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header-1" id="headingSeven">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseThree">
          스터디에서 탈퇴하고 싶습니다.
        </button>
      </h2>
    </div>
    <div id="collapseSeven" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
		스터디 탈퇴를 원할 경우 자유롭게 탈퇴 신청을 통해 자유롭게 탈퇴가능합니다.
      </div>
    </div>
  </div>
</div>
		
  
  </div>
  <div class="row text-center">
  	<a class="btn btn-secondary btn-lg" href="#void" role="button" style="margin:0px auto;" onclick="history.back()">이전으로</a>
  </div>
	</div>
	
		<!-- footer -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="/third_prj/resources/js/popper.min.js" ></script>
  <script src="/third_prj/resources/js/bootstrap.min.js" ></script>
</body>
</html>