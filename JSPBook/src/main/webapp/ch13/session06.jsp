<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 사용하기</title>
</head>
<body>
	<h4>----- 세션 삭제하기 전 -----</h4>
	<%
// 	다른 페이지에서 setAttribute()를 통해서 세션 정보를 저장함
// 	현재 페이지에서 getAttribute()를 통해서 저장된 세션 정보를 가져옴
	String userId = (String)session.getAttribute("userID");
	String userPw = (String)session.getAttribute("userPW");
	
	out.println("설정된 세션 이름 userID : " + userId + "<br>");
	out.println("설정된 세션 값 userPW : " + userPw + "<br>");
	
// 	현재 세션 정보가 있는지 확인
	if (request.isRequestedSessionIdValid() == true) {
		out.print("세션이 유효합니다.");
	}
	else {
		out.print("세션이 유효하지 않습니다.");
	}
	
// 	현재 저장된 모든 세션정보를 삭제
	session.invalidate();
	%>
	<h4>----- 세션 삭제한 후 -----</h4>
	<%
	if (request.isRequestedSessionIdValid() == true) {
		out.print("세션이 유효합니다.");
	}
	else {
		out.print("세션이 유효하지 않습니다.");
	}
	%>
</body>
</html>