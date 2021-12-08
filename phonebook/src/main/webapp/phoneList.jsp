<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연락처</title>
</head>
<body>
	<%@ include file = "dbConn.jsp" %>
	
	<%@ include file = "header.jsp" %>

	<main>
		<table>
			<colgroup>
				<col width = "10%" />
				<col width = "20%" />
				<col width = "20%" />
				<col width = "20%" />
			</colgroup>
			<thead class = "text-center">
				<tr>
					<th>글번호</th>
					<th>이름</th>
					<th>번호</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<%
					String sql = "select seq, fr_name, fr_phone1, fr_email ";
					sql += "from phonebook;";
				
					ResultSet rs = null;
					
					try {
						conn = DriverManager.getConnection(url, uid, upw);
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						
						int seq = rs.getInt("seq");
						String name = rs.getString("fr_name");
						String phone = rs.getString("fr_phone1");
						String email = rs.getString("fr_email");
					
						String item = "<tr>";
						item +="<td>" + seq + "</td>";	
						item +="<td><a href='selectPhone.jsp?num=" + seq + "'>"+ name + "</td>";	
						item +="<td>" + phone + "</td>";	
						item +="<td>" + email + "</td>";	
						item += "</tr>";
						
						out.println(item);
					}
					
					} catch (SQLException ex) {
						
					} finally {
						if (rs != null) rs.close();
						if (pstmt != null) pstmt.close();
						if (conn != null) conn.close();
					}
				%>
			</tbody>
		</table>
		<div>
			<a href = "insertPhone.jsp">연락처 등록</a>
		</div>	
	</main>

	<%@ include file = "footer.jsp" %>
	
</body>
</html>