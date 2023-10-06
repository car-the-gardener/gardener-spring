<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 style="text-align: center; margin-top:10px;">
  <a href="./"><img src="https://i.imgur.com/2enY1dP.png"/></a>
</h1>

<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container">
    <a class="navbar-brand" href="#" style="font-size: 30px">작가의 정원</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <c:choose>
          <c:when test="${!empty sessionScope.member.loginid}">
            <li class="nav-item ms-5">
              <a class="nav-link" href="/posting" style="font-size: 20px">글쓰기</a>
            </li>
            <li class="nav-item ms-5">
              <a class="nav-link" href="/library" style="font-size: 20px">서재</a>
            </li>
            <li class="nav-item ms-5">
              <a class="nav-link" href="#" style="font-size: 20px">나의 정원</a>
            </li>
            <li class="nav-item ms-5">
              <a class="nav-link" href="/mypage" style="font-size: 20px">마이페이지</a>
            </li>
            <li class="nav-item ms-5">
              <a class="nav-link" href="/login" style="font-size: 20px">로그아웃</a>
            </li>
          </c:when>
          <c:otherwise>
            <li class="nav-item ms-5">
              <a class="nav-link" href="#" style="font-size: 20px">회원가입</a>
            </li>
            <li class="nav-item ms-5">
              <a class="nav-link" href="/login" style="font-size: 20px">로그인</a>
            </li>
          </c:otherwise>
        </c:choose>
      </ul>
      <!-- 모달태그 -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
           aria-hidden="true" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">

              <!--로고-->
              <body>
              <div class="logo">
                <img src="/resources/images/logo.png"/>
              </div>

              <!--로그인 내용 입력란-->
              <form class="login" method="post" name="f1">
                <input type="text" name="loginid" placeholder="아이디"/><br/>
                <input type="password" name="password" placeholder="비밀번호"/><br/>

                <div>
                  <input class="checkbox" type="checkbox"/>아이디 저장
                </div>
                <br/> <input class="loginbtn" type="submit" value="로그인"><br/>

                <!--링크-->
                <div class="sign-wrap">
											<span class="signup"> <a
                              href="/signup">회원 가입</a>
											</span> <span class="find-loginId"> <a
                        href="/find_id">아이디 찾기</a>
											</span> <span class="find-pwd"> <a
                        href="/find_pwd">비밀번호 찾기</a>
											</span>
                </div>
              </form>
            </div>
            <button type="button" class="btn btn-default" id="closebtn" data-dismiss="modal">close</button>
          </div>
        </div>
      </div>
      <!-- 모달태그 끝 -->


    </div>
  </div>
</nav>

