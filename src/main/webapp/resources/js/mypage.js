$(document).ready(() => {
  let clickStatus = 0;

  alert("마이페이지로 이동");
  /* mypage 사용자 정보 가져오기 */
  $.ajax({
    url     : "http://localhost:8888/mypage",
    method  : "get",
    dataType: "JSON",
    success : (response) => {
      console.log(response);
      const userInfo = response;

      $("#loginid").val(userInfo.loginid);
      $("#pwd").val(userInfo.pwd);
      $("#nickname").val(userInfo.nickname);
      $("#email").val(userInfo.email);
      $("#createDate").val(userInfo.createDate);
      $("#intro").val(userInfo.intro);
    },
    error   : (error) => {
      console.log("Failed to get user info:", error);
    }
  });

  /*정보수정 시작하기*/
  $(".modifybtn.btn").on("click", function () {
    const inputs = $("input");

    if (clickStatus === 0) {
      inputs.each(function () {
        if (this.id !== "createDate" && this.id !== "loginid") {
          $(this).removeAttr("readonly");
        }
      });
      $(".modifybtn.btn").text("정보 완료");

      alert("정보수정 시작");
      clickStatus = 1;
    } else if (clickStatus === 1) {
      inputs.each(function () {
        $(this).prop("readonly", true);
      });
      $(".modifybtn.btn").text("정보 수정");
      clickStatus = 0;

      alert("정보가 수정되었습니다");

      const data = {};
      $("input").each(function () {
        data[this.id] = $(this).val();
      });

      $.ajax({
        url    : "/mypage/update",
        method : "POST",
        data   : data,
        success: function (response) {
          console.log("Data successfully sent to the server!");
        },
        error  : function (error) {
          console.log("Failed to send data to the server:", error);
        }
      });
    }
  });

  $("#joinDate").prop("readonly", true);


});
