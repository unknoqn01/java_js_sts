<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = "1">
		<thead>
			<tr>
				<th>요청 파라미터 이름</th>
				<th>요청 파라미터 값</th>
			</tr>
		</thead>
		<tbody>
			<%/*	request.setCharacterEncoding("utf-8");
				
				Enumeration paramNames = request.getParameterNames();
				while (paramNames.hasMoreElements()) {
					String name = (String) paramNames.nextElement();
					out.print("<tr><td>" + name + "</td>\n");
					String paramValue = request.getParameter(name);
					out.println("<td> " + paramValue + "</td></tr>\n");
				}
			*/
			%>
			
		  	
			<%
				request.setCharacterEncoding("utf-8");
			
				Enumeration<String> paramNames = request.getParameterNames();
				
				while (paramNames.hasMoreElements()) {
					String name = paramNames.nextElement();
					String paramValue = "";
					
					//if (request.getParameter(name).getClass().isArray()) {
					if (name.equals("hobby")) {
						String arrStr[] = request.getParameterValues(name);
						
						for (int i = 0; i< arrStr.length; i++) {
							paramValue += arrStr[i]+ " " ;		
						}
					}
					else {
							paramValue = request.getParameter(name);					
					}
					
					String strTag = "<tr>";
					strTag += "<td>" + name + "<td>";
					strTag += "<td>" + paramValue + "<td>";
					strTag += "<tr>";
					
				}
					
				%>		
			
				
		
		</tbody>
	</table>
</body>
</html>