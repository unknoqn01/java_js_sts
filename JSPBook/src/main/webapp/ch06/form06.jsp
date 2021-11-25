<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="form06_proccess.jsp" method = "post">
		<label for = "userId"> 아이디 : </label>
		<input type = "text" id = "userId" name = "userId" placeholder="아이디를 입력해 주세요">
		<button type = "button"  id ="btn-idCheck">아이디 중복 검사</button><br>
		<label for = "userPw">비밀번호 : </label>
		<input type ="password" id = "userPw" name = "userPw" placeholder="비밀번호를 입력해 주세요"><br>
		<label for = "userName">이름 : </label>
		<input type = "text" id = "userName" name ="userName" placeholder="이름을 입력해 주세요"><br>
		<label for = "select=phone1">연락처 : </label>
		<select name = "select-phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="017">017</option>
		</select>
		<input type="text" id = "phone2" name="phone2" size = "4"> - 
		<input type="text" id = "phone3" name="phone3" size = "4"><br>
		<label>성별 : </label>
		<input type = "radio" id ="userGenderM" name = "userGender" value = "남자"> 남성
		<input type = "radio" id ="userGenderF" name = "userGender" value = "여자"> 여성<br>
 		<label>취미 : </label>
		<input type = "checkbox" id = "hobby" name = "hobby1" value ="독서" checked>독서 
		<input type = "checkbox" id = "hobby" name = "hobby2" value = "운동">운동	
		<input type = "checkbox" id = "hobby" name = "hobby2" value = "영화">영화	
		<br>
		<textarea name="comment" rows="10" cols="30" placeholder="가입인사를 입력해주세요"></textarea><p>
		<input type = "submit" value = "가입하기">
		<input type = "reset" value = "다시하기">
	</form>
	
</body>
</html>