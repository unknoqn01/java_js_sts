<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 사용하기</title>
</head>
<body>
	<%
// 	생성된 쿠키를 삭제 시 클라이언트에서 요청 시 전송된 request 내장객체에 저장된 쿠키를 불러와서 setMaxAge메서드를 사용하여 유효 시-간을 0으로 설정
	Cookie[] cookies = request.getCookies();
	
	for (int i = 0; i < cookies.length; i++) {
		cookies[i].setMaxAge(0);
// 		유효 시간이 0인 쿠키를 다시 response 내장객체에 추가하여 클라이언트로 전송함
		response.addCookie(cookies[i]);
	}
	%>
	
	<a href="cookie02.jsp">쿠키 확인 페이지</a>
</body>
</html>