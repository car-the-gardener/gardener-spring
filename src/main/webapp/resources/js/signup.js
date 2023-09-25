$(() => {
	
  //DOM트리에서 form객체찾기
  const formObj = $("form.signup");

  //아이디 입력란 객체 찾기
  const inputIdObj = $("form.signup>input[name=loginId]");

  //아이디 중복확인 버튼 객체 찾기
  const btIdDupChk = $("form.signup input.iddupchk");

  //이메일 입력란 객체 찾기
  const inputEmailObj = $("form.signup>input[name=email]");

  //필명 입력란 객체 찾기
  const inputNameObj = $("form.signup>input[name=name]");

  //필명 중복확인 버튼 객체 찾기
  const btNameDupchk = $("form.signup button.namedupchk");

  //가입버튼 객체 찾기
  const btSignup = $("form.signup.bt-Signup");

	
  btIdDupChk.click(() => {  //ID 중복확인  
    const loginid = $("input[name='loginid']").val();
  	const iddupchk = $("input[name='iddupchk']").val();
    $.ajax({
      url: "/id_chk",
      method: "get",
      data: "loginid=" + loginid , //`idcheck=${loginId}`
      success: (response) => {
        console.log(response);
        if (!response) {
          swal("사용 가능한 아이디 입니다");        
        } else {
          swal("중복된 아이디 입니다, 다른 아이디를 입력해주세요");
        }
      },
    });
  });

  btNameDupchk.click(() => {	//Nickname중복확인
    const name = $("input[name='name']").val();
    $.ajax({
      url: "/name_chk",
      methoed: "get",
      data: "nickname=" + name, //"namecheck=${name}",
      success: (response) => {
        console.log(response);
        if (!response) {
          swal("사용 가능한 필명 입니다");
        } else {
          swal("중복된 필명 입니다, 다른 필명을 입력해주세요");
        }
      },
    });
  });

  formObj.submit((e) => {    		  
 	const data = $(e.target).serialize();
 	console.log(data, "ㅇㅅㅇ ");
    $.ajax({
      url: "/signup",
      method: "post",
      data: data,
      success: (data) => {      	    
          alert("회원가입이 되었습니다");
          location.href = "./login"; //페이지 이동
      },
      error: (xhr) => {
        alert("회원가입 실패했습니다");
      },
    });
    return false;
  });
});
