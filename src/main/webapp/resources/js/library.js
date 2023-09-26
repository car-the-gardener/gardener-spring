/*if ($(".nickname").val() === "") {
  alert("로그인 먼저 해주세요")
  location.href = "/";
}*/
$.ajax({
  url    : "/library",
  success: (response) => {

  },
  error  : (xhr, status) => {
    console.log(xhr)
  }
})