<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/library_wr.css" />
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="../js/library_wr.js"></script>
    <title>나의 서재(내가 구독한 작가)</title>
  </head>

  <body>
    <div class="header"></div>
    <!--좋아요글 메뉴, 구독작가 메뉴 선택-->
    <div class="library_view">
      <div class="library_like" id="library_like">
        <span class="like" id="like">
          <a href="./library.html">
            <h4>북마크 한 글</h4>
          </a></span>
      </div>
      <div class="library_following">
        <span class="following" id="following">
          <a href="./library_wr.html">
            <h4>구독한 작가</h4>
          </a></span>
      </div>
    </div>
    <!--구독하는 작가 노출영역-테이블로 표현-->
    <div class="following">
      <!--테이블 영역-->
      <table border="0">
        <tbody>
          <tr>
            <td><img src="../images/writter.jpg" onerror="this.src='../images/wr_img.jpg'" alt="작가기본이미지" /></a></td>
            <td>구독작가1작가명</td>
            <td><input type="button" class="subscribe" value="구독 중" /></td>
            <td><img src="../images/writter.jpg" onerror="this.src='../images/wr_img.jpg'" alt="작가기본이미지" /></a></td>
            <td>구독작가2작가명</td>
            <td><input type="button" class="subscribe" value="구독 중" /></td>
          </tr>
          <tr>
            <td><img src="../images/writter.jpg" onerror="this.src='../images/wr_img.jpg'" alt="작가기본이미지" /></a></td>
            <td>구독작가3작가명</td>
            <td><input type="button" class="subscribe" value="구독 중" /></td>
            <td><img src="../images/writter.jpg" onerror="this.src='../images/wr_img.jpg'" alt="작가기본이미지" /></a></td>
            <td>구독작가4작가명</td>
            <td><input type="button" class="subscribe" value="구독 중" /></td>
          </tr>
          <tr>
            <td><img src="../images/writter.jpg" onerror="this.src='../images/wr_img.jpg'" alt="작가기본이미지" /></a></td>
            <td>구독작가5작가명</td>
            <td><input type="button" class="subscribe" value="구독 중" /></td>
            <td><img src="../images/writter.jpg" onerror="this.src='../images/wr_img.jpg'" alt="작가기본이미지" /></a></td>
            <td>구독작가6작가명</td>
            <td><input type="button" class="subscribe" value="구독 중" /></td>
          </tr>
        </tbody>
      </table>
    </div>
    <!--테이블 영역-->

    <div class="footer"></div>
  </body>

  </html>