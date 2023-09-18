<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/member.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../js/applybtn.js"></script>
    <script src="../js/member.js"></script>
    <script src="../js/cancel.js"></script>
    <script src="../js/delete.js"></script>

    <title>Member</title>
  </head>

  <body>
    <div class="header"></div>
    <!--내정보 이름 시작-->
    <div style="text-align: center">
      <div class="mypage">내 정보</div>
    </div>
    <!--내정보 이름 끝-->

    <!--본문 내용 시작-->
    <header>
      <dl>
        <!--프로필 사진 시작-->
        <div class="profile-photo" style="margin-left: 140px">
          <img id="imgThumb" src="https://i.imgur.com/qyTEOBF.jpg" style="height: 150px" width="150px" />
          <span class="mask"></span>
        </div>
        <!--프로필 사진 끝-->
        <!--내 정보 내용 시작-->
        <nav>
          <p>
            <span>아이디:</span><input type="text" id="loginId" value="${member.loginid}" readonly />
          </p>
          <p>
            <span>비밀번호:</span><input type="text" id="pwd" value="${member.pwd}" readonly />
          </p>
          <p>
            <span>필 명:</span><input type="text" id="name"  readonly />
          </p>
          <p>
            <span>이메일:</span><input type="text" id="email"  readonly />
          </p>
          <p>
            <span>가입날:</span><input type="text" id="joinDate" value="2023년07월26일" readonly />
          </p>
          <p>
            <span>자기소개:</span><input class="intro" type="text" id="intro"  readonly />
          </p>
        </nav>
        <!--내 정보 내용 끝-->
      </dl>
    </header>
    <!--본문 내용 끝-->
    <!--버튼 클릭 시작-->
    <div class="container">
      <button class="modifybtn btn">회원정보수정</button>
      <button class="cancelbtn btn">작가신청</button>
      <div class="cancel">
        <button class="deletebtn">회원탈퇴</button>
      </div>
    </div>
    <!--버튼 클릭 끝-->
    <div class="footer"></div>
  </body>

  </html>