$(() => {

  const editor = new toastui.Editor({
    el             : document.querySelector('#editor'), // 에디터를 적용할 요소 (컨테이너)
    height         : '600px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
    initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
    initialValue   : '',                       // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
    previewStyle   : 'vertical',               // 마크다운 프리뷰 스타일 (tab || vertical)
    /* start of hooks */
    hooks: {
      addImageBlobHook(blob, callback) {  // 이미지 업로드 로직 커스텀
        console.log(blob, "blob")
        try {
          const formData = new FormData();
          formData.append("image", blob);
          for (let a of formData.keys()) {
            console.log(a, "formData")
          }
          for (let a of formData.values()) {
            console.log(a, "formData")
            console.log(typeof a, "formData typoe")
          }
          // 2. FileApiController - uploadEditorImage 메소드 호출
          $.ajax({
            url        : "/posting",
            method     : "POST",
            processData: false,
            contentType: false,
            data       : formData,
            success    : (response) => {
              const filename = response;
              console.log("서버에 저장될 filename: ", `content\\${filename}`);
              const imageUrl = `/image-print?filename=${filename}&sort=content`;
              callback(imageUrl, "image alt attribute");
            }
          })

        } catch (error) {
          console.error("업로드 실패: ", error)
        }
      }
    }
    /* end of hooks */
  });

// 카테고리 선택
  $(".category li").click(e => {
    const radioBtn = $(e.currentTarget).find("input[type='radio']");
    radioBtn.prop("checked", true);
  });


// 메인 이미지에서 이미지만 올리게끔
  const checkExtention = (fileName, fileSize) => {
    const regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt)$");
    const maxSize = 1024 * 1024 * 5; // 5mb

    if (fileSize > maxSize) {
      alert("너무 크다. 5mb 이하로");
      return false;
    }

    if (regex.test(fileName)) {
      alert("해당 파일은 업로드 안됨, 이지만 부탁");
      return false;
    }
    return true;
  }

// 메인 이미지 저장
  $(".img-pic input").change((e) => {
    const file = $(e.target)[0].files[0];
    if (!checkExtention(file.name, file.size)) {
      return false;
    }

    const formData = new FormData();
    formData.append("image", file);
    $.ajax({
      url        : "/main-image",
      method     : "POST",
      processData: false,
      contentType: false,
      dataType   : "json",
      data       : formData,
      success    : (response) => {
        console.log(response, "main 반환값");
        const endodeUrl = encodeURIComponent(response.uploadPath + "/" + "main" + "/" + response.fileName);
        const url = `/image-print?filename=${endodeUrl}&sort=main`;
        $(".main-image").css("background-image", `url(${url})`);
      },
      error      : (status) => {
        console.log(status);
      }
    })
  })


  const setPost = (sort, postnum) => {
    const mainTitle = $("input[name='title']").val();
    const subTitle = $("input[name='subtitle']").val();
    const mainTitleImgUrl = $(".main-image").css("background-image");
    const mainTitleImg = mainTitleImgUrl.slice(mainTitleImgUrl.indexOf("/image"), mainTitleImgUrl.lastIndexOf("\""));
    const content = editor.getHTML();

    if (mainTitle.length === 0) {
      alert("제목 적어라")
    }
    // 콘텐츠 입력 유효성 검사
    if (editor.getMarkdown().length < 1) {
      alert("에디터 내용 입력 ㄱ");
      throw new Error("editor content is required");
    }

    let publicYn = $("input[name='secret']:checked").val();
    if (typeof publicYn == "undefined") {
      publicYn = false;
    } else {
      publicYn = true;
    }

    let category = $("input[name='cate']:checked").val();
    if (typeof category === "undefined") {
      alert("카테고리 하나 이상 선택")
      return;
    }

    if (sort === "add") {
      const data = {
        mainTitle,
        subTitle,
        content,
        category,
        publicYn,
        mainTitleImg,
        favorite: 0
      };

      $.ajax({
        url        : "/post",
        method     : "POST",
        data       : JSON.stringify(data),
        contentType: "application/json",
        success    : (response) => {
          console.log(response, " 데이터 저장 후 반환");
          alert(`${response} 글 저장 완료`);
          location.href = `/post/${response}`;
        },
        error      : (status) => {
          console.error(status);
        }
      });
    } else {
      const data = {
        postnum,
        mainTitle,
        subTitle,
        content,
        category,
        publicYn,
        mainTitleImg,
      };

      $.ajax({
        url        : `/post/${postnum}`,
        method     : "PUT",
        data       : JSON.stringify(data),
        contentType: "application/json",
        success    : (response) => {
          console.log(response, " 데이터 저장 후 반환");
          alert(`${response} 글 저장 완료`);
          location.href = `/post/${response}`;
        },
        error      : (status) => {
          console.error(status);
        }
      });
    }
  }


// 글 저장, 수정, 삭제
  $(".post-btn > button:last-child").click((e) => {
    if ($(e.target).text() === "글쓰기") {
      setPost("add");
    } else {
      setPost("modify", JSON.parse($(".postResponse").val()).postnum);
    }
  })


// 수정시 콘텐츠 세팅
  editor.setHTML(JSON.parse($(".postResponse").val()).content);


})
