<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login fail</title>
<script>
	window.addEventListener("DOMContentLoaded", function() {
// 		지정한 시간이 지난 후 아래의 소스코드가 동작하는 함수
		setTimeout(function() {
// 			자바스크립트를 페이지 강제 이동
			window.location.href = "login.jsp";
		}, 5000);
	});
</script>
</head>
<body>
	<h3>로그인 실패 페이지</h3>
	<p>아이디 및 비밀번호가 틀렸습니다.</p>
	<p>5초 후 자동으로 login페이지로 이동합니다.</p>
	<a href="login.jsp">로그인 페이지로 이동</a>
</body>
</html>



