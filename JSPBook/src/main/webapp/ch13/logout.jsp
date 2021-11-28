<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 지정한 시간이 지난 후 지정한 페이지로 이동 -->
<meta http-equiv="refresh" content="5; url=http://localhost:8080/JSPBook/ch13/login.jsp">
<title>logout</title>
</head>
<body>
	<h3>로그 아웃 페이지</h3>
	<p>로그아웃 되었습니다.</p>
	<p>5초 후 login 페이지로 이동합니다.</p>
	<%
// 	기존에 세션에 저장된 내용을 모두 삭제
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	
// 	모든 세션 정보를 삭제
	session.invalidate();
	%>
</body>
</html>