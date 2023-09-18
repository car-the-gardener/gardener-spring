<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/signup.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/resources/js/signup.js"></script>
    <title>회원가입</title>
  </head>

  <body>
    <form class="signup">
      <!--프로필 이미지 첨부-->
      <div>
        <img class="profile" src="../images/profile.png" />
        <b>이미지를 첨부해주세요</b>
      </div>

      <!--아이디 입력-->
      <div class="field">
        <b>아이디</b>
      </div>
      <span class="placehold-text"><input type="text" name="loginId" /></span>
      <div>
        <button type="button" class="iddupchk" />아이디 중복 확인</button>
        <!--<input type="button" class="iddupchk" value="아이디 중복 확인" />-->
      </div>
      <!--비밀번호 입력-->
      <div class="field">
        <b>비밀번호</b>
      </div>
      <div>
        <input class="pwd" type="password" name="pwd" />
      </div>
      <div>
        <b>비밀번호 확인</b>
      </div>
      <div>
        <input class="pwd confirm" type="password" />
      </div>
      <!--필명 입력-->
      <div class="field">
        <!--이메일 입력-->
      </div>
      <div class="field">
        <b>이메일</b>
      </div>
      <span class="placehold-text"><input type="email" name="email" /></span>
      <div>
        <b>필명</b>
      </div>
      <span class="placehold-text"><input type="text" name="name" /></span>
      <div>
        <button type="button" class="namedupchk" />필명 중복 확인</button>
        <!--<input type="button" value="필명 중복 확인" />-->
        <!--가입버튼-->
        <div>
          <button class="bt-Signup">회원 가입</button>
          <a href="./login.html"></a>
        </div>
      </div>
    </form>
    <div class="footer"></div>
  </body>

  </html>