<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

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
<title>게시판 만들기</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
	.jumbotron {
		background-color: lightgray;
	}
</style>
</head>
<body>
	<header class="container">
		<div class="mt-4 p-5 rounded jumbotron">
			<h1>게시판 글 상세보기 페이지</h1>
		</div>
	</header>
	
	<main class="container">
	<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	String sql = "SELECT idx, title, contents, creator_id, hit_cnt ";
	sql += "FROM t_board ";
	sql += "WHERE idx = " + num + " ";
	sql += "AND deleted_yn = 'N' ";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			int idx = rs.getInt("idx");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
			String userId = rs.getString("creator_id");
			int hitCnt = rs.getInt("hit_cnt");
		%>
		<div class="mt-5">
			<div class="my-3">
				<label for="boardIdx">글번호 : </label>
				<input type="text" class="form-control" id="boardIdx" name="boardIdx" readonly value="<%= idx %>">
			</div>
			<div class="my-3">
				<label for="title">글제목 : </label>
				<input type="text" class="form-control" id="title" name="title" readonly value="<%= title %>">
			</div>
			<div class="my-3">
				<label for="userId">아이디 : </label>
				<input type="text" class="form-control" id="userId" name="userId" readonly value="<%= userId %>">
			</div>
			<div class="my-3">
				<label for="hitCnt">조회수 : </label>
				<input type="text" class="form-control" id="hitCnt" name="hitCnt" readonly value="<%= hitCnt %>">
			</div>
			<div class="my-3">
				<label for="contents">글내용 : </label>
				<textarea class="form-control" rows="5" id="contents" readonly><%= contents %></textarea>
			</div>
			<div class="d-flex justify-content-between">
				<div>
					<a href="boardList.jsp" class="btn btn-secondary">목록</a>
				</div>
				<div>
					<a href="updateBoard.jsp?num=<%= idx %>" class="btn btn-info">수정</a>
					<a href="deleteBoard.jsp?num=<%= idx %>" class="btn btn-danger">삭제</a>
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
		if (stmt != null) { stmt.close(); }
		if (conn != null) { conn.close(); }
	}
	%>
	</main>
	
	<footer class="container-fluid p-0">
		<div class="mt-3 p-5 jumbotron text-center">
			<p>made by bitc</p>
		</div>
	</footer>
</body>
</html>











