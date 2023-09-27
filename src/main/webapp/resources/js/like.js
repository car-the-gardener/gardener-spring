/*if ($(".nickname").val() === "") {
  alert("로그인 먼저 해주세요")
  location.href = "/";
}*/
$(".section-post").click((e) => {
  const postnum = $(e.target).parent().parent().data("postnum");
  location.href = `/post/${postnum}`;
})