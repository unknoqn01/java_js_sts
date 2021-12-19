<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="member" class = "daodto.MemberDto"/>
<jsp:useBean id="dao" class = "daodto.MemberDao"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dao, dto를 이용한 DB 사용</title>
</head>
<body>

	
	<%
		int result = 0;		
		
		member.setId("tester10");
		member.setPasswd("bitc1234");
		member.setName("테스터10");
		
		result = dao.memberInsert(member);
		
		if (result > 0) {
			out.println("데이터 베이스에 " + result + "개의 정보가 정상적으로 추가되었습니다");
		} else {
			out.print("데이터 베이스에 정보 입력 시 오류가 발생했습니다");
		}
	%>
</body>
</html>