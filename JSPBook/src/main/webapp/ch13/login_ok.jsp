<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login ok</title>
</head>
<body>
	<h3>로그인 성공 페이지</h3>
	<%
// 	세션에 저장된 userId와 userName 속성을 가져옴
	String userId = session.getAttribute("userId").toString();
	String userName = session.getAttribute("userName").toString();
	%>
	
	<!-- 가져온 userName을 화면에 출력 -->
	<h4><%= userName %>님 안녕하세요</h4>
	
	<a href="logout.jsp">로그 아웃</a>
</body>
</html>