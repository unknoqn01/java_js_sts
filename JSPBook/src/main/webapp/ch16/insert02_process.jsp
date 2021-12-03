<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동</title>
</head>
<body>
<!--  db 커넥션 파일로드 -->
	<%@ include file = "dbconn.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");

	// 클라이언트에서 전송한 데이터를 reqest 내장객체에서 가져옴
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into member(id, passwd, name) ";	
			sql += "Values (?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
			out.println("테이블 삽입에 성고했습니다");
			
		} catch (SQLException ex) {
			out.println("member 테이블 삽입이 실패했습니다");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	%>
</body>
</html>