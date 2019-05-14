<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>이미지 업로드</title>
    <!-- Bootstrap core CSS -->
	<link href="http://211.63.89.144/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://211.63.89.144/resources/css/font.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   <script type="text/javascript">
   		$(function() {
   			
   			<c:if test="${ uploadFlag }">
   				alert("이미지가 변경되었습니다");
   				window.opener.location.reload();
   				window.self.close();
   			</c:if>
   			<c:if test="${ failFlag }">
   				alert("이미지 변경에 실패했습니다");
   			</c:if>
   			
   			$("#changeBtn").click(function() {
   				$("#imgFrm").submit();	
   			});
   		});
   </script>
</head>
<body class="text-center">
<div style="margin-top:20px;">
    <h5 class="mb-3 font-weight-normal">변경하실 이미지 파일을 선택해주세요</h5>
	<form id="imgFrm" action="upload_img_process.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="prevImg" value="${ param.prevImg }"/>
		<input type="file" accept=".gif,.jpg,.png" name="upFile" id="upFile" class="btn btn-sm btn-primary mb-4" id="changeBtn">
		<p>
			<button type="button" class="btn btn-dark" onclick="window.self.close()">취소</button>
			<button type="button" class="btn btn-primary" id="changeBtn">변경하기</button>
		</p>
	</form>
 </div>
</body>
</html>