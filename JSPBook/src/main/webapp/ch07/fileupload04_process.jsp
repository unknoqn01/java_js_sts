<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
    
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String charSet = "UTF-8";
		String fileUploadPath = "C:\\java404\\upload";
		int limitUploadSize = 5 * 1024 * 1024;
	%>
	
	<%
		request.setCharacterEncoding(charSet);
	
		File uploadPath = new File(fileUploadPath);
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(uploadPath);
		fileItemFactory.setSizeThreshold(limitUploadSize);	
		
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try {
				List<FileItem> items = fileUpload.parseRequest(request);
					
				for (FileItem item : items) {
					//input type = "file" 인지 아닌지 확인하는 메서드
					// 일반 데이터는 true, file이면 false
					if (item.isFormField()) {
						//사용자가 서버로 전송한 input 태그의 name 속성값을 출력
						String name = item. getName();
						//사용자가 서버로 전송한 input 태그의 value 속성값을 출력
						String value = item.getString(charSet);
						out.println(name + " = " + value + "<br>");
					}else {
						//업로드된 파일의 경로를 포함하여 파일 이름을 가져옴
						String fileFieldName = item.getFieldName();
						String fileName = item.getName();
						//파일의 전체 경로 부분 중 경로를 제외한 파일명만 가져오기
						String contentType= item.getContentType();
						
						fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
						long fileSize = item.getSize();
						
						File file = new File(fileUploadPath + "/" + fileName);
						//메모리에 저장되어 있는 파일을 디스크에 저장함
						// write메서드의 매개변수가 File 클래스 타입임
						item.write(file);
						out.println("-----------------------------<br>");
						out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
						out.println("저장 파일 이름 : " + fileName + "<br>");
						out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
						out.println("파일 크기 :" + fileSize);
						
					}
				}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<h4>파일 업로드 중 오류가 발생했습니다.</h4>");
		}
	%>
	
</body>
</html>