$(document).ready(function () {
  const cancelWriterButton = $(".cancelbtn");

  cancelWriterButton.on("click", function () {
    const confirmation = confirm("작가를 취소하시겠습니까?");

    if (confirmation) {
      const url = "http://localhost:8888/mypage";
      const userId = "rudsn10"; // 사용자 ID

      // 작가 취소를 서버로 보내기 위한 AJAX 요청
      $.ajax({
        type: "POST",
        url: url,
        data: { userId: userId }, // 사용자 ID를 데이터로 전송
        success: function (data, textStatus, xhr) {
          if (xhr.status === 200) {
            alert("작가가 취소되었습니다.");
          } else {
            alert("작가 취소를 실패했습니다.");
          }
        },
        error: function (xhr, textStatus, errorThrown) {
          console.error("Error:", errorThrown);
          alert("작가 취소를 실패했습니다.");
        }
      });
    }
  });
});
