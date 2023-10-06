<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"
          integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  <script src="/resources/js/library.js" defer></script>
  <link rel="stylesheet" href="/resources/css/library.css">
  <title>찜</title>
</head>
<body>
<h1 style="text-align: center; margin-top:10px;">
  <a href="./"><img src="https://i.imgur.com/2enY1dP.png"/></a>
</h1>
<main>
  <ul>
    <li><span class="favorite">좋아요</span></li>
    <li><span class="subscribe">구독</span></li>
  </ul>

  <section>
    <div class="section-post">
      <div></div>
      <div></div>
    </div>
  </section>

  <hr class="hr">

</main>
<input type="hidden" class="postResponse" value='${post}'>

</body>
</html>
