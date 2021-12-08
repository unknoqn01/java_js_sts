<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getServletPath();

	int k = path.lastIndexOf('/');
	
	path = path.substring(k+1,path.length());
	
	String pageName = "";
	
	if (path.equals("phoneList.jsp")) {
		pageName = "연락처";
	}
	else if (path.equals("selectPhone.jsp")) {
		pageName = "연락처 상세";
	}
	else if (path.equals("insertPhone.jsp")) {
		pageName = "연락처 등록";
	}
	else if (path.equals("upPhone.jsp")) {
		pageName = "연락처 수정";
	}
	else if (path.equals("delPhone.jsp")) {
		pageName = "연락처 삭제";
	}
	%>
<header>
	<div>
		<h1><%= pageName %></h1>
	</div>
</header>

