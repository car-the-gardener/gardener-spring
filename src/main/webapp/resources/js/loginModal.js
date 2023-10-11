$(() => {
  $('li.nav-item.ms-5 a.nav-link[href="/login"]').click(function (e) {
    e.preventDefault();
    $('#myModal').modal('show');
  });

  $("#closebtn").on("click", () => {
    location.href = "/"; // Move to another page
  });

  const url = "http://localhost:8888";
  const formObj = $("form.login");

  // Define the event handler for the form submission
  formObj.on("submit", function (e) {
    e.preventDefault(); // Prevent the default form submission

    // Serialize the form data
    const data = formObj.serialize();

    // Send an AJAX request
    $.ajax({
      url: url, // You should specify the correct URL for your request
      method: "POST", // Use the appropriate HTTP method
      data: data,
      success: (response) => {
        console.log(response, "response");
        if (response.trim() == 1) {
          // If login is successful
          swal("Welcome");
          location.href = "/"; // Move to another page
        } else if (response.trim() == 0) {
          // In case of login failure
          $("form.login>input[name=id]").focus();
        }
      },
      error: (xhr) => {
        swal("Incorrect information. Please enter again.");
      },
    });
  });
});
