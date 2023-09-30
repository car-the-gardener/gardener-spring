let num = 2;
let target = $(".hr")[0];
let postResponse = JSON.parse($(".postResponse").val());

if ($(".nickname").val() === "") {
  alert("로그인 먼저 해주세요")
  location.href = "/";
}

const printFavorite = () => {
  let post = "";
  for (p of postResponse) {
    post += `<hr>`
    post += `<div class='section-post' data-postnum=${p.postnum}>`;
    post += `<div><h4>${p.mainTitle}</h4>`;
    post += `<h5>${p.subTitle || ""}</h5>`;
    post += `<h6>${p.member.nickname}</h6>`;
    post += `<p>${p.content}</p></div>`;
    if (p.mainTitleImg === undefined) {
      post += `<div><img src='/resources/images/post/background7.jpg' alt='메인이미지'/></div></div>`;
    } else {
      post += `<div><img src='${p.mainTitleImg}' alt='메인이미지'/></div></div>`;
    }
  }
  return post;
}

const firstRequest = (() => {
  if (postResponse.length === 0) {
    console.log("가져올 글이 없습니다.");
    $.get("/resources/exception-page/favorite-exception.html", (response) => {
      $("section").html(response);
    });
  }

  $("section").html(printFavorite());
})()

// 뫈스크롤

const option = {
  root      : null,
  rootMargin: "0px",
  threshold : 0.5
}

const observer = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      $.ajax({
        url    : `/library/favorite/${num}`,
        success: (response) => {
          num += 1;
          postResponse = response;
          $("section").append(printFavorite());
          showFavorite();
        },
        error  : (xhr, status) => {
          console.log(status);
        }
      })
    }
  })
}, option);
observer.observe(target);


// 좋아요 버튼
$(".favorite").click(() => {
  $(".hr").css("display", "block");
  if (num !== 1) {
    num = 1;
  }
  $("section").html(printFavorite());
  showFavorite();
})


// 좋아요글 보기
const showFavorite = () => {
  $(".section-post > div").click((e) => {
    const postnum = $(e.target).parent().parent().data("postnum");
    location.href = `/post/${postnum}`;
  })
}
showFavorite();

// 구독 버튼
$(".subscribe").click(() => {
  // 바로 지우지 않으면, $("section").html(response); 이게 채워지는데 hr이 화면에 보이게 되므로 관찰 대상이되어 요청을 해버리게 된다.
  $(".hr").css("display", "none");
  $.get("/library/subscribe", (response) => {
    $("section").html(response);
  })
})