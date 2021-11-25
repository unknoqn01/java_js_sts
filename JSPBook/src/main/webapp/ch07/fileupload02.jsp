<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<!-- fileupload01_process.jsp로 데이터를 전송 -->
	<!-- 데이터 전송 시 전송 방식은 post로 설정 -->
	<!-- 전송되는 데이터는 enctype = "multipart/form-data" 로 설정하여 일반 텍스트
		 데이터와 파일 데이터를 동시에 전송-->
	<!-- 철자 조심,넘어 갈때 shift+alt+y -->
	<!-- 자바에서 각종 폴더 및 파일의 경로를 문자열로 입력 시 \\를 2번 쓰는 이유는 '\'가 이스케이프 문자이기 때문에 \ 1개만 사용시 이스케이프 문자로 동작하고 \\을 사용해야 문자열 경로로 동작-->
	<form action = "fileupload02_process.jsp" method="post" enctype = "multipart/form-data" name = "fileForm">
		<label>이 름1 : </label>
		<input type = "text" name = "name1">
		<label>제 목1 : </label>
		<input type = "text" name = "subject"><p>
		<label>파 일1: </label>	
		<input type = "file" name = "filename1">
		<p>
		<label>이 름2 : </label>
		<input type = "text" name = "name2">
		<label>제 목2 : </label>
		<input type = "text" name = "subject2"><p>
		<label>파 일2: </label>	
		<input type = "file" name = "filename2">
		<p>
		<label>이 름3 : </label>
		<input type = "text" name = "name3">
		<label>제 목3 : </label>
		<input type = "text" name = "subject3"><p>
		<label>파 일3: </label>	
		<input type = "file" name = "filename3">
		<p>
		<input type = "submit" value = "파일 올리기">
	</form>
</body>
</html>