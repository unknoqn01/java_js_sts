<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%!
Connection conn = null;
Statement stmt = null;

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
String uid = "test";
String upw = "bitc";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String title = request.getParameter("title");
String contents = request.getParameter("contents");
String userId = request.getParameter("userId");
String contentPw = request.getParameter("contentPw");

if (contentPw == null || contentPw.isEmpty()) {
	contentPw = "bitc1234";
}

try {
	String sql = "INSERT INTO ";
	sql += "t_board (title, contents, creator_id, passwd, created_date) ";
	sql += "VALUES ('" + title + "', '" + contents + "', ";
	sql += "'" + userId + "', '" + contentPw + "', NOW())" ;
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, uid, upw);
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
}
catch (SQLException ex) {
	
}
finally {
	if (stmt != null) { stmt.close(); }
	if (conn != null) { conn.close(); }
}

response.sendRedirect("boardList.jsp");
%>
</body>
</html>









