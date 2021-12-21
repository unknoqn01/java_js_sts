<%@page import="com.bitc.dto.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.bitc.dto.BoardDto" %>
<%@ page import="com.bitc.dto.BoardDao" %>
    
<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter(userId);
	String userId = request.getParameter(userId);
	String userId = request.getParameter(userId);
	
	BoardDto board = new BoardDto();
	BoardDao dao = new BoardDao();

	board.setTitle(title);
	board.setContents(contents);
	board.setCreatorId(creatorId);
	
	int result = dao.boardInsert(board);
	
	response.sendRedirect("boardList.jsp");
%>
    