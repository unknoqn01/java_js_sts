<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>로그인</title>

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
        <article class="col-sm-4 mx-auto">
          <form action="loginCheck.jsp" method="post">
            <div class="my-3">
              <label for="user_id" class="form-label">ID : </label>
              <input
                type="text"
                class="form-control"
                id="user_id"
                name="user_id"
                placeholder="ID를 입력해주세요"
              />
            </div>
            <div class="my-3">
              <label for="user_pw" class="form-label">PW : </label>
              <input
                type="password"
                class="form-control"
                id="user_pw"
                name="user_pw"
                placeholder="PW를 입력해주세요"
              />
            </div>
            <div class="d-grid g-3">
              <button type="submit" class="btn btn-primary">로그인</button>
              <a href = "signin.jsp"  class="btn btn-secondary">회원 가입</a>
            </div>
          </form>
        </article>
      </section>
    </main>
    
	<%@ include file = "footer.jsp" %>
  </body>
</html>
