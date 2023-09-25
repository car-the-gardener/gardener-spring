<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <!DOCTYPE html>
  <html>

  <head>
  
  <!-- Jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Carousel CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <!-- Font Awesome CDN -->
    <script src="https://kit.fontawesome.com/a00fe672c7.js" crossorigin="anonymous"></script>
    
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/resources/css/mypage.css" />
    <script src="/resources/js/applybtn.js"></script>
    <script src="/resources/js/mypage.js"></script>
    <script src="/resources/js/delete.js"></script>
    <script src="/resources/js/cancel.js"></script>

    <title>Member</title>
    

  </head>
  <body>

 <%@ include file="./common/header.jsp" %>
   
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
            <span> 아이디 </span><input type="text" id="loginid" value="${member.loginid}" readonly />
          </p>
          <p>
            <span>비밀번호 </span><input type="password" id="pwd" value="${member.pwd}" readonly />
          </p>
          <p>
            <span>필 명 </span><input type="text" id="nickname" value="${member.nickname}" readonly />
          </p>
          <p>
            <span>이메일 </span><input type="text" id="email" value="${member.email}" readonly />
          </p>
          <p>
            <span>가입날 </span><input type="text" id="createDate" value="${member.createDate.substring(0, 10)}" readonly />
          </p>
          <p>
            <span>자기소개 </span>
            <input class="intro" id="intro" readonly rows="3"  value= "${member.intro}" />
            <!--input type="hidden" id="profile"/-->
            <input type="hidden" id="type" value="${sessionScope.writer}"/>
		</p>
        </nav>
        <!--내 정보 내용 끝-->
      </dl>
    </header>
     <c:out value="${sessionScope.writer}"/>
    <!--본문 내용 끝-->
    <!--버튼 클릭 시작-->
    <div class="container">
      <button class="modifybtn btn" >회원정보수정</button>
      <c:choose>
      <c:when test="${sessionScope.writer == true}">
      <button class="cancel btn">작가취소</button>
      </c:when>
      <c:otherwise>
      <button class="apply btn">작가신청</button>
      </c:otherwise>
      </c:choose>
      <button class="deletebtn btn">회원탈퇴</button>
      </div>
    </div>
    
    <!--버튼 클릭 끝-->
<%@ include file="./common/footer.jsp" %>
  </body>

  </html>