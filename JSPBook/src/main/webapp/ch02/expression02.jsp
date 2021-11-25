<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int a = 10;
		int b = 10;
		int c = 30;
	%>
	
	<%//ㅁㄴㅇ %>
	<%/*ㄴㅁㅇㅁ*/ %>
	<%--ㄴㅁㅇㅁㅇㅁ --%>
	
	<p>변수 a의 값은 <%= a%></p>
	<p>변수 b의 값은 <%= b%></p>
	<p>변수 c의 값은 <%= c%></p>
	
	<p> 세 변수의 합은 <%= a+ b+ c %></p>
</body>
</html>