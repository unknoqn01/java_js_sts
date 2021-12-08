<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	String uid = "test";
	String upw = "1234";
%>