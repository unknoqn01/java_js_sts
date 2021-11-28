<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<%
// 	실제 데이터베이스와 연결하는 클래스
	Connection conn = null;
	
	try {
// 		jdbc - jdbc 드라이버를 사용한다는 의미
// 		mysql - 사용하는 데이터베이스로 mysql을 사용한다는 의미
// 		localhost - DB서버의 URL, ip로 입력 및 도메인명으로 입력해도 됨
// 		3306 - mysql의 기본 사용 포트, DB서버의 설정에 따라 변경 가능
// 		testdb - 현재 내가 사용하고자 하는 DB 명
// 		? - ? 앞의 내용은 기본 설정부분이고, ? 뒤는 추가 옵션 부분임
// 		& - 여러개의 추가 옵션이 있을 경우 옵션을 구분하는 기호
		String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
		String user = "testuser";
		String password = "bitc1234";
		
// 		mysql의 jdbc 드라이버 로드, 현재는 jdbc드라이버가 업데이트되어 com.mysql.cj.jdbc.Driver 을 사용함
// 		DriverManager에 자동으로 등록됨
		Class.forName("com.mysql.cj.jdbc.Driver");
// 		DriverManager의 getConnection() 메서드를 실행하여 데이터베이스와 연결
		conn = DriverManager.getConnection(url, user, password);
		out.println("데이터 베이스 연결이 성공하였습니다.");
	}
	catch (SQLException e) {
		out.println("데이터 베이스 연결이 실패하였습니다.<br>");
		out.println("SQLException : " + e.getMessage());
	}
	finally {
// 		데이터 베이스 접속이 완료 된 후 접속 종료
		if (conn != null) {
			conn.close();
		}
	}
	%>
</body>
</html>













