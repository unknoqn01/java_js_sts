<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.bitc.dto.BoardDto" %>
<%@ page import="com.bitc.dto.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>게시판 목록</title>
    
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
      integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
      integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
      crossorigin="anonymous"
    ></script>

  </head>
  <body>

	<jsp:include page="header.jsp" flush="false"></jsp:include>
    
    <main class="container">
      <section class="row">
        <article class="col-sm">
          <div class="table-responsive-sm">
            <table
              class="table table-hover table-striped text-center table-bordered"
            >
              <colgroup>
                <col width="10%" />
                <col width="50%" />
                <col width="15%" />
                <col width="15%" />
                <col width="10%" />
              </colgroup>
              <thead>
				<tr>
	                <th>글번호</th>
	                <th>제목</th>
	                <th>글쓴이</th>
	                <th>등록시간</th>
	                <th>조회수</th>
              	<tr>
              </thead>
              <tbody>
				<%
					BoardDao dao = new BoardDao();
					ArrayList<BoardDto> boardList = dao.selectBoardList();

					for (BoardDto item : boardList) {
                        String data = "";
                        data += "<tr>";
                        data += "<td>" + item.getIdx() + "</td>";
                        data += "<td class='text-start'><a class='text-decoration-none' href='boardSelect.jsp?idx=" + item.getIdx() + "'>" + item.getTitle() + "</a></td>";
                        data += "<td>" + item.getCreatorId() + "</td>";
                        data += "<td>" + item.getCreatedDate() + "</td>";
                        data += "<td>" + item.getHitCnt() + "</td>";
                        data += "</tr>";
                        
                        out.println(data);
                     }
				%>
              </tbody>
            </table>
          </div>
          <div class="clearfix">
            <a
              href="boardWrite.jsp"
              type="button"
              class="btn btn-primary float-end"
              >글쓰기</a
            >
          </div>
        </article>
      </section>
    </main>

	<%@ include file = "footer.jsp" %>
  </body>
</html>
