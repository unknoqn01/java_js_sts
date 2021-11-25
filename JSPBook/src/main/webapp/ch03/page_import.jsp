<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.util.Date" %>
<%@ page buffer = "16kb" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- import 미사용시 -->	
	Today is <%=new java.util.Date()%>
	
	<br><br><br>
	
	<!-- import 미사용시 -->
	Today is <%=new Date() %>


</body>
</html>