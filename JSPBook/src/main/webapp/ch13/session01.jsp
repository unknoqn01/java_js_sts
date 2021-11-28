<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 사용하기</title>
</head>
<body>
	<form action="session01_process.jsp" method="post">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id"><br>
		<label for="passwd">비밀번호 : </label>
		<input type="password" id="passwd" name="passwd"><br><br>
		<button type="submit">전송</button>
	</form>
	
	<br><hr><br>
	<a href="session02.jsp">세션 상태 확인 페이지</a>
</body>
</html>