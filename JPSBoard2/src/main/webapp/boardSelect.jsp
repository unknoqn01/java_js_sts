<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 문제 1) boardList.jsp에서 서낵한 글의 상세 내용을 확인하는 페이지를 완성하세요-->
	<!-- ps) BoardDao 클래스 내에 boardSelect() 메서드를 생성하여 지정한 데이터 일어 오기-->
	<!--  ps) 부트스트랩 적용 -->
	<%
	String idx = request.getParameter("idx");
	out.println(idx);
	%>
</body>
</html>