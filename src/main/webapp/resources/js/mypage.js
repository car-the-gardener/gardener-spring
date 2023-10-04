$(document).ready(() => {
  let clickStatus = 0;
  
  const profile =  $(".profile");  
  

  alert("마이페이지로 이동");
  /* mypage 사용자 정보 가져오기 */
  function getUserInfo() {
    $.ajax({
      url: "/mypage",
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
      error: (xhr, status, error) => {
        console.log(
          "Failed to get user info. Status:",
          status,
          "Error:",
          error
        );
      },
    });
  }
  getUserInfo();

  /*정보수정 시작하기*/
  $(".modifybtn.btn").on("click", function () {
    const inputs = $("input");
    const textareas = $("textarea");

    if (clickStatus === 0) {
      inputs.each(function () {
        if (this.id !== "createDate" && this.id !== "loginid") {
          $(this).removeAttr("readonly");
        }
      });
       textareas.each(function () {
      $(this).removeAttr("readonly");
    });
      $(".modifybtn.btn").text("정보 완료");

      alert("정보수정 시작");
      clickStatus = 1;
    } else if (clickStatus === 1) {
      inputs.each(function () {
        $(this).prop("readonly", true);
      });
      textareas.each(function () {
      $(this).prop("readonly", true);
      });
    
      $(".modifybtn.btn").text("정보 수정");
      clickStatus = 0;

      alert("정보가 수정되었습니다");

      const data = {};
      $("input").each(function () {
        data[this.id] = $(this).val();
      });
      $("textarea").each(function () {      
       data[this.id] = $(this).val();
      });

      $.ajax({
        url: "/mypage/update",
        method: "POST",
        data: data,
        success: function (response) {
          console.log("Data successfully sent to the server!");
          getUserInfo();
        },
        error: function (error) {
          console.log("Failed to send data to the server:", error);
        }
      });
    }
  });

  $("#joinDate").prop("readonly", true);
  
  //프로필 업로드
   profile.click(() => {       
     $("#img").click();
   });

  $('#img').change((e) => {  
   var selectedFile = e.target.files[0];   

    // 이미지 요소의 src 속성을 선택한 파일의 URL로 설정
    if (selectedFile) {
        var fileReader = new FileReader();
        fileReader.onload = function (e) {
            $(".profile").attr("src", e.target.result);
        };
        fileReader.readAsDataURL(selectedFile);
        }      
  });
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
  
  
});
