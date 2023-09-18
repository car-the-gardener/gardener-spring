$(() => {
	  //header
  const header = $("body>div.header");
  header.load("../html/header.html");

  //footer
  const footer = $("body>div.footer");
  footer.load("../html/footer.html");

	
  //DOM트리에서 form객체찾기
  const formObj = $("form.signup");

  //아이디 입력란 객체 찾기
  const inputIdObj = $("form.signup>input[name=loginId]");

  //아이디 중복확인 버튼 객체 찾기
  const btIdDupChk = $("form.signup button.iddupchk");

  //이메일 입력란 객체 찾기
  const inputEmailObj = $("form.signup>input[name=email]");

  //필명 입력란 객체 찾기
  const inputNameObj = $("form.signup>input[name=name]");

  //필명 중복확인 버튼 객체 찾기
  const btNameDupchk = $("form.signup button.namedupchk");

  //가입버튼 객체 찾기
  const btSignup = $("form.signup.bt-Signup");


	// 세션 없애기
	$.ajax({
		url:"/back/signup",
		success:()=>{
			
		}
	})


  btIdDupChk.click(() => {
    const loginId = $("input[name='loginId']").val();
    $.ajax({
      url: "/back/iddupchk",
      methoed: "get",
      data: `idcheck=${loginId}`,
      success: (responseData) => {
        console.log(responseData);
        if (responseData === "1") {
          swal("사용 가능한 아이디 입니다");
        } else {
          swal("중복된 아이디 입니다, 다른 아이디를 입력해주세요");
        }
      },
    });
  });

  btNameDupchk.click(() => {
    const name = $("input[name='name']").val();
    $.ajax({
      url: "/back/namechk",
      methoed: "get",
      data: `namecheck=${name}`,
      success: (responseData) => {
        console.log(responseData);
        if (responseData === "1") {
          swal("사용 가능한 필명 입니다");
        } else {
          swal("중복된 필명 입니다, 다른 필명을 입력해주세요");
        }
      },
    });
  });

  formObj.submit((e) => {
	  if($("form input").val() === "null" && $("form input").val() === ""){
		  alert("이런")
	  }
	  
    $(e.target)
      .attr("action", "/back/signup")
      .attr("method", "post");
    $.ajax({
      url: formObj.attr("action"),
      method: formObj.attr("method"),
      data: formObj.serialize(),
      success: (responseObj) => {
        console.log(responseObj);
        if (responseObj === "1") {
          //가입 성공인경우
          alert("회원가입이 되었습니다");
          location.href = "./login.html"; //페이지 이동
        } else {
          //가입 실패인경우
          alert("빈칸을 채워주세요");
        }
      },
      error: (xhr) => {
        alert("에러:" + xhr.status);
      },
    });
    return false;
  });
});
