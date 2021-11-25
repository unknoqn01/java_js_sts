<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
<script>
window.addEventListener("DOMContentLoaded", function() {
	var number = documnet.querySelector("#number");
	number.innerText = "30";
});
</script>
</head>
<body>
	<!-- JSP 페이지에서 결과를 출력시 -->
	<!-- 서버에서 연산을 진행하여 그 결과를 클라이언트에 전송하는 것 -->
	<%!
	int data = 50;
	%>

	<%
	out.println("Value of the variable is : " + data);
	%>
	
	<!-- 기존의 정적인 페이지에서 같은 결과를 원할 경우 -->
	<!-- 결과는 동일하지잠ㄴ 자바스크립트를 사용 시 서버에서 연산이 발생된 것이 아니라 
	클라이언트의 화면에서 변경된 것일 뿐임-->
	<p>Value of the variable is :<span id ="number"></span></p>

</body>
</html>