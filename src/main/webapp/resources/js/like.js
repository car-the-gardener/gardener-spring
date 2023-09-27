/*if ($(".nickname").val() === "") {
  alert("로그인 먼저 해주세요")
  location.href = "/";
}*/
let num = 2;
$(".section-post").click((e) => {
  const postnum = $(e.target).parent().parent().data("postnum");
  location.href = `/post/${postnum}`;
})
// 뫈스크롤
let target = $(".hr").last()[0];
const option = {
  root      : null,
  rootMargin: "0px",
  threshold : 0.5
}
const observer = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      $.ajax({
        url    : `/library/like/${num}`,
        success: (resonse) => {
          console.log(resonse, " 제발요 ")
          let post = "";
          for (p of resonse) {
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
          $("section").append(post);
          num += 1;
        },
        error  : (xhr, status) => {
          console.log(status);
        }
      })
    }
  })
}, option);
observer.observe(target);
