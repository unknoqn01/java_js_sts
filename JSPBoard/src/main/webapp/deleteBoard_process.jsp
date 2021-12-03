<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%!
Connection conn = null;
Statement stmt = null;

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
String uid = "test";
String upw = "1234";
%>

<%
request.setCharacterEncoding("utf-8");

int idx = Integer.parseInt(request.getParameter("idx"));
String passwd = request.getParameter("contentPw");

String sql = "UPDATE t_board ";
sql += "SET deleted_yn = 'Y' ";
sql += "WHERE idx = " + idx + " ";
sql += "AND passwd = '" + passwd + "' ";

try {
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






