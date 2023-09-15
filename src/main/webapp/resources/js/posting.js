$(() => {

  let imgs = [];

  // 클릭시 라디오버튼 체크 시작
  $("div.category li").click((e) => {
    e.stopPropagation();
    const radioButton = $(e.currentTarget).find("input[type='radio']");
    radioButton.prop("checked", true);
  });
  // 클릭시 라디오버튼 체크 끝

  // 본문 메인 이미지 선택 시작
  const imgBtn = $("input[name='image']");
  imgBtn.change((e) => {
    const reader = new FileReader();
    const file = e.target.files[0];
    console.log(file);

    reader.readAsDataURL(file);
    reader.onload = () => {
      let formData = new FormData();
      formData.append("image", file);
      $.ajax({
        url        : "https://api.imgur.com/3/image",
        method     : "POST",
        contentType: false,
        processData: false,
        data       : formData,
        headers    : {
          Authorization: "Bearer 40d90d890e71afc566ae5ce0d4379ac17fda5182",
          Accept       : "application/json",
        },
        success    : (response) => {
          $(".main-image").css(
              "background-image",
              `url(${response.data.link})`
          );
        },
      });
    };
  });
  // 본문 메인 이미지 선택 끝

  // 본문에서 이미지 선택 시작
  const editor = new toastui.Editor({
    el             : document.querySelector("#editor"),
    height         : "600px",
    initialEditType: "markdown",
    initialValue   : "내용을 입력해 주세요.",
    previewStyle   : "vertical",
    hooks          : {
      addImageBlobHook: (blob, cb) => {
        console.log(imgs.length);
        if (imgs.length > 2) {
          swal("사진은 5장 까지만 가능합니다.", "", "error");
          return;
        }

        let formData = new FormData();
        formData.append("image", blob);
        console.log(formData);
        $.ajax({
          url        : "https://api.imgur.com/3/image",
          method     : "POST",
          processData: false,
          contentType: false,
          headers    : {
            Authorization: "Bearer 40d90d890e71afc566ae5ce0d4379ac17fda5182",
            Accept       : "application/json",
          },
          data       : formData,
          success    : (response) => {
            imgs.push(response?.data?.link);
            console.log(response);
            cb(response.data.link);
          },
          error      : (status) => {
            console.log(status);
          },
        });
      },
    },
  });
  // 본문에서 이미지 선택 끝

  $("div.post-btn > button:nth-child(2)").click(() => {
    const title = $("input[name='title']").val();
    const subTitle = $("input[name='subtitle']").val();
    const content = editor.getMarkdown();
    const mainImage = $(".main-image").css("background-image");
    const mainImgUrl = mainImage.slice(
        mainImage.indexOf('"') + 1,
        mainImage.lastIndexOf('"')
    );
    let secret = $("#secret:checked").val();
    const cate = $("input[name='cate']:checked").val();

    if (typeof secret === "undefined") {
      secret = 0;
    }

    if (typeof cate === "undefined") {
      swal("카테고리를 하나 선택해 주세요");
      return;
    }

    const data = {
      title   : title,
      subtitle: subTitle,
      content : content,
      mainImg : mainImgUrl,
      imgs    : imgs,
      secret  : secret,
      cate    : cate,
    };
    if ($(".post-btn > button:nth-child(2)").text() === "글쓰기") {
      submitBtn("post", data);
    }
  });

  $("#st").click((e) => {
    location.href = "../html/posts.html";
  });

  // 수정 시작,. 끝나면 꼭 세션 삭제
  const update = JSON.parse(sessionStorage.getItem("article"));

  if (update !== null) {
    $(".post-btn > button:nth-child(2)").text("수정");
    $(".section-header-title > input").val(update.mainTitle);
    $(".section-header-title > .section-header-subtitle > input").val(
        update.subTitle
    );
    $(".ProseMirror div").html(update.content);

    $(".post-btn > button:nth-child(2)").click((e) => {
      const title = $("input[name='title']").val();
      const subTitle = $("input[name='subtitle']").val();
      const content = editor.getMarkdown();
      const mainImage = $(".main-image").css("background-image");
      const mainImgUrl = mainImage.slice(
          mainImage.indexOf('"') + 1,
          mainImage.lastIndexOf('"')
      );
      let secret = $("#secret:checked").val();
      const cate = $("input[name='cate']:checked").val();

      if (typeof secret === "undefined") {
        secret = 0;
      }

      if (typeof cate === "undefined") {
        swal("카테고리를 하나 선택해 주세요");
        return;
      }

      const data = {
        title   : title,
        subtitle: subTitle,
        content : content,
        mainImg : mainImgUrl,
        imgs    : imgs,
        secret  : secret,
        cate    : cate,
        num     : sessionStorage.getItem("num"),
      };
      submitBtn("updatepost", data);
    });
  }
  // 수정 끝
});

// ajax 메소드를 만들고, then으로 후속처리 할 수 있을듯

const submitBtn = (url, data) => {
  $.ajax({
    url    : `/back/${url}`,
    method : "POST",
    data   : data,
    success: (response) => {
      console.log(response);
      sessionStorage.setItem("num", response);
      sessionStorage.removeItem("article");
      location.href = "../html/post.html"
    },
    errer  : (err) => {
      console.log(err);
    },
  });
};