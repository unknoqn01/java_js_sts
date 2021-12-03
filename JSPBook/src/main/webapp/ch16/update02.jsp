<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "update02_process.jsp" method = "post">
		<label for = "id">수정할 id : </label>
		<input type = "text" id = "id" name = "id" placeholder = "수정하고자 하는 id 입력하세요"><br>
		<label for ="passwd">수정할 비밀번호 : </label> 
		<input type = "password" id = "passwd" name = "passwd" placeholder="비밀번호를 입력하세요"><br>
		<label for = "name">수정할 이름 : </label>
		<input type = "text" id = "name" name = "name" placeholder="수정할 이름을 입력하세요">
		<button type = "submit">전송</button>
	</form>
</body>
</html>