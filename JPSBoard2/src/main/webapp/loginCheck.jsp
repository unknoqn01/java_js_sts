<%@page import="com.bitc.dto.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bitc.dto.MemberDao" %>
<%@ page import="com.bitc.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		/*
		1. 사용자가 입력한 정보 가져오기
		2. DB 연결
		3. DB에서 사용자가 입력한 정보가 존재하는지 확인
		4-1. DB 겁색 결괴를 가지고 있으면 DB에서 상세 정보 가져오기
		4-2. DB 검색 결과가 없으면 loginFail.jsp로 이동하기
		5. DB에서 가져온 정보를 세션에 저장하기 
		*/
		
		String userId = request.getParameter("user_id");
		String userPw = request.getParameter("user_pw");
		
		/* DB 연결, DTO, DAO를 사용해서 연결*/
		MemberDao dao = new MemberDao();
		
		int count = dao.idPwChck(userId, userPw);
	
		if (count > 0) {
	//	사용자 정보 불러오기
			/* 세션(session) 저장 */		
			MemberDto member = dao.getuserInfo(userId);
	
			session.setAttribute("userId", member.getUserId());		
			session.setAttribute("userName", member.getUserName());		
			session.setAttribute("userEmail", member.getUserEmail());		
	
			response.sendRedirect("boradList.jsp");
		}
		else {
			/* login fail */		
			response.sendRedirect("login.jsp");
		}
	%>
	
</body>
</html>