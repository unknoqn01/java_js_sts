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
	<%
// 	클라이언트가 웹 서버에 접속하여 생성된 세션 아이디를 가져옴
	String sessionId = session.getId();
// 	현재 세션 ID로 클라이언트가 마지막으로 서버에 요청한 시간
	long lastTime = session.getLastAccessedTime();
// 	현재 세션 ID가 웹 서버에 생성된 시간
	long startTime = session.getCreationTime();
// 	현재 세션 ID로 웹 서버에 접속한 후 진행된 시간
// 	1970년 1월 1일 0시 0분 0초를 기준으로 1/1000초 방식의 숫자로 현재 시간의 진행된 시간
// 	1/1000 초 형식을 사람이 알아보기 쉬운 방식인 1초 형식으로 변경
// 	분 단위로 표시 하기 위해서 60으로 추가로 나눔
	long userTime = (lastTime - startTime) / 60000;

	Date date = new Date(lastTime);
	out.println(date.toLocaleString() + "<br>");
	
	out.println("세션 아이디 : " + sessionId + "<br>");
	out.println("요청 시작 시간 : " + startTime + "<br>");
	out.println("요청 마지막 시간 : " + lastTime + "<br>");
	out.println("웹 사이트의 경과 시간 : " + userTime + "<br>");
	%>
</body>
</html>