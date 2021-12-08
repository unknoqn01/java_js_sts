<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 사용 -->
<%@ page import="java.sql.*" %>

<%!
 // DB와 실제 연결하기 위한 커넥션 객체
 // 미리 DB와 연관된 객체를 선언하는 이유는 try ~ catch문 때문임
 // try ~ catch 문 내에서 객체를 선언 시 만약 오류가 발생하여 catch 문이 동작할 때 해당 객체를 finally 내에서 삭제할 수 없음
// Connection conn = null;
// Statement stmt = null; // DB에 SQL 질의를 하기 위한 객체
// ResultSet rs = null; // SELECT 질의 후 결과를 저장하기 위한 객체

// // mysql 드라이버 이름
// // DB의 종류에 따라 드라이버 이름이 변경 됨
// String driver = "com.mysql.cj.jdbc.Driver";
// // 실제 DB 접속 주소
// // DB의 종류에 따라 주소를 입력하는 방식이 조금씩 달라짐
// String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
// // DB에서 sql문을 실행할 DB 유저 ID 및 비밀번호
// String uid = "testuser";
// String upw = "bitc1234";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 만들기</title>

<!-- 부트스트랩5 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link rel="stylesheet" href="./style/mystyle.css">

</head>
<body>
<!-- 	<header class="container"> -->
<!-- 		<div class="mt-4 p-5 rounded jumbotron"> -->
<!-- 			<h1>게시판 목록 페이지</h1> -->
<!-- 		</div> -->
<!-- 	</header> -->
	<%@ include file="dbConn.jsp" %>
	
	<%@ include file="header.jsp" %>
	
	<main class="container main-footer-space">
		<table class="table table-striped table-hover mt-5">
			<colgroup>
				<col width="10%" />
				<col width="50%" />
				<col width="15%" />
				<col width="20%" />
				<col width="5%" />
			</colgroup>
			<thead class="text-center">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%
				String sql = "SELECT idx, title, creator_id, created_date, hit_cnt ";
				sql += "FROM t_board ";
				sql += "WHERE deleted_yn = 'N' ";
				
				ResultSet rs = null;
				
		
// 				데이터베이스와 같은 외부 리소스를 사용하는 부분은 오류가 발생할 가능성이 매우 높기 때문에 반드시 try ~ catch를 통해서 예외처리를 해야 함
				try {
					// DB에 연결하기 위한 드라이버 이름을 적용
					// DriverManager 클래스에 자동으로 등록 및 객체를 생성
// 					Class.forName(driver);
// 					getConnection() 메서드를 실행하면 실제 DB와 연결하고 그 결과를 Connection 클래스 타입의 객체에 대입함
					conn = DriverManager.getConnection(url, uid, upw);
// 					Connection 클래스 타입의 객체를 통해서 Statement 클래스 타입의 객체를 생성함
// 					stmt = conn.createStatement();
// 					Statement 클래스 타입의 객체가 가지고 있는 executeQuery() 메서드를 통해서 실제 SQL 쿼리를 DB에 질의함
// 					그 결과를 ResultSet 클래스 타입의 객체에 저장함
// 					rs = stmt.executeQuery(sql);

					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
// 					ResultSet 클래스의 next() 메서드를 실행 시 데이터가 있으면 true, 없으면 false를 출력
					while (rs.next()) {
// 						getInt, getString 메서드 사용 시 매개변수로 사용하는 문자열은 실제 DB의 컬럼명을 사용해야 함
						int idx = rs.getInt("idx"); 
						String title = rs.getString("title");
						String creatorId = rs.getString("creator_id");
						String createdDate = rs.getString("created_date");
						int hitCnt = rs.getInt("hit_cnt");
						
						String item = "<tr>";
						item += "<td>" + idx + "</td>";
						item += "<td><a href='selectBoard.jsp?num=" + idx + "'>" + title + "</a></td>";
						item += "<td>" + creatorId + "</td>";
						item += "<td>" + createdDate + "</td>";
						item += "<td>" + hitCnt + "</td>";
						item += "</tr>";
						
						out.println(item);
					}
				}
				catch (SQLException ex) {

				}
				finally {
// 					데이터 베이스 사용 후 리소스 삭제
// 					데이터 베이스는 외부 리소스이기 때문에 자바의 가비지컬렉터가 자동으로 메모리에서 삭제를 할 수 없음
// 					삭제 시 사용된 순서의 반대로 삭제해야 함
					if (rs != null) { rs.close(); }
// 					if (stmt != null) { stmt.close(); }
					if (pstmt != null) { pstmt.close(); }
					if (conn != null) { conn.close(); }
				}
				%>
			</tbody>
		</table>
		<div class="d-flex justify-content-end">
			<a href="insertBoard.jsp" class="btn btn-primary">글 쓰기</a>
		</div>
	</main>
	
<!-- 	<footer class="container-fluid fixed-bottom p-0"> -->
<!-- 		<div class="mt-3 p-5 jumbotron text-center"> -->
<!-- 			<p>made by bitc</p> -->
<!-- 		</div> -->
<!-- 	</footer> -->

	<%@ include file="footer.jsp" %>
</body>
</html>














