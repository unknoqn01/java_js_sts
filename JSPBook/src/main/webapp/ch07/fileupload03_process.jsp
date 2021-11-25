<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- apache 재단의 commons-fileupload 라이브러리를 사용하기 위해 등록 -->
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<%!
// 	JSP의 선언부, 클래스의 멤버 변수로 선언 됨
	String charSet = "UTF-8"; // 문자셋
	String fileUploadPath = "C:\\java404\\upload"; // 파일 저장 폴더
	int limitUploadFileSize = 5 * 1024 * 1024; // 5MB
	%>
	
	<%
	request.setCharacterEncoding(charSet);
	
// 	파일 저장 폴더를 가지고 File 클래스 타입의 객체를 생성
// 	DiskFileItemFacotry 클래스에서 파일 저장 폴더를 설정하는 메서드인 setRepository() 의 매개변수가 File 클래스 타입의 객체를 사용함
	File uploadPath = new File(fileUploadPath);
	
// 	DiskFileItemFactory : 업로드된 파일을 저장할 저장소와 관련된 클래스로 FileItem 객체를 생성함
// 	DiskFileItemFactory는 기본값으로 10kb, 파일 저장 장소를 시스템 기본 임시 폴더를 사용함
// 	getDefaultCharset() : 기본값을 지정된 문자셋을 출력
// 	getRepository() : 기본값으로 지정된 파일 저장 폴더를 출력
// 	getSizeThreshold() : 기본값으로 지정된 최대 파일 크기를 출력
// 	setDefaultCharset(String 문자셋) : 사용할 문자셋을 설정
// 	setRepository(File 파일저장경로) : 사용할 파일 저장 경로를 설정
// 	setSizeThreshold(int 파일크기) : 사용할 파일의 최대 크기를 설정
	DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
// 	원하는 폴더에 파일을 저장할 수 있도록 설정
	fileItemFactory.setRepository(uploadPath);
// 	fileItemFactory.setRepository(new File("c:\\java404\\upload"));
// 	원하는 크기의 최대 파일 크기로 설정
	fileItemFactory.setSizeThreshold(limitUploadFileSize);
	
// 	DiskFileUpload 클래스는 현재 사용이 중단 됨, ServletFileUpload를 사용하여 파일 업로드를 구현해야 함
// 	ServletFileUpload : 업로드된 파일 처리를 위한 높은 수준의 API, HTTP 요청에 대한 httpServletReqeust 객체로부터 multipart/form-data 형식을 입력받아 다루기 쉽게 변환해 주는 역할을 하는 클래스
// 	getItemIterator(HttpServletReqeust request) : FileItemIterator 타입으로 데이터를 반환
// 	isMultipartContent(HttpServletReqeust request) : 요청 중 다중 부분 컨텐츠가 존재 하는지 여부를 반환
// 	parseParameterMap(HttpServletReqeust request) : Map<String, List<FileItem>> 타입으로 데이터를 반환
// 	parseRequest(HttpServletReqeust request) : List<FileItem> 타입으로 데이터를 반환
	ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
	
	try {
// 		ServletFileUpload 클래스 타입의 객체 fileUpload의 parseRequest() 메서드 사용 시 FileItem 타입의 리스트를 생성하여 반환함
		List<FileItem> items = fileUpload.parseRequest(request);
		
		for (FileItem item : items) {
// 			input type="file" 인지 아닌지 확인하는 메서드
// 			일반 데이터는 true, file이면 false
			if (item.isFormField()) {
				String title = item.getString(charSet);
				out.println("<h3>" + title + "</h3>");
			}
			else {
// 				업로드된 파일의 경로를 포함하여 파일 이름을 가져옴
				String fileName = item.getName();
				out.println("<h4>" + fileName + "</h4>");
// 				파일의 전체 경로 부분 중 경로를 제외한 파일명만 가져오기
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				
				File file = new File(fileUploadPath + "/" + fileName);
// 				메모리에 저장되어 있는 파일을 디스크에 저장함
// 				write메서드의 매개변수가 File 클래스 타입임
				item.write(file);
				out.println("파일 이름 : " + fileName + "<br>");
			}
		}
	}
	catch (Exception e) {
		e.printStackTrace();
		out.println("<h2>파일 업로드 중 오류가 발생했습니다.</h2>");
	}
	%>
</body>
</html>











