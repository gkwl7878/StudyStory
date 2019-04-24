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
	<link href="/third_prj/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/third_prj/resources/css/font.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   <script type="text/javascript">
   		$(function() {
   			// 변경하기를 눌렀을 경우 이미지 명을 부모창에게 전달해서 이미지가 바뀌도록 해야하고 
   			// + 현재 이미지를 유저의 이미지로 업데이트 처리
   		});
   </script>
</head>
<body class="text-center">
<div style="margin-top:20px;">
    <h5 class="mb-3 font-weight-normal">변경하실 이미지 파일을 선택해주세요</h5>
	<form id="imgFrm" action="profile_img_upload.do" method="post" enctype="multipart/form-data">
		<input type="file" accept=".gif,.jpg,.png" name="upFile" id="upFile" class="btn btn-sm btn-primary mb-4" id="changeBtn">
		<p>
			<button type="button" class="btn btn-dark" onclick="window.self.close()">취소</button>
			<button type="button" class="btn btn-primary" id="changeBtn">변경하기</button>
		</p>
	</form>
 </div>
</body>
</html>