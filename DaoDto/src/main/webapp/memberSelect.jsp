<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="daodto.MemberDto"%>
<%@ page import="daodto.MemberDao"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAO, DTO를 이용한 DB 사용</title>
</head>
<body>
	<%
		/* 
		자바빈즈를 사용하는 방법 2가지 
		1.액션 태그의 useBeans 사용 
		2.자바에서 사용하듯이 클래스 객체 생성
		*/
		
		MemberDao dao = new MemberDao();
		ArrayList<MemberDto> members = dao.memberSelect();
		
		for (int i = 0; i < members.size(); i++) {
			MemberDto item = members.get(i);
			
			String id = item.getId();
			String pw = item.getPasswd();
			String name = item.getName();
			
			out.print("아이디 : " + id + "<br>비밀번호 : " + pw + "<br>이름 : " + name);
			out.print("<br>--------------------------------------<br>");
		}
	%>

</body>
</html>