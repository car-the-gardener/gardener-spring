<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <title>Document</title>
  </head>

  <body>
    <div id="root">
    </div>

    <script>

      $.ajax({
        url: "http://localhost:8888/back/posts",
        success: (response) => {
          const root = $("#root");
          for (let i = 0; i < response.length; i++) {
            root.append(`<div class="title" data-id=${response[i].id} style="width: 300px;height: 100px; border: 1px solid;">${response[i].mainTitle}</div>`)
          }
        }
      })

      $(document).on("click", ".title", (e) => {
        const num = $(e.target)[0].dataset.id;
        sessionStorage.setItem("num", num);
        $.ajax({
          url: "http://localhost:8888/back/post",
          data: `num=${num}`,
          success: (response) => {
            location.href = "./post.html";
          }
        })
      })

    </script>
  </body>

  </html>