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
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
// 	SQL 명령어를 DB 서버로 명령을 내리고 그 결과값을 얻어오는 클래스
	Statement stmt = null;
	
	try {
// 		실행할 SQL 쿼리를 생성
		String sql = "INSERT INTO member(id, passwd, name) ";
		sql += "VALUES ('" + id + "', '" + passwd + "', '" + name + "') ";
		
// 		Connection 클래스 타입의 객체 conn을 사용하여 Statement 객체를 생성
		stmt = conn.createStatement();
// 		executeUpdate() 메서드를 사용하여 만들어놓은 SQL 명령어를 데이터베이스에서 실행
// 		executeUpdate() 메서드는 insert, update, delete 명령 시 사용
		stmt.executeUpdate(sql);
		out.println("Member 테이블 삽입이 성공했습니다.");
	}
	catch (SQLException ex) {
		out.println("Member 테이블 삽입이 실패했습니다.<br>");
		out.println("SQLException : " + ex.getMessage());
	}
	finally {
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