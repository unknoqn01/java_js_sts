<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 사용하기</title>
</head>
<body>
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%
	String name = "";
	String value = "";
	
	Enumeration<String> en = session.getAttributeNames();
	
	int i = 0;
	
	while (en.hasMoreElements()) {
		i++;
		name = en.nextElement();
		value = session.getAttribute(name).toString();
		out.println("설정된 세션 이름 [" + i + "] : " + name + "<br>");
		out.println("설정된 세션 값 [" + i + "] : " + value + "<br>");
		session.removeAttribute(name);
	}
	%>
	<h4>----- 세션을 삭제한 후 -----</h4>
	<%
	en = session.getAttributeNames();
	
	i = 0;
	
	while (en.hasMoreElements()) {
		i++;
		name = en.nextElement();
		value = session.getAttribute(name).toString();
		out.println("설정된 세션 이름 [" + i + "] : " + name + "<br>");
		out.println("설정된 세션 값 [" + i + "] : " + value + "<br>");
	}
	%>
</body>
</html>







