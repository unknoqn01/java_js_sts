<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 사용 및 SQL 문 사용을 위한 패키지 로드 -->
<%@ page import="java.sql.*" %>

<%!
// // DB에 연결하기 위한 Connection 클래스 타입의 변수 생성
// Connection conn = null;
// // SQL문을 DB서버에 질의하기 위한 Statement 클래스 타입의 변수 생성
// Statement stmt = null;
// // SELECT문 질의 후 그 결과를 받아오기 위한 ResultSet 클래스 타입의 변수 생성
// ResultSet rs = null;

// // DB 연결 정보
// String driver = "com.mysql.cj.jdbc.Driver";
// String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
// String uid = "testuser";
// String upw = "bitc1234";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 만들기</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link rel="stylesheet" href="./style/mystyle.css">

</head>
<body>
	<%@ include file="dbConn.jsp" %>
	<%@ include file="header.jsp" %>
	
	<main class="container main-footer-space">
	<%
	request.setCharacterEncoding("utf-8");
// 	boardList.jsp 에서 데이터를 전송 시 사용한 매개변수 이름이 num 이었으므로 request 내장객체에서 데이터를 가져올 때 num이라는 이름으로 가져와야 함
// 	boardList 에서 데이터 전송 시 정수 데이터로 전송했으나 request에서 저장하고 있는 데이터가 문자열 형태 이므로 이를 다시 정수로 변경하기 위해서 parseInt() 메서드를 사용함
	int num = Integer.parseInt(request.getParameter("num"));
	
// 	String sql = "SELECT idx, title, contents, creator_id, hit_cnt ";
// 	sql += "FROM t_board ";
// 	sql += "WHERE idx = " + num + " ";
// 	sql += "AND deleted_yn = 'N' ";

	String sql = "SELECT idx, title, contents, creator_id, hit_cnt ";
	sql += "FROM t_board ";
	sql += "WHERE idx = ? ";
	sql += "AND deleted_yn = 'N' ";
	
	ResultSet rs = null;
	
// 	해당 글 조회수를 업데이트 하기 위한 쿼리
	String sqlCount = "UPDATE t_board ";
	sqlCount += "SET hit_cnt = hit_cnt + 1 ";
	sqlCount += "WHERE idx = ? ";
	sqlCount += "AND deleted_yn = 'N' ";
	
	PreparedStatement pstmtCount = null;
	
	try {
// 		지정한 jdbc 드라이버를 설정
		Class.forName(driver);
// 		jdbc 드라이버가 설정되면 자동으로 DriverManger에 등록되고, 객체가 생성됨
// 		getConnection() 메서드를 사용하여 실제로 DB 서버에 연결함
		conn = DriverManager.getConnection(url, uid, upw);
// 		연결된 Connection 클래스 타입의 객체를 활용하여 Statement 객체를 생성
// 		stmt = conn.createStatement();
// 		생성된 Statement 객체를 사용하여 SQL 쿼리를 DB서버에 질의함
// 		rs = stmt.executeQuery(sql);

// 		조회수 카운트
		pstmtCount = conn.prepareStatement(sqlCount);
		pstmtCount.setInt(1, num);
		pstmtCount.executeUpdate();
		
// 		해당 글 상세 내용 확인
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		
// 		받아온 데이터에서 next() 메서드를 사용하여 결과값이 있는지 여부를 확인
		while (rs.next()) {
// 			getInt, getString 메서드를 사용하여 각각의 컬럼에 있는 데이터를 가져옴
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
<!-- 					각각의 페이지를 호출하면서 매개변수로 글번호를 넘겨줌 -->
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
// 		if (stmt != null) { stmt.close(); }
		if (pstmt != null) { pstmt.close(); }
		if (pstmtCount != null) { pstmtCount.close(); }
		if (conn != null) { conn.close(); }
	}
	%>
	</main>
	
	<%@ include file="footer.jsp" %>
</body>
</html>











