<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연락처</title>
</head>
<body>
	<%@ include file="header.jsp" %>

	<main>
		<form action = "insertPhone_process.jsp" method = "post"> 
		
			<div>
				<label for = "name">이름 : </label>
				<input type = "text" id = "name" name = "name" placeholder = "이름을 입력해주세요">
			</div>
			<div>
				<label for = phone1>폰 번호 : </label>
				<input type = "text" id = "phone1" name = "phone1" placeholder = "폰 번호를 입력해주세요">
			</div>
			<div>
				<label for = phone2>전화 번호 : </label>
				<input type = "text" id = "phone2" name = "phone2" placeholder = "전화 번호을 입력해주세요">
			</div>
			<div>
				<label for = email>이메일 : </label>
				<input type = "text" id = "email" name = "email" placeholder = "이메일을 입력해주세요">
			</div>
			<div>
				<label for = address>주소 : </label>
				<input type = "text" id = "address" name = "address" placeholder = "주소을 입력해주세요">
			</div>
			<div>
				<label for = "contents">내용 : </label>
				<textarea rows="5" id = "contents"
				name = "contents" placeholder = "글 내용을 입력하세요"></textarea>
			</div>
			
			<div>
				<button><a href = "phoneList.jsp">목록</a></button>
			<button type = "submit">등록</button>
			</div>
		</form>
	</main>
	
	<%@ include file="footer.jsp" %>

</body>
</html>