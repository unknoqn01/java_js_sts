<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디렉티브 태그</title>
</head>
<body>
	<h4>에러가 발생하였습니다</h4>
	<h5>exception 내장 객체 변수</h5>
	<!-- isErrorPage = true 사용사 예외처리 위한 exception 객체를 사용할 수 있음-->
	<%
	exception.printStackTrace(new java.io.PrintWriter(out));
	%>

</body>
</html>