<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기</title>
</head>
<body>

<!-- 액션 태그 사용하여 boardList.jsp 로딩 -->
<jsp:forward page="./boardList.jsp" />

	<h1>게시판 만들기</h1>
	<!-- 
	목록 페이지 : boardList.jsp
	상세 페이지 : selectBoard.jsp
	글등록 페이지 : insertBoard.jsp
	글등록 내부 프로세스 : insertBoard_process.jsp
	글수정 페이지 : updateBoard.jsp
	글수정 내부 프로세스 : updateBoard_process.jsp
	글삭제 페이지 : deleteBoard.jsp
	글삭제 내부 프로세스 : deleteBoard_process.jsp
	 -->
</body>
</html>