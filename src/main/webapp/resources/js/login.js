$(() => {
  const url = "http://localhost:8888";  
  const formObj = $("form.login");

  //아이디저장 체크박스
  const cbObj = formObj.find("input[type=checkbox]");
  const savedId = localStorage.getItem("savedId");
  if (savedId != null) {
    formObj.find("input[name-loginId]").val(savedId);
  }

  formObj.submit((e) => {
    if (cbObj.prop("chekced")) {
      //체크된 경우
      const idValue = formObj.find("input[name=id]").val();
      localStorage.setItem("savedId", idValue);
    } else {
      //체크 해제된 경우
      localStorage.removeItem("savedId");
    }
    
    const data = $(e.target).serialize();
    $.ajax({
      url: "/login",
      method: "post",
      data: data,
      success: (responseData) => {
		  console.log(responseData, "dd")
        if (responseData.trim() == 0) {
          //로그인 실패인 경우
          swal("로그인실패");
          $("form.login>input[name=id]").focus();
        } else if (responseData.trim() == 1) {
          //로그인 성공인 경우
          swal("환영합니다");
          sessionStorage.setItem("name", responseData);
          location.href = `/`; //페이지 이동
        }
      },
      error: (xhr) => {
        alert("에러~~:" + xhr.status);
      },
    });
    return false;
  });
});
