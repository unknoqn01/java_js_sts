<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- cos.jar 라이브러리를 사용하ㅏ여 파일 업로드를 처리 -->
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>

	<% 
		// 얼보드된 파일을 cos.jar 라이브러리의 MultipartRequest 클래스를 사용하여 처리함
		// MultipartReques 클래스 타입의 변수 선언
		// 첫번째 매개변수롤 내장객체인 request를 사용, 두번째 매개변수로 파일이 저장될 경로를 
		// 설정(해당 폴더가 없을 경우 오류가 발생함)
		// 세번째 매개변수로 업로드할 파일의 최대 크기를 설정(여기서 사용된 1024는 컴퓨터가
		// 2진수로 계산하므로 1000을 2의 10승으로 계산하기 때문임)
		// 네번째 매개변수로 사용할 문자셋을 설정하고 마지막 매개변수로 중복 파일의 이름 변경 규칙을 설정함
		
		MultipartRequest multi = new MultipartRequest(request, "C:\\java404\\upload", 				5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		
		//MultipartRequest 클래스 타입의 객체에서 getParameterNames()를 사용하여
		//클라이언트에서 전송한 텍스트 데이터의 이름을 모두 가져옴
		
		Enumeration params = multi.getParameterNames();
		//Enumeration<String> params = multi.getParameeterNames();
		//최신
		
		// 가져온 텍스트 데이터를 반복문을 통해서 출력
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement(); // 데이터 가져오기
			String value = multi.getParameter(name);	//지정된이름과 값 가져오기 
			out.println(name + " = " + value + "<br>");
		}
		out.println("------------------------------<br>");
		
		//MultipartRequest 클래스 타입의 객체가 가지고 있는 파일 데이터의 이름만 모두 가져옴
		Enumeration files = multi.getFileNames();
		
		while (files.hasMoreElements()) {
			// 파일에 관련된 정보 중 name 속성 값을 가져옴
			String name = (String) files.nextElement();
			//서버에 저장된 이름을 가져옴
			String filename = multi.getFilesystemName(name);
			// 서버에 업로드 되었을 때의 원본 이름을 가져옴	
			String original = multi.getOriginalFileName(name);
			//파일의 컨텐츠 타입을 가져옴
			String type = multi.getContentType(name);
			//java.io 패키지의 File 클래스 타입의 객체를 생성하고 파일 정보를 저장함
			File file = multi.getFile(name); 
			
			out.println("요청 파라미터 이름 : " + name + "<br>");
			out.println("실제 파일 이름 : " + original + "<br>");
			out.println("저장 파일 이름 : " + filename + "<br>");
			out.println("파일 콘텐츠 유형 : " + type + "<br>");
			
			if (file != null) {
				out.println(" 파일 크기 : " + file.length());
				out.println("<br>");
			}
		}
	%>
	
	 
</body>
</html>