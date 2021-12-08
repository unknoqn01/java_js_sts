<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>

<%!
	Connection conn = null;
	
	PreparedStatement pstmt = null;
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	String uid = "testuser";
	String upw = "bitc1234";%>
	
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));



	String sql = "delete from phonebook where seq = ? ";
	
	try {
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		int count = pstmt.executeUpdate();
		
		if (count < 1) {

		} else {

		}
	} catch (SQLException ex) {
			ex.getStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	 response.sendRedirect("phoneList.jsp");
%>


