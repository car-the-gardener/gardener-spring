<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"
></script>
<title>Document</title>
</head>

<body>

	<h1>
		<a href="./index.html"><img src="https://i.imgur.com/2enY1dP.png" /></a>
	</h1>
	<header>
		<nav>
			<ul>
				<li><a href="./library.html" class="library">서재</a></li>
				<li><a href="./garden.html" class="write">나의 정원</a></li>
				<li><a href="./member.html" class="user">마이페이지</a></li>
				<li><a href="./signup.html" class="signup">회원가입</a></li>
				<li><a href="./login.html" class="login">로그인</a></li>
			</ul>
		</nav>
	</header>

	<script>
      if (sessionStorage.getItem("name") !== null) {
        $("nav ul li:nth-child(n+4)").remove();
        $("nav ul")
          .append(`<li><a href=/back/front/html/posting.html>글쓰기</li>`)
          .append(`<li><a style='cursor:pointer;'>로그아웃</a></li>`)
        $("ul li:last > a").click(() => {
          sessionStorage.removeItem("name");
          $.ajax({
            url: `/back/logout`,
            success: () => {
              history.go(0);
            }
          })
        })
      }
    </script>
</body>

</html>