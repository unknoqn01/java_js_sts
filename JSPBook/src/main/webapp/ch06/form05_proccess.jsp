<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 태그</title>
</head>
<body>
	<%
	//한글 출력을 정상적으로 하기 위해서 설정
		request.setCharacterEncoding("utf-8");
	
	//클라이언트에서 request 내장객체에서 값을 받아오기
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String phone1 = request.getParameter("select-phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String userGender = request.getParameter("userGender");
		//hobby가 클라이언트에서 checkbox 이며, 식별자인 name을 동일한 이름으로 사용하고 있어 
		//서버로 데이터 전송 시 배열로 데이터를 전송함
		//request 내장 객체에서 데이터를 가져올 때 getParameterValues를 사용하여 배열도 가져옴
		String hobby[] = request.getParameterValues("hobby");
		String comment = request.getParameter("comment");
	%>
	
	<p>아이디 : <%=userId %></p>
	<p>비밀번호 : <%=userPw %></p>
	<p>이름 : <%=userName %></p>
	<p>연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
	<p>성별 : <%=userGender %></p>
	<p>취미 : <%
				//취미가 없을 경우 없음으로 표기
				if (hobby != null) {
					for (int i = 0; i<hobby.length; i++) {	
						//널값 안 보이게 표시
						if (hobby[i] == null || hobby[i].trim().equals("")) {
							continue;
						}
						out.println(hobby[i] + "");
					}
				}  else {
						out.println("없음");
						}
			%></p>
	<p>가입 인사 : <%=comment %></p>
</body>
</html>