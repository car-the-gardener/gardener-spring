$(document).ready(() => {
  let clickStatus = 0;
  
  alert("마이페이지로 이동");
  /* mypage 사용자 정보 가져오기 */
  $.ajax({
    url: "http://localhost:8888/mypage",
    method: "get",
    dataType: "JSON",
    success: (response) => {
      console.log(response);
      const userInfo = response;

      $("#loginid").val(userInfo.loginid);
      $("#pwd").val(userInfo.pwd);
      $("#nickname").val(userInfo.nickname);
      $("#email").val(userInfo.email);
      $("#createDate").val(userInfo.createDate);
      $("#intro").val(userInfo.intro);
    },
    error: (error) => {
      console.log("Failed to get user info:", error);
    }
  });

  /*정보수정 시작하기*/
  $(".modifybtn.btn").on("click", function () {
    const inputs = $("input");

    if (clickStatus === 0) {
      /* 정보 수정 가능한 상태로 변경*/
      inputs.each(function () {
        if (this.id !== "createDate") {
          $(this).removeAttr("readonly");
        }
      });
      $(".modifybtn.btn").text("정보 완료");

      alert("정보수정 시작");
      clickStatus = 1;
    } else if (clickStatus === 1) {
      // 정보 읽기 전용 상태로 변경
      inputs.each(function () {
        $(this).prop("readonly", true);
      });
      $(".modifybtn.btn").text("정보 수정");
      clickStatus = 0;

      // 정보 수정 완료 알림
      alert("정보가 수정되었습니다");

      // 데이터를 JSON 형식으로 수집
      const data = {};
      $("input").each(function () {
        data[this.id] = $(this).val();
      });
       
      // 서버로 데이터 전송
      $.ajax({
        url: "/mypage/update",
        method: "POST",
        data: data,
        success: function (response) {
          // 성공적으로 요청이 처리되었을 때 실행할 콜백 함수
          console.log("Data successfully sent to the server!");
        },
        error: function (error) {
          // 요청이 실패했을 때 실행할 콜백 함수
          console.log("Failed to send data to the server:", error);
        }
      });
    }
  });

  // 초기 상태에서 가입날 필드를 읽기 전용으로 만들기
  $("#joinDate").prop("readonly", true);
});
