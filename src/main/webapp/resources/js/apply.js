$(document).ready(() => {
  const data = { loginid: $("#loginid").val() };

  // 작가 신청 제출하기
  $("#applybtn").on("click", function () {
    $.ajax({
      url: "/apply",
      type: "POST",
      data: data,
      success: (response) => {
        if (response === "true") {
          console.log("작가 정보 등록 성공");
          alert("제출되었습니다");
          window.location.href = "/";
        } else {
          console.log("작가 정보 등록 실패");
          alert("제출에 실패하였습니다");
        }
      },
      error: function (error) {
        alert(error);
        console.log("Failed to send data to the server:" + error);
        alert("제출에 실패하였습니다");
      },
    });
  });
});
