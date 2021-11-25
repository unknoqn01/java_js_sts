<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>param 액션 태그</h3>
	<form>
		<input type="text" id="userid" name="userid">	
	
	</form>
	<jsp:forward page="param01_data.jsp">
		<jsp:param name="id" value="admin"/>
		<!--  한글을 전달할 경우 정상적으로 전달이 안될 경우가 발생할 수 있으므로
		URLEncoder 클래스의 encode()메소드를 사용하여 다른 파일로 데이터를 전달함 -->
		<jsp:param name="name" value= '<%=java.net.URLEncoder.encode("관리자","UTF-8") %>'/>
	</jsp:forward>
		<p>Java Server Page
</body>
</html>