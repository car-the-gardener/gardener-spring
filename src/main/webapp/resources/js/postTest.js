// html태그가 있어 꺽쇠때문에 ajax로 요청한다.
const findPost = (() => {
  //게시글 번호 조회 ?
  const searchParams = location.pathname.substring(location.pathname.lastIndexOf("/") + 1);
  const response = () => {
    $.ajax({
      url    : `/post/${searchParams}`,
      method : "get",
      success: (response) => {
      },
      error  : (status) => {
        alert(status)
      }
    })
  }
  return {response}
})()
