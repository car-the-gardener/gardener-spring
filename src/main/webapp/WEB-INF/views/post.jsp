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

    <!-- 댓글 쓰기 -->
    <div class="section-reply">
        <div>
            <div>
                <p>24개</p>
                <p>(x/200)</p>
            </div>
            <textarea></textarea>
            <button>댓글작성</button>
        </div>
        <hr>
    </div>

    <%--댓글 표시--%>
    <div class="section-reply-list"></div>

    <!-- 페이지네이션 시작 -->
    <div class="pagination-wrap"></div>

</section>
<!-- 섹션 끝 -->

<!-- 푸터 -->
<div class="footer"></div>

<script>
  const postResponse = ${post};
  let pageNum = 1;

  $(".main-image").css("background-image", `url(\${postResponse.mainTitleImg})`)
  $(".section-header-main-title").html(postResponse.mainTitle);
  $(".section-header-main-subtitle").html(postResponse?.subTitle || "");
  $(".section-header-info-writer").html(postResponse.member.nickname);
  $(".section-header-info-date").html(postResponse.createDate);
  $("article").html(postResponse.content);
  $(".section-header-icon span").html(postResponse.favorite);
  $(".writer-profile-name").html(postResponse.member.nickname);
  $(".writer-profile-intro").html(postResponse.member.intro);
  $(".writer-profile-pic img").attr("src", postResponse.member.profile || "https://blog.kakaocdn.net/dn/dJIAmM/btsn88UFln2/RaUhk0ofYyEuIl3SK7bhN0/img.jpg")

  // 댓글 리스트 불러오기
  const showList = (page) => {
    replyService.getAllReply({postId: postResponse.id, page: page || 1}, (response) => {
      $(".section-reply p:first-child").text(`\${response.replyCnt}개`);
      let reply = "";


      // 새로운 댓글 달았을때 뒤로 페이지 이동
      if (page === -1) {
        pageNum = Math.ceil(response.replyCnt / 5.0); // 이건 10개씩 보여주기로 한 기준이라 10으로 나눈건가?? 난 5로 보여줘야하는데 5로 바꿀까?
        console.log(pageNum, "새로 추가시 pageNum")
        showList(pageNum);
        return;
      }

      if (response.list.length === 0 || response.list === null) {
        return;
      }

      for (let i = 0, len = response.list.length || 0; i < len; i++) {
        let dateTime = replyService.displyTime(response.list[i].createDate);
        reply += `<div class='section-reply-list--top'>`
        reply += `<div><img src="https://blog.kakaocdn.net/dn/dJIAmM/btsn88UFln2/RaUhk0ofYyEuIl3SK7bhN0/img.jpg" alt="유저 이미지">`
        reply += `<div><p class='reply-list--name'>\${response.list[i].member.nickname}</p>`
        reply += `<p class='reply-list--date'><small>\${dateTime}</small></p></div></div>`
        reply += `<div class='reply-list--btn'><button class="reply-list--btn--remove" data-id=\${response.list[i].id}>삭제</button> <button class="reply-list--btn--modify" data-id=\${response.list[i].id}>수정</button></div>`
        reply += `</div>`
        reply += `<div contenteditable = "false" data-id=\${response.list[i].id}>\${response.list[i].content} </div>`
        reply += `</div> <hr>`
      }
      $(".section-reply-list").html(reply);
      pagination(response.replyCnt);
    })
  }
  showList(pageNum);

  // pagination
  const pagination = (replyCnt) => {
    let pn = `<ul class='pagination'>`;
    let endPage = Math.ceil(pageNum / 5.0) * 5; // 기본 페이지는 10개씩, 댓글은 5개씩 보여줄 것
    let startPage = endPage - 4; // 기본 1
    let prev = startPage != 1; // 첫 번째 페이지(1) 이상이면 prev가 존재하게 (2 페이지부터 존재)
    let next = false;

    // 음 .. 10을 왜 곱해주지??
    if (endPage * 5 >= replyCnt) {
      endPage = Math.ceil(replyCnt / 5.0);
    }

    // next 버튼이 생겨야 됨
    if (endPage * 5 < replyCnt) {
      next = true;
    }

    // 이전 버튼
    if (prev) {
      pn += `<li class='page-item'><a class='page-link' href=\${startPage -1}>Prev</a></li>`
    }

    // pagination 그리기
    for (let i = startPage; i <= endPage; i++) {
      let active = pageNum === i ? "active" : "";
      pn += `<li class='page-item \${active}'><a class='page-link' href=\${i}>\${i}</a></li>`;
    }

    if (next) {
      pn += `<li class='page-item'><a class='page-link' href=\${endPage +1}>Next</a></li>`
    }

    pn += `</ul>`;
    $(".pagination-wrap").html(pn);
  }

  // 댓글 페이지 이동
  $(".pagination-wrap").on("click", "li", (e) => {
    e.preventDefault();
    const aTag = $(e.currentTarget).find("a");
    const targetNum = aTag.attr("href");

    pageNum = Number(targetNum);
    showList(pageNum);
  })

  // 댓글 추가
  $(".section-reply button").click(() => {
    const data = {
      content: $(".section-reply textarea").val(),
      postId : postResponse.id
    }

    if (data.content === "") {
      swal("댓글을 입력해주세요")
      return;
    }

    replyService.add(data, (response) => {
      $(".section-reply textarea").val("");
      showList(-1);
    });
  })

  // 댓글 삭제
  $(".section-reply-list").on("click", ".reply-list--btn--remove", (e) => {
    replyService.remove($(e.currentTarget).data("id"), (response) => {
      showList(pageNum);
    })
  })

  // 댓글 수정
  $(".section-reply-list").on("click", ".reply-list--btn--modify", (e) => {
    const replyId = $(e.currentTarget).data("id");
    const replyDiv = $(`div[data-id="\${replyId}"]`);

    if ($(e.currentTarget).text() === "수정") {
      replyDiv.addClass("edit-mode");
      replyDiv.prop("contenteditable", "true");
      replyDiv.focus();
      $(e.currentTarget).text("변경");
      return;
    }

    if (($(e.currentTarget).text() === "변경")) {
      const reply = {
        content: replyDiv.html(),
        id     : replyId
      };

      replyService.modify(reply, (response) => {
        replyDiv.removeClass("edit-mode");
        replyDiv.prop("contenteditable", "false");
        replyDiv.html();
        $(e.currentTarget).text("수정");

        showList(pageNum)
      })
    }
  })

</script>
</body>
</html>