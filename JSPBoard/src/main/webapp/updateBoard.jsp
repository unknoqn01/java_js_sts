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

<script>
	window.addEventListener("DOMContentLoaded", function() {
		var btnCancel = document.querySelector("#btn-cancel");
		btnCancel.addEventListener("click", function(){
			history.back();
		});
	});
</script>
</head>
<body>
	<header class="container">
		<div class="mt-4 p-5 rounded jumbotron">
			<h1>게시판 글 수정 페이지</h1>
		</div>
	</header>
	
	<main class="container">
		<form class="mt-5" action="updateBoard_process.jsp" method="post">
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
			<div class="my-3">
				<label for="idx">글번호 : </label>
				<input type="text" class="form-control" id="idx" name="idx" readonly value="<%= idx %>">
			</div>
			<div class="my-3">
				<label for="title">글제목 : </label>
				<input type="text" class="form-control" id="title" name="title" value="<%= title %>">
			</div>
			<div class="my-3">
				<label for="userId">아이디 : </label>
				<input type="text" class="form-control" id="userId" name="userId" value="<%= userId %>">
			</div>
			<div class="my-3">
				<label for="contentPw">비밀번호 : </label>
				<input type="password" class="form-control" id="contentPw" name="contentPw" value="">
			</div>
			<div class="my-3">
				<label for="contents">글내용 : </label>
				<textarea rows="5" class="form-control" id="contents" name="contents"><%= contents %></textarea>
			</div>
			<div class="d-flex justify-content-between">
				<div>
					<a href="boardList.jsp" class="btn btn-secondary">목록</a>
				</div>
				<div>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-warning" id="btn-cancel">취소</button>
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
	
	<footer class="container-fluid p-0">
		<div class="mt-3 p-5 jumbotron text-center">
			<p>made by bitc</p>
		</div>
	</footer>
</body>
</html>











