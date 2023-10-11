<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link rel="stylesheet" href="/resources/css/writer.css">
  <script src="/resources/js/writer.js" defer></script>
</head>
<body>
<main>
  <section>
    <header>
      <div class="section-writer-wrapper">
        <img src="/resources/images/post/background7.jpg" alt="">
        <div>
          <p>필명</p>
          <p>이메일</p>
          <p>작가소개</p>
        </div>
      </div>

      <div class="section-subscribe-wrapper"></div>
    </header>

    <article></article>
  </section>
  <hr class="hr">

</main>

<script>
  const writer = ${writer};
  const subscribe = '${subscribe}';
  console.log(writer, " writer ");
  let sub = "";
  let writerPost = "";

  $(".section-writer-wrapper img").attr("src", `\${writer[0].member.profile}` === "undefined" ? `/resources/images/post/background3.jpg` : `\${writer[0].member.profile}`);
  $(".section-writer-wrapper p:eq(0)").text(`\${writer[0].member.nickname}`)
  $(".section-writer-wrapper p:eq(1)").text(`\${writer[0].member.email}`)
  $(".section-writer-wrapper p:eq(2)").text(`\${writer[0].member.intro}`)

  {
    if (subscribe !== "") {
      for (s of JSON.parse(subscribe)) {
        sub += `<div><img src="\${s.profile || '/resources/images/post/background1.jpg'}" alt='작가이미지'>`;
        sub += `<p>\${s.nickname}</p></div>`;
      }
      $(".section-subscribe-wrapper").html(sub);
    }
  }

  {
    for (w of writer) {
      console.log(w.postnum, "으헤헤");
      console.log(typeof w.postnum, "으헤헤");
      if (w.postnum) {
        writerPost += `<hr><div class='section-post' data-postnum='\${w.postnum}'>`;
        writerPost += `<div><h4>\${w.mainTitle}</h4><h5>\${w.subTitle || ""}</h5><h6>\${w.member.nickname}</h6>`;
        writerPost += `<p>\${w.content}</p></div>`;
        writerPost += `<div><img src='\${w.mainTitleImg || "/resources/images/post/background9.png"}' alt='게시글이미지'></div>`;
        writerPost += `</div>`;
        $("article").html(writerPost);
      } else {
        $(".hr").css("display", "none");
        $.get("/resources/exception-page/subscribe-exception.html", (response) => {
          $("article").html(response);
        })
      }
    }
  }


</script>
</body>
</html>
