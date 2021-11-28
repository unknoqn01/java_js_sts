<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 사용하기</title>
</head>
<body>
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%
	String userId = (String)session.getAttribute("userID");
	String userPw = (String)session.getAttribute("userPW");
	out.println("설정된 세션 이름 userID : " + userId + "<br>");
	out.println("설정된 세션 값 userPW : " + userPw + "<br>");
	
// 	저장된 세션 속성 중 지정한 이름의 세션을 정보를 삭제함
	session.removeAttribute("userID");
	%>
	<h4>----- 세션을 삭제한 후 -----</h4>
	<%
	userId = (String)session.getAttribute("userID");
	userPw = (String)session.getAttribute("userPW");
	out.println("설정된 세션 이름 userID : " + userId + "<br>");
	out.println("설정된 세션 값 userpw : " + userPw + "<br>");
	%>
</body>
</html>