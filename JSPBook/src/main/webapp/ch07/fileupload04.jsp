<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "fileupload04_process.jsp" method = "post" enctype = "multipart/form-data">
		<label for = "name">이름 : </label>
		<input type = "text" id = "name" name = "name"><br>
		<label for = "subject">제목 : </label>
		<input type = "text" id = "subject" name = "subcject"><br>
		<label for = "filename">파일 : </label>
		<input type = "file" id = "filename" name = "filename"><br>		
		
		<button type = "submit">파일 올리기</button>
	</form>
</body>
</html>