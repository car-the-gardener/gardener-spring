<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="../css/login.css" />
    <script src="../js/login.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>로그인</title>
  </head>

  <!--로고-->

  <body>
    <div class="logo">
      <img src="../images/logo.png" />
    </div>

    <!--내용 입력란-->
    <form class="login" method="post" name="f1">
      <input type="text" name="loginId" placeholder="아이디" /><br />
      <input type="password" name="pwd" placeholder="비밀번호" /><br />

      <div><input class="checkbox" type="checkbox" />아이디 저장</div>
      <br />
      <input class="loginbtn" type="submit" value="로그인"><a href="./index.html"></a><br />
      <!--<button class="loginbtn"><a href="../index.html">로그인</a></button><br />-->

      <!--링크-->
      <div class="sign-wrap">
        <span class="signup">
          <a href="./signup.html">회원 가입</a>
        </span>

        <span class="find-loginId">
          <a href="./find_loginId.html">아이디 찾기</a>
        </span>

        <span class="find-pwd">
          <a href="./find_pwd.html">비밀번호 찾기</a>
        </span>
      </div>
    </form>
  </body>

  </html>