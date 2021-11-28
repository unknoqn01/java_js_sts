<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 사용하기</title>
</head>
<body>
	<%
	String userId = (String)session.getAttribute("userID");
	String userPw = (String)session.getAttribute("userPW");
	
	String test = request.getParameter("id");
	out.println("요청한 데이터 : " + test + "<br>");
	
	out.println("설정된 세션의 속성 값 [1] : " + userId + "<br>");
	out.println("설정된 세션의 속성 값 [2] : " + userPw);
	%>
	<br><hr><br>
	<a href="session01.jsp">처음 페이지로 이동</a>
</body>
</html>