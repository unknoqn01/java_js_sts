<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>

<%!

Connection conn = null;
Statement stmt = null;

ResultSet rs = null;

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
String uid = "testuser";
String upw = "bitc1234";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연락처</title>
<script>
	window.addEventListener("DOMContentLoaded", function() {
		var btnCancel = document.querySelector("#btn-cancel");
		btnCancel.addEventListener("click", function() {
			history.back();
		});
	});
</script>
</head>
<body>
	<%@ include file="header.jsp" %>

	<main>
		<form action = "upPhone_process.jsp" method = "post"> 
			<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	
	String sql = "select seq, fr_name, fr_phone1, fr_phone2, fr_email, fr_address, fr_comment ";
	sql += "from phonebook ";
	sql += "where seq = " + num;
	
	try {

		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);

		stmt = conn.createStatement();		
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {

			int idx = rs.getInt("seq");
			String name = rs.getString("fr_name");
			String phone1 = rs.getString("fr_phone1");
			String phone2 = rs.getString("fr_phone2");
			String email = rs.getString("fr_email");
			String address = rs.getString("fr_address");
			String contents = rs.getString("fr_comment");
		%>
			<div>
				<div>
				<label for="idx">글 번호 : </label>
				<input type="text" id="idx" name="idx" readonly value="<%= idx %>">
				</div>
							<div>
				<label for="name">이름 : </label>
				<input type="text" id="name" name="name" value="<%= name %>">
			</div>
			<div>
				<label for="phone1">폰 번호 : </label>
				<input type="text" id= "phone1" name="phone1" value="<%= phone1 %>">
			</div>
			<div>
				<label for = phone2>전화 번호 : </label>
				<input type="text" id="phone2" name="phone2" value="<%= phone2 %>">
			</div>
			<div>
				<label for="email">이메일 : </label>
				<input type="text" id="email" name="email" value="<%= email %>">			
			</div>
			<div>
				<label for="address">주소 : </label>
				<input type="text" id="address" name="address" value="<%= address %>">			
			</div>
			<div>
				<label for="contents">글내용 : </label>
				<textarea rows="5" id="contents" name="contents"><%= contents %></textarea>
			</div>
			
			<div>			
				<div>
					<button type = "button"><a href = "phoneList.jsp">목록</a></button>
				</div>
				<div>
				<button type = "submit">수정</button>
				<button type="button" id="btn-cancel">취소</button>
				</div>
			</div>
			
		<%
			}
		}
		catch (SQLException ex) {
			
		}
		finally {
			if (rs != null) { rs.close(); }
			if (stmt != null) { stmt.close(); }
			if (conn != null) { conn.close(); }
		}
		%>
		</form>
	</main>
	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>