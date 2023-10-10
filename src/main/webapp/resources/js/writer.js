const url = window.location.href;
const urlLastIndex = url.lastIndexOf("/");
const writerId = url.slice(urlLastIndex + 1)

let target = $(".hr")[0]
let num = 2;

$(".section-post").on("click", "div", (e) => {
  const postnum = $(e.currentTarget).parent().data("postnum");
  location.href = `/post/${postnum}`;
})

const option = {
  root      : null,
  rootMargin: "0px",
  threshold : 0.5
}

const observer = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      $.ajax({
        url    : `/library/writer/${writerId}/${num}`,
        success: (response) => {
          console.log(response)
          let writerPost = "";
          num++;
          for (w of JSON.parse(response[0])) {
            writerPost += `<hr><div class='section-post' data-postnum='${w.postnum}'>`;
            writerPost += `<div><h4>${w.mainTitle}</h4><h5>${w.subTitle || ""}</h5><h6>${w.member.nickname}</h6>`;
            writerPost += `<p>${w.content}</p></div>`;
            writerPost += `<div><img src='${w.mainTitleImg || ""}' alt='게시글이미지'></div>`;
            writerPost += `</div>`;
          }
          $("article").append(writerPost);
        },
        error  : (xhr, status) => {
          console.log(xhr, "xhr")
          console.log(status, "status")
        },
      })
    }
  })
}, option);
observer.observe(target);
