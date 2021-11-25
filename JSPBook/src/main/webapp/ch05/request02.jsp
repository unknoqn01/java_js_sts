<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// Enumeration en = request.getHeaderNames(); 
		// 내장 객체 request가 가지고 있는 header 정보이름의 리스트를 출력
		Enumeration <String> en = request.getHeaderNames();
	
		// Enumeration 객체 en의 현재 위치 뒤에 데이터가 존재하는지 확인
		while (en.hasMoreElements()) {
			// next.Element()를 통해서 데이터를 가져오고 위치를 한칸 변경
			String headerName = (String) en.nextElement();
			// getHeader()를 통해서 지정된 이름에 대응하는 헤더 데이터를 가져옴
			String headerValue = request.getHeader(headerName);
		
	%>
	<%= headerName %> : <%= headerValue %><br>
	<%
	}
	%>
	
	
</body>
</html>