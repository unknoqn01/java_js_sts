<%@page import="ch04.com.dao.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:useBean id="person" class ="ch04.com.dao.Person" scope= "request" />
	
	 <p> 원본 아이디 : <% out.println(person.getId()); %>
	 <p> 원본 이 름 : <% out.println(person.getName());  %>
	
	<!--  setProperty 미사용 수정 -->
	<%
		person.setId(1981);
		person.setName("최수열");
	%>
	
	<p> 수정후 아이디 : <% out.println(person.getId()); %>
	<p> 수정후 이 름 : <% out.println(person.getName());  %>
		
	
	<!--setProperty 사용 수정-->
	<jsp:setProperty name = "person" property = "id" value = "20182005" />
	<jsp:setProperty name = "person" property = "name" value = "홍길동" />
	 <p> 수정후 아이디 : <% out.println(person.getId()); %>
	 <p> 수정후 이 름 : <% out.println(person.getName());  %>
		
</body>
</html>