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
	<%@ include file="dbconn.jsp" %>
	
	<%
// 	SQL 명령어를 데이터 베이스에서 실행하기 위한 클래스
	Statement stmt = null;
// 	SELECT SQL 명령어 실행 후 결과값을 받아오는 클래스
	ResultSet rs = null;
	
	try {
		String sql = "SELECT * FROM member ";
		
// 		Connection 클래스의 객체를 통해서 Statement 클래스 객체를 생성
		stmt = conn.createStatement();
// 		Statement 클래스의 executeQuery() 메서드를 통해서 select SQL 명령어를 실행
// 		ResultSet 에 그 결과값을 저장
// 		ResultSet 이 Enumeration과 비슷한 데이터 타입으로 구성되어 있음
		rs = stmt.executeQuery(sql);
		
// 		next() 메서드 실행 시 남은 데이터가 존재 시 true를 반환, 없으면 false
		while (rs.next()) {
// 			getString() : ResultSet 안에서 지정한 이름과 1:1로 연동된 데이터를 가져옴
// 			이때 여기서 말하는 이름(key)는 데이터 베이스 테이블의 컬럼명과 같음
			String id = rs.getString("id");
			String pw = rs.getString("passwd");
			String name = rs.getString("name");
			
			out.println("아이디 : " + id + "<br>비밀번호 : " + pw + "<br>이름 : " + name);
			out.println("<br>----------------------------<br>");
		}
	}
	catch (SQLException ex) {
		out.println("데이터 베이스 조회 시 오류가 발생했습니다.");
		out.println("SQLException : " + ex.getMessage());
	}
	finally {
// 		외부 리소스를 닫는 순서는 외부 리소스를 열었던 반대의 순대로 닫음
// 		ResultSet을 가장 먼저 닫고, 다음에 Statement를 닫고, 마지막에 Connection을 닫음
		if (rs != null) {
			rs.close();
		}
		
		if (stmt != null) {
			stmt.close();
		}
		
		if (conn != null) {
			conn.close();
		}
	}
	%>
</body>
</html>






