$(document).ready(function () {
  $("#uploadBtn").on("click", function (e) {
    e.preventDefault(); // Prevent the default form submission behavior

    var formData = new FormData();
    var inputFile = $("input[name='uploadFile']");
    var files = inputFile[0].files;

    for (var i = 0; i < files.length; i++) {
      formData.append("uploadFile", files[i]);
    }

    $.ajax({
      url: "http://localhost:8888/uploadAjax",
      processData: false,
      contentType: false,
      data: formData,
      type: "post",
      success: function (result) {
        alert("Uploaded");
      },
      error: function (xhr, status, error) {
        alert("Error: " + error);
      },
    });
  });
});
