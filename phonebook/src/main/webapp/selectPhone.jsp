<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>연락처</title>

</head>
<body>
	<%@ include file="dbConn.jsp" %>
	<%@ include file="header.jsp" %>
	
	<main>
	<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	
	String sql = "select seq, fr_name, fr_phone1, fr_phone2, fr_email, fr_address, fr_comment ";
	sql += "from phonebook ";
	sql += "where seq = ? ";
	
	ResultSet rs = null;
	
	
	PreparedStatement pstmtCount = null;
	
	try {

		Class.forName(driver);

		conn = DriverManager.getConnection(url, uid, upw);

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {

			int idx = rs.getInt("seq");
			String name = rs.getString("fr_name");
			String phone1 = rs.getString("fr_phone1");
			String phone2 = rs.getString("fr_phone2");
			String email = rs.getString("fr_email");
			String address = rs.getString("fr_address");
			String comment = rs.getString("fr_comment");
		%>
		<div>
			<div>
				<label for="idx">글 번호 : </label>
				<input type="text" id="boardIdx" name="boardIdx" readonly value="<%= idx %>">
			</div>
			<div>
				<label for="name">이름 : </label>
				<input type="text" id="name" name="name" readonly value="<%= name %>">
			</div>
			<div>
				<label for="phone1">폰 번호 : </label>
				<input type="text" id= "phone1" name="phone1" readonly value="<%= phone1 %>">
			</div>
			<div>
				<label for = phone2>전화 번호 : </label>
				<input type="text" id="phone2" name="phone2" readonly value="<%= phone2 %>">
			</div>
			<div>
				<label for="email">이메일 : </label>
				<input type="text" id="email" name="email" readonly value="<%= email %>">			
			</div>
			<div>
				<label for="address">주소 : </label>
				<input type="text" id="address" name="address" readonly value="<%= address %>">			
			</div>
			<div>
				<label for="comment">글내용 : </label>
				<textarea rows="5" id="comment" readonly><%= comment %></textarea>
			</div>


			<div>
				<div>
					<a href="phoneList.jsp">목록</a>
				</div>
				<div>
					<a href="upPhone.jsp?num=<%= idx %>">수정</a>
					<a href="delPhone.jsp?num=<%= idx %>">삭제</a>
				</div>
			</div>
		</div>
		<%
		}
	}
	catch (SQLException ex) {
		
	}
	finally {
		if (rs != null) { rs.close(); }
		if (pstmt != null) { pstmt.close(); }
		if (conn != null) { conn.close(); }
	}
	%>
	</main>
	
	<%@ include file="footer.jsp" %>
</body>
</html>











