<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	
	<%@ include file="header.jsp" %>
	
	<main>
		<form action="delPhone_process.jsp" method="post">
			<div>
				<label for="idx">삭제할 글 번호 : </label>
				<input type="text" id="idx" name="idx" readonly value="<%= num %>">
			</div>
			<div>
				<div>
					<a href="phoneList.jsp">목록</a>
				</div>
				<div>
					<button type="submit">삭제</button>
					<button type="button" id="btn-cancel">취소</button>
				</div>
			</div>
		</form>
	</main>
	
	<%@ include file="footer.jsp" %>
</body>
</html>