<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%!
Connection conn = null;
Statement stmt = null;

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
String uid = "testuser";
String upw = "bitc1234";
%>

<%
request.setCharacterEncoding("utf-8");

int idx = Integer.parseInt(request.getParameter("idx").trim());
String name = request.getParameter("name");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String email = request.getParameter("email");
String address = request.getParameter("address");
String contents = request.getParameter("contents");

String sql = "update phonebook set fr_name = '" + name + "', fr_phone1 = '" + phone1 + "', fr_phone2 = '" + phone2 + "', fr_email = '" + email +"', fr_address = '" + address + "', fr_comment = '" + contents + "' where seq = " + idx + " ";

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

 response.sendRedirect("phoneList.jsp");
%>






