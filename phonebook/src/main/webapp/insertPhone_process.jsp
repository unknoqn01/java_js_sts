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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연락처</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String comments = request.getParameter("contents");
	
	try {
		String sql = " insert into phonebook (fr_name, fr_phone1, fr_phone2, fr_email, fr_address, fr_comment) ";
		sql += "values('" + name + "', '" + phone1 + "', '" + phone2 +"', '" + email + "', '" + address + "', '" + comments + "') ";

		
		
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
</body>
</html>