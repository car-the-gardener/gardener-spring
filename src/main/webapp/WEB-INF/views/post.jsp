<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/resources/js/post.js"></script>
    <link rel="stylesheet" href="/resources/css/post.css">
    <title>Document</title>
</head>

<body>

<!-- 섹션 시작 -->
<section>
    <!-- 섹션 헤더 시작 -->
    <div class="section-header-image">
        <div class=" main-image"></div>
    </div>
    <!-- 섹션 헤더 제목 시작 -->
    <div class="section-header-title">
        <div class="section-header-main-title">대제목</div>
        <div class="section-header-main-subtitle">물리학 하는 사람들은 로맨틱하다.</div>
    </div>
    <!-- 섹션 헤더 제목 끝 -->
    <!-- 섹션 헤더 글 정보 시작 -->
    <div class="section-header-info">
        <div class="section-header-info-writer">이완</div>
        <div class="section-header-info-date">2023-07-26</div>
    </div>
    <!-- 섹션 헤더 글 정보 끝 -->
    <!-- 섹션 헤더 끝 -->

    <!-- 아티클 시작 -->
    <article>
        사랑의 물리학 / 김인육
        질량의 크기는 부피와 비례하지 않는다
        제비꽃같이 조그마한 그 계집애가
        꽃잎같이 하늘거리는 그 계집애가
        지구보다 더 큰 질량으로 나를 끌어당긴다.
        순간, 나는
        뉴턴의 사과처럼
        사정없이 그녀에게로 굴러 떨어졌다
        쿵 소리를 내며, 쿵쿵 소리를 내며
        심장이
        하늘에서 땅까지
        아찔한 진자운동을 계속하였다
        첫사랑이었다.
    </article>
    <!-- 아티클 끝 -->

    <!-- 수정, 삭제, 저장 버튼 시작 -->
    <!-- 내 글을 확인할 때는 수정, 삭제만 보이게, 다른 사람 글은 반대로 -->
    <div class="btn-wrap">
        <!-- 섹션 헤더 엄지척,신고 시작 -->
        <div class="section-header-icon">
            <div>
                <img src="/resources/images/thumbs-up.png" alt="좋아요 표시">
                <span>5</span>
                <div><img src="/resources/images/report.png" alt="신고 이미지"></div>
            </div>
        </div>
        <!-- 섹션 헤더 엄지척,신고 끝 -->

        <div class="modify-btn">
            <div>
                <button>수정</button>
                <button>삭제</button>
            </div>
        </div>
    </div>
    <!-- 수정, 삭제, 저장 버튼 끝 -->

    <!-- 작가 프로필 시작 -->
    <hr>
    <div class="writer-profile">
        <div class="writer-profile-info">
            <div class="writer-profile-name">이수완</div>
            <div class="writer-profile-intro">충남 보령시에서 왔수다</div>
        </div>
        <div class="writer-profile-pic">
            <img src="https://thumb.mt.co.kr/06/2023/06/2023062717453220668_1.jpg/dims/optimize/" alt="작가 프로필 이미지">
        </div>
    </div>
    <!-- 작가 프로필 끝 -->

    <!-- 댓글 시작 -->
    <div class="section-reply">
        <!-- 댓글 작성 시작 -->
        <div>
            <div style="display: flex; justify-content: space-between">
                <h3>댓글 작성</h3>
                <button>등록</button>
            </div>
            <textarea></textarea>
        </div>
        <!-- 댓글 작성 끝 -->
        <hr>


    </div>
    <!-- 댓글 끝 -->

    <%--댓글 표시--%>
    <div class="section-reply-list">
        <div class="section-reply-list--top">
            <div><img src="https://blog.kakaocdn.net/dn/mUBTw/btsn6GEWiIK/u5SOAGPvwccu3Qrz3j2RRK/img.jpg" alt="개인이미지">
            </div>
            <div>
                <div class="reply-list--name">이수완</div>
                <div class="reply-list--date">yyyy-mm-dd</div>
                <div class="reply-list--remove--btn">
                    <button>삭제</button>
                    <button>수정</button>
                </div>
            </div>
        </div>
        <div contenteditable="false">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores aut earum
            ipsum
            nihil, optio Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad assumenda at culpa cumque delectus
            ducimus fugit in incidunt, nam nulla odio pariatur placeat quisquam, rem repellendus tenetur ullam voluptas
            voluptatibus!
        </div>
        <hr>
    </div>

    <!-- 페이지네이션 시작 -->
    <div class="pagination">
        1|2|3|4|5
    </div>
    <!-- 페이지네이션 끝 -->
</section>
<!-- 섹션 끝 -->

<%--댓글 표시--%>


<!-- 푸터 -->
<div class="footer"></div>

<script>
  const response = ${post};
  console.log(${post}, "model로 넘겨받은 데이터")
  console.log(replyService);

  $(".main-image").css("background-image", `url(\${response.mainTitleImg})`)
  $(".section-header-main-title").html(response.mainTitle);
  $(".section-header-main-subtitle").html(response?.subTitle || "");
  $(".section-header-info-writer").html(response.member.nickname);
  $(".section-header-info-date").html(response.createDate);
  $("article").html(response.content);
  $(".section-header-icon span").html(response.favorite);
  $(".writer-profile-name").html(response.member.nickname);
  $(".writer-profile-intro").html(response.member.intro);
  $(".writer-profile-pic img").attr("src", response.member.profile || "https://blog.kakaocdn.net/dn/dJIAmM/btsn88UFln2/RaUhk0ofYyEuIl3SK7bhN0/img.jpg")

  // 댓글 리스트 불러오기
  replyService.getAllReply({postId: response.id, page: 1}, (response) => {
    let reply = "";
    for (let i = 0, len = response.length || 0; i < len; i++) {
      console.log(i, "asdasasd")
      reply += "<div class='section-reply-list'><div>"
      reply += `<img src=https://blog.kakaocdn.net/dn/mUBTw/btsn6GEWiIK/u5SOAGPvwccu3Qrz3j2RRK/img.jpg alt="유저 이미지">`
      reply += "</div><div>"
      reply += `<div class='reply-list--name'>\${response[i].member.nickname}</div>`
      reply += `<div class='reply-list--date'>\${response[i].createDate}</div>`
      reply += `<div class='reply-list--remove--btn'>`
      reply += `<button>삭제</button> <button>수정</button>`
      reply += `</div></div>`
      reply += `<div contenteditable = "false" >\${response[i].content} </div>`
      reply += `</div> <hr>`
    }
    $(".section-reply-list").append(reply);
  })

  // 댓글 추가
  $(".section-reply button").click(() => {
    const data = {
      content: $(".section-reply textarea").val(),
      postId : response.id
    }
    replyService.add(data, (response) => {
      $(".section-reply textarea").val("");
    })
  })

  // 댓글 삭제
  $(".section-reply-list button:first-child").click(() => {
    replyService.remove(68, (response) => {
      alert(response.statusCode);
      if (response === "undefined") {
        alert("??")
      }
    })
  })

  // 댓글 수정
  $(".section-reply-list button:last-child").click((e) => {
    console.log($(e.target))
    /*$("div[contenteditable='false']").addClass("edit-mode")
    $("div[contenteditable='false']").prop("contenteditable", "true")*/
    data = {
      content: $(".section-reply textarea").val(),
      postId : response.id
    }
    replyService.modify(data, (response) => {

    })
  })

</script>
</body>
</html>