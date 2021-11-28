<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 사용하기</title>
</head>
<body>
	<%
	String userId = request.getParameter("id");
	String userPw = request.getParameter("passwd");
	
	if (userId.equals("admin") && userPw.equals("1234")) {
// 		session 내장 객체에 setAttribute 메서드를 사용하여 지정한 이름으로 지정한 데이터를 저장
// 		session 내장 객체의 getAttribute 메서드를 사용하여 저장된 데이터를 출력할 수 있음
// 		session 은 클라이언트가 종료되거나, 세션 유지 시간이 오버되거나, 세션 삭제가 이루어지기 전까지 서버에 계속 유지 됨
		session.setAttribute("userID", userId);
		session.setAttribute("userPW", userPw);
		out.println("세션 설정이 성공했습니다.");
		out.println(userId + "님 환영합니다.");
	}
	else {
		out.println("세션 설정이 실패했습니다.");
	}
	%>
	<br><hr><br>
	<a href="session02.jsp">세션 등록 상황 확인</a>
</body>
</html>

