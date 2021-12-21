<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<!-- 세션 정보 가져오기 -->
	<%
   		// 세션을 가지고 올 경우 object 타입으로 가지고 옴 
    	// 세션에서 정보를 가지고 올 때 형변환이 필수임 
	
    	String userId = (String)session.getAttribute("userId");
	    String userName = (String)session.getAttribute("userName");
	    String userEmail = (String)session.getAttribute("userEmail");
	    	
	%>
	
	<%
	   // 현재 페이지 파일명을 불러옴
	   String path = request.getServletPath();
	   // '/' 문자가 있는 위치를 가져오기
	   int k = path.lastIndexOf('/');
	   // 첫번째 지정한 위치에서 두번째 지정한 위치까지의 문자를 가져오기
	   path = path.substring(k + 1, path.length());

	   String pageName = ""; // 각 페이지 제목란에 출력할 문자를 저장할 변수

	   if (path.equals("boardList.jsp")) {
	      pageName = "게시판 목록 페이지";
	   }
	   else if (path.equals("login.jsp")) {
	      pageName = "로그인 페이지";
	   }
	   else if (path.equals("logout.jsp")) {
	      pageName = "로그 아웃 페이지";
	   }
	   %>
	%>
     <header class="container-fluid px-0">
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a href="#" class="navbar-brand">JSP Board</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-targer="#mynavbar"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a href="#" class="nav-link active">메뉴 1</a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">메뉴 2</a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">메뉴 3</a>
            </li>
          </ul>
        </div>
        <div class="d-flex">
          <div class="d-flex">
           <%
           if ( userId == null || userName ==null) {
			out.println("<a href='login.jsp' class= 'btn btn-outline-primary'>로그인</a>");
          	}
          	else {
				out.println("<p class='navbar-text mb-0 me-3'><span>"+ userName + "님 반갑습니다</span></p>");
				out.println("<a href='logout.jsp' class='btn btn-outline-primary'>로그아웃</a>");		
          	}
          %>
          </div>
        </div>
      </nav>
      <div class="container">
        <div class="mt-4 p-5 bg-secondary rounded bg-opacity-50">
          <h1 class="text-center"><%= pageName %></h1>
        </div>
      </div>
    </header>
