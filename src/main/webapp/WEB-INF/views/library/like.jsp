<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="/resources/js/like.js" defer></script>
    <link rel="stylesheet" href="/resources/css/like.css">
    <title>찜</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main>
    <ul>
        <li><span>좋아요</span></li>
        <li><span>구독</span></li>
    </ul>

    <section>
        <div class="section-post">
            <div>
                <h4>제목</h4>
                <h5>서브타이틀</h5>
                <h6>이수완</h6>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda aut commodi consectetur
                    consequuntur enim facilis fugiat fugit, nihil officiis unde. Animi commodi enim eum perferendis
                    quaerat reiciendis tenetur vero voluptatum! Lorem ipsum dolor sit amet, consectetur adipisicing
                    elit. Earum id nam vel? Asperiores, distinctio eaque et ex explicabo fuga illo, inventore laborum
                    mollitia quis quisquam repellat repellendus sed, temporibus voluptate.</p>
            </div>
            <div>
                <img src="/resources/images/post/background7.jpg" alt="">
            </div>
        </div>
    </section>
    <hr class="hr">

</main>

<input class="postResponse" type="hidden" value='${post}'>
<script>
  const postResponse = ${post};
  let post = "";
  console.log(postResponse);

  if (postResponse.length === 0) {
    console.log("가져올 글이 없다.");
    // 서버에서 JSP 페이지를 가져와서 section 요소에 삽입
    $.get("/resources/exception-page/favorite-exception.html", data => {
      $("section").html(data);
    });
  }

  for (p of postResponse) {
    post += `<hr>`
    post += `<div class='section-post' data-postnum=\${p.postnum}>`;
    post += `<div><h4>\${p.mainTitle}</h4>`;
    post += `<h5>\${p.subTitle || ""}</h5>`;
    post += `<h6>\${p.member.nickname}</h6>`;
    post += `<p>\${p.content}</p></div>`;
    if (p.mainTitleImg === undefined) {
      post += `<div><img src='/resources/images/post/background7.jpg' alt='메인이미지'/></div></div>`;
    } else {
      post += `<div><img src='\${p.mainTitleImg}' alt='메인이미지'/></div></div>`;
    }
  }
  $("section").html(post);


</script>

</body>
</html>
