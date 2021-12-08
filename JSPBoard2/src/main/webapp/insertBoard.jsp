<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 만들기</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link rel="stylesheet" href="./style/mystyle.css">

</head>
<body>
	<%@ include file="header.jsp" %>
	
	<main class="container main-footer-space">
		<form class="mt-5" action="insertBoard_process.jsp" method="post">
			<div class="mt-3">
				<label for="title">제목 : </label>
				<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
			</div>
			<div class="mt-3">
				<label for="userId">아이디 : </label>
				<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력해주세요">
			</div>
			<div class="mt-3">
				<label for="contentPw">글삭제 비밀번호 : </label>
				<input type="password" class="form-control" id="contentPw" name="contentPw" placeholder="아이디를 입력해주세요">
			</div>
			<div class="mt-3">
				<label for="contents">내용 : </label>
				<textarea rows="5" class="form-control" id="contents" name="contents" placeholder="글 내용을 입력해 주세요"></textarea>
			</div>
			<div class="d-flex justify-content-between my-3">
				<a href="boardList.jsp" class="btn btn-secondary">목록</a>
				<button type="submit" class="btn btn-primary">글 등록</button>
			</div>
		</form>
	</main>
	
	<%@ include file="footer.jsp" %>
</body>
</html>