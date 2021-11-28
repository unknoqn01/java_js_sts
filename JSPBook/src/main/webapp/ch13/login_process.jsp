<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 상태 세션 저장하기</title>
</head>
<body>
	<%!
// 	서버에 저장되어 있는 로그인 정보, 원래는 데이터 베이스에 연결하여 사용자 정보 가져오기
	String id = "test1";
	String pw = "test1234";
	%>
	
	<%
// 	클라이언트에서 넘어온 정보를 가져오기
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
// 	서버의 정보와 클라이언트에서 전송 정보를 비교, 원래는 데이터 베이스에서 검색하는 로직이 필요함
	if (id.equals(userId) && pw.equals(userPw)) {
// 		로그인 정보가 있을 경우 세션에 정보 저장
		session.setAttribute("userId", userId);
		session.setAttribute("userName", "아이유");
		
// 		로그인 정보가 있을 경우 login_ok 페이지로 이동
		response.sendRedirect("login_ok.jsp");
	}
	else {
// 		로그인 정보가 없으면 login_fail 페이지로 이동
		response.sendRedirect("login_fail.jsp");
	}
	%>
</body>
</html>





