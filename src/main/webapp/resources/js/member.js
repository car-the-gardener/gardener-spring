 $(document).ready(() => {
	  //header를 넣을 태그 찾기
  const header = $('body>div.header');
  //div.header class속성에 header.html불러오기
  header.load('./header.html');

  //footer를 넣을 태그 찾기
  const footer = $('body>div.footer');
  //div.header class속성에 header.html불러오기
  footer.load('./footer.html');
	 
    // 페이지 로드 시에 사용자 정보 가져오기
    $.ajax({
          url: "http://localhost:8888/back/findmember",
          method: "POST",
          success: (response) => { 
			  console.log(response)
//            const userInfo = JSON.parse(response);
            const userInfo = response;
            
            $("#loginId").val(userInfo.loginid);         
            $("#name").val(userInfo.name);
            $("#email").val(userInfo.email);
            $("#intro").val(userInfo.intro);
            
            const maskedPwd = userInfo.pwd.replace(/./g, "*");
      $("#pwd").val(maskedPwd);
          },
          error: (error) => {
            console.error(
              "Failed to get user info:",
              error
            );
          },
        });


  let clickStatus = 0;


  /*정보수정 시작하기*/
  const btnClick = () => {
    const inputs = document.querySelectorAll("input");

    if (clickStatus === 0) {
      // 정보 수정 가능한 상태로 변경
      for (let input of inputs) {
        if (input.id !== "joinDate") {
          // 가입날 필드는 수정 불가능하도록 처리
          input.removeAttribute("readonly");
        }
      }
      $(".modifybtn.btn").text("정보 완료");

      clickStatus = 1;
    } else if (clickStatus === 1) {
      // 정보 읽기 전용 상태로 변경
      for (let input of inputs) {
        input.setAttribute("readonly", true);
      }
      $(".modifybtn.btn").text("정보 수정");
      clickStatus = 0;
    }
  };

  // 정보 수정 버튼 클릭 시 이벤트 연결
  $(".modifybtn.btn").on("click", btnClick, () => {
    $.ajax({
      url: "http://localhost:8888/back/member",
      method: "POST",
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      success: (response) => {
        // 성공적으로 요청이 처리되었을 때 실행할 콜백 함수
        console.log("Data successfully sent to the server!");
      },
      error: (error) => {
        // 요청이 실패했을 때 실행할 콜백 함수
        console.error("Failed to send data to the server:", error);
      },
    });
  });

  // 초기 상태에서 가입날 필드를 읽기 전용으로 만들기
  $("#joinDate").prop("readonly", true);

  /*정보수정 끝*/
  
  /* 정보 가져오기 */
});
