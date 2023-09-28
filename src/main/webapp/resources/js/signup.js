$(() => {
  //DOM트리에서 form객체찾기
  const formObj = $("form.signup");  
 
  //필명 중복확인 버튼 객체 찾기
  const btNameDupchk = $("form.signup button.namedupchk");
  
  //가입버튼 객체 찾기
  const btSignup = $("form.signup.bt-Signup"); 	
  
  //ID 중복확인 버튼 객체
  const btIdDupChk = $("form.signup input.iddupchk");
  
  //프로필 객체
  const profile =  $(".profile");  

  
  //프로필 업로드
   profile.click(() => {    	
 	 $("#img").click();
   });

  $('#img').change((e) => {  
   var selectedFile = e.target.files[0];	

    // 이미지 요소의 src 속성을 선택한 파일의 URL로 설정합니다.
    if (selectedFile) {
        var fileReader = new FileReader();
        fileReader.onload = function (e) {
            $(".profile").attr("src", e.target.result);
        };
        fileReader.readAsDataURL(selectedFile);
    }
   	
  });
  
  //ID 중복확인  
  btIdDupChk.click(() => {  
   	alert("1");
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


  //Nickname중복확인
  btNameDupchk.click(() => {
  
  	//아이디 중복확인 버튼 객체 찾기
	  	const btIdDupChk = $("form.signup input.iddupchk");  	
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

  
  //회원가입
  formObj.submit((e) => {   
  	//1. 프로필 이미지 업로드 
	var formData = new FormData();
  	var inputFile = $("input[name = 'uploadFile']");     
    var files = inputFile[0].files; 
  
  	formData.append("uploadFile", files[0]);
  
  	$.ajax({
	  	url: "/profile",
	  	processData: false,
	  	contentType: false,
	  	data: formData,
	  	type: "post",
	  	success: function(result){	  		
	  	}  	
   	});
   	   	
  	//2. 회원가입  
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
