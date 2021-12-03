<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");

	// 클라이언트에서 전송한 데이터를 reqest 내장객체에서 가져옴
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from member ";	
			sql += "where id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			out.println("테이블 삭제에 성고했습니다");
			
		} catch (SQLException ex) {
			out.println("member 테이블 삭제가 실패했습니다");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	%>
</body>
</html>