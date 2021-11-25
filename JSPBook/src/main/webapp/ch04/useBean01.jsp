<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="date" class="java.util.Date"/>
	<p> <%
			out.println("오늘의 날짜 및 시각");
		%>
	<p><%=date %></p>

	<!-- 기존 방식으로 현재 시각 출력 -->
	<%
		out.println("오늘의 날짜 및 시각 : " + new java.util.Date());
		java.util.Date today = new java.util.Date();
	%>
	<br>
	<p>오늘의 날짜 및 시각 <%= today.toString() %>
	
	
</body>
</html>