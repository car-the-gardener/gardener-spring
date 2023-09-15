<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">
  <html>

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/library.css" />
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!--제이쿼리 버전-->
    <script src="../js/library.js"></script>
    <title>나의 서재(내가 좋아요한 글)</title>
  </head>

  <body>
    <div class="header"></div>
    <!--좋아요글 메뉴, 구독작가 메뉴 선택-->
    <div class="library_view">
      <div class="library_like" id="library_like">
        <span class="like" id="like">
          <a href="./library.html">
            <h4>북마크 글</h4>
          </a></span>
      </div>
      <div class="library_following">
        <span class="following" id="following">
          <a href="./library_wr.html">
            <h4>구독한 작가</h4>
          </a></span>
      </div>
    </div>
    <!--작가글 타이틀 -->
    <div class="posts-title">
      <h3>내가 북마크한 글 모음</h3>
      <!--작가글 노출 영역 -->
      <div class="posts_part">
        <div class="post">
          <a class="thumbnail" href="#글이동" alt="글썸네일">
            <img src="" onerror="this.src='../images/alt_img.jpg'" />
          </a>
          <div class="post-title-writer">
            ‘어서 오세요, 휴남동 서점입니다’ - 황보름
          </div>
          <span class="post-content">
            어서 오세요, 휴남동 서점입니다(클레이하우스)는 우리가 잃어버린 채
            살고 있지만 사는 데 꼭 필요한 것들이 가득한 책이다. 배려와 친절,
            거리를 지킬 줄 아는 사람들끼리의 우정과 느슨한 연대, 진솔하고 깊이
            있는 대화 등. 출간 즉시 전자책 TOP 10 베스트셀러에 오르며 수많은
            독자의 찬사를 받았고, 독자들의 강력한 요청으로 마침내 종이책으로
            다시 태어났다. 서울 어디에나 있을 것 같은 동네의 후미진 골목길.
            오가는 사람도 많지 않은 가정집들 사이에 평범한 동네 서점 하나가
            들어선다. 바로 휴남동 서점. 슬픈 사연을 갖고 있는 사람처럼 얼굴에
            아무런 의욕도 보이지 않는 서점 주인 영주는 처음 몇 달간은 자신이
            손님인 듯 일은 하지 않고 가만히 앉아 책만 읽는다. 그렇게 잃어버린
            것들을 하나둘 되찾는 기분으로 하루하루를 보내다 보니 소진되고 텅
            빈 것만 같았던 내면의 느낌이 서서히 사라진다. 그러다 어느 순간
            깨닫는다. 자신이 꽤 건강해졌다는 사실을. 그 순간부터 휴남동 서점은
            완전히 새로운 공간이 된다. 사람이 모이고 감정이 모이고 저마다의
            이야기가 모이는 공간으로. 바리스타 민준, 로스팅 업체 대표 지미,
            작가 승우, 단골손님 정서, 사는 게 재미없는 고등학생 민철과 그의
            엄마 희주 등 크고 작은 상처와 희망을 가진 사람들이 휴남동
            서점이라는 공간을 안식처로 삼아 함께 살아가는 법을
            배운다.“종이책으로 나오면 좋겠다! 소장하고 싶은 책”, “읽는 내내
            위로받는 느낌”, “소설이 아니라 현실에 존재하는 공간이었으면”,
            “지친 일상의 피로회복제 같은 소설” 등 수많은 찬사를 받으며,
            브런치북 전자책 출판 프로젝트 수상작들 중 단연 가장 큰 인기를
            누리고 있다. 독자 리뷰가 150개가 올라왔다.
          </span>
        </div>
      </div>
    </div>

    <div class="footer"></div>
  </body>

  </html>

  </html>