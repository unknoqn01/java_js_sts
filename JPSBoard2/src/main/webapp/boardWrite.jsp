<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

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
    <script>
      window.addEventListener("DOMContentLoaded", function () {
        var btnCancel = document.querySelector("#btnCancel");
        btnCancel.addEventListener("click", function () {
          history.back();
        });
      });
    </script>
  </head>
  <body>
    <% String userId = (String)session.getAttribute("userId"); if (userId ==
    null) { response.sendRedirect("loginFail.jsp"); } %>

    <jsp:include page="header.jsp" flush="false"></jsp:include>

    <main class="container mt-4">
      <section class="row">
        <article class="col-sm-4">
          <form action="boardInsert.jsp" method="post">
            <div class="my-3">
              <label for="title" class="form-label">제목 : </label>
              <input
                type="text"
                class="form-control"
                id="title"
                name="title"
                placeholder="제목을 입력하세요"
              />
            </div>
            <div class="my-3">
              <label for="content" class="form-label">내용 : </label>
              <textarea
                rows="5"
                cols="30"
                class="form-control"
                id="content"
                name="content"
              >
              </textarea>
              <div>
              	<input type = "hidden" id = "userId" name = "userId" value = "<%= userId %>" >
              </div>
            </div>
            <div class="d-flex justify-content-end">
              <button type="submit" class="btn btn-primary">확인</button>
              <button type="reset" id="btnCancel" class="btn btn-secondary">
                취소
              </button>
            </div>
          </form>
        </article>
      </section>
    </main>

    <%@ include file = "footer.jsp"%>
  </body>
</html>
